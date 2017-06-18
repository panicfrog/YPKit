//
//  keyshareManageTcpAndMavlink.m
//  BLE_KEYSHARE
//
//  Created by keyshare-maoxue on 15/12/22.
//  Copyright © 2015年 keyshare-maoxue. All rights reserved.
//

#import "MavlinkProtocol.h"
#import "MVMavlink.h"
#import "keyshareTcpSocket.h"
#import <CoreLocation/CoreLocation.h>

typedef struct {
    double latitude;
    double longitude;
    int height;
    int delayTime;
    int action;
} SelectAnnotation;


typedef struct {
    double latitude;
    double longitude;
    int height;
    int delayTime;
    int m_action;
    int seq;
    float speed;
} current_mission_item_t;


uint8_t log_data[90];


@interface MavlinkProtocol ()   <MVMavlinkDelegate>
{
    current_mission_item_t current_mission_item;
    
}


//socket和协议类
@property (retain, nonatomic) MVMavlink *m_mavlink;
@property keyshareTcpSocket *m_keyshareTcpSocket_Send;
@property keyshareTcpSocket *m_keyshareTcpSocket_Rece;

@property  uint8_t  isReceHeartBeat; //是否收到收到心跳包
@property  uint8_t  isOpenMoitor;  //是否开启了监听线程
@property  uint8_t  isFirstHeartBeat;//是否连接成功后收到的第一个心跳包


#pragma mark  状态标记

@property  uint8_t  ack_message_type;           //用来做是否解锁判断 =2 value==1解锁成功 value==2解锁失败
@property  uint8_t ack_message_value;
@property  uint8_t isDisArm;                    //监控当前状态是否能解锁


@property  uint8_t isConnSocket;                //SOCKET连接是否正常
@property  uint8_t first_ndoor_or_outdoor_flag; //连接后第一个心跳包的状态，标记当前飞机情况


@property float homeLat;
@property float homeLng;
@property float  flyDist;

@property uint8_t compass_cali_flag;
@property uint8_t compass_cali_xy;
@property uint8_t compass_cali_z;

@property uint8_t arm_status;
@property  uint16_t battery;

@property uint8_t m_missionAck;

@property uint8_t lose_packet_flag;
@property uint8_t lose_count;


@property int16_t log_count;    //当前日志总数
@property int16_t currentlog_capt_count;//当前日志总容量
@property  NSArray *current_log_data; //返回的请求的日志内容,请求一次内容，合的到99个字节，直到拿完，形成文件即为日志
//得到指定日志的size
-(void)request_Log_size:(uint16_t) log_id;


//航迹总数和读取到的当前作务项
@property  uint16_t current_mission_count;
@property   (nonatomic, strong)  NSMutableArray *current_mission_array;

//监控线程
-(void)openMoitor;
-(void)closeMoitor;

//连接
-(int)connectSendServer:(NSString *)hostIP port:(int)hostPort;
-(int)connectReceServer:(NSString *)hostIP port:(int)hostPort;

//收到心跳包的处理
-(void)receHeartBeatProcess:(id<MVMessage>)message;
// 初始函数
-(MavlinkProtocol *)initWithSocketandmavlink;

//发送心跳数据
-(void)sendHeart;

//socket断开的处理
-(void)processSocketDisConnect;

//76号控制指令
-(void)command_long:(uint16_t) _command m_param1:(float)_param1 m_param2:(float)_param2 m_param3:(float)_param3 m_param4:(float)_param4 m_param5:(float)_param5 m_param6:(float)_param6 m_param7:(float)_param7;

-(void)send_test;

//模式切换
-(void)set_Mode:(uint32_t)_mode;

@end

@implementation MavlinkProtocol

NSString * const sepcDate = @"2017-07-20";//这里设置指定时间
- (int)compareDate{
    
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateTime=[formatter stringFromDate:[NSDate date]];
    
    NSDate *date1 = [formatter dateFromString:dateTime];
    NSDate *date2 = [formatter dateFromString:sepcDate];
    
    NSComparisonResult result = [date1 compare:date2];
    
    if (result == NSOrderedDescending) {
        //            NSLog(@"当前时间大于指定时间");
        return 1;
        
    }else if (result == NSOrderedAscending){
        //            NSLog(@"当前时间小于指定时间");
        return -1;
        
    }else{
        //             NSLog(@"当前时间等于指定时间");
        return 0;
        
    }
    
}




//单例模式实现
+(MavlinkProtocol *)shareManage
{
    static MavlinkProtocol *shareManage=nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        shareManage= [[MavlinkProtocol alloc]initWithSocketandmavlink];
    });
    
    return shareManage;
}


//发送的端口 初始化时设置接收的端口
- (BOOL)mavlink:(MVMavlink *)mavlink shouldWriteData:(NSData *)data {
    
    
    //maoxue modify
    //  [self.m_keyshareTcpSocket_Send sendMessage:data];
    
    [self.m_keyshareTcpSocket_Rece sendMessage:data];
    
    
    //   NSLog(@"==%@",data);
    
    return 1;
}


//初始化
-(MavlinkProtocol *)initWithSocketandmavlink
{
    self=[super init];
    
    //实始化TCP 协议和mavlink接口类
    if (self) {
        
        __weak MavlinkProtocol *weakSelf = self;
        
        self.m_keyshareTcpSocket_Send=[[keyshareTcpSocket alloc]init];
        self.m_keyshareTcpSocket_Rece=[[keyshareTcpSocket alloc]init];
        
        
        self.m_mavlink = [[MVMavlink alloc] init];
        self.m_mavlink.delegate = self;
        
        //设置接收连接的block   这里是收到数据处理的block
        
        self.m_keyshareTcpSocket_Rece.m_blk=^(NSData *data){
             //  char *bytes = (char *)[data bytes];
            //  NSLog(@"收到到了数据＝ %s",[data bytes]);
    
           // NSString *str1 = data.description;
           //
           // NSString *str2 = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            
            //NSLog(@"收到到了数据1＝ %@",str1);
           //  NSLog(@"收到到了数据2＝ %@",str2);

            if (weakSelf.receveData!=nil) {
                weakSelf.receveData(data);
            }
            
            // 处理接收到的数据
            [weakSelf.m_mavlink parseData:data];
            
        };
        
        //设置发送和接收 断开的block
        self.m_keyshareTcpSocket_Rece.didDisConnect_blk=^(void){
            [weakSelf processSocketDisConnect];
            
            if (weakSelf.connectRes!=nil) {
                weakSelf.connectRes(0);
            }
            
        };
        
        self.m_keyshareTcpSocket_Send.didDisConnect_blk=^(void){
            [weakSelf processSocketDisConnect];
            
            if (weakSelf.connectRes!=nil) {
                
                weakSelf.connectRes(0);
            }
        };
        
        //设置连接socket成功的block
        self.m_keyshareTcpSocket_Rece.didConnect_blk=^(void){
            [weakSelf processSocketDidConnect];
            
        };
        
        self.m_keyshareTcpSocket_Rece.didConnect_blk=^(void){
            [weakSelf processSocketDidConnect];
            
        };
        
        self.custom_mode=-1;
        self.alt=0;
        self.battery=0;
        self.num_stat=0;
        self.disArm=0;
        //用来做是否解锁判断 ==2 value==1解锁成功 value==2解锁失败 0-7位存type  7-15存value
        self.ack_message_type=0;
        self.ack_message_value=0;
        //监控当前状态是否能解锁
        self.isDisArm=0;
        //和飞控连接是否是有效连接
        self.isConnFightSystem=0;
        self.isReceHeartBeat=0;
        self.isOpenMoitor=0;
        
        self.isFirstHeartBeat=0;
        
        self.isConnSocket=0;
        self.isTakeOff=0;
        
        
        self.wpnav_loit_speed=0;
        
        self.yaw=0;
        self.pitch=0;
        self.roll=0;
        
        self.xmag=0; /*< X Magnetic field (raw)*/
        self.ymag=0; /*< Y Magnetic field (raw)*/
        self.zmag=0; /*< Z Magnetic field (raw)*/
        
        self.airspeed=0;//空速
        self.climb=0;//上升速度
        
        self.voltage_battery=0;//当前电压
        self.current_battery=0;//当前电流
        self.battery_remaining=0;//电池余量
        
        /*
         飞控序列号:SYS_REQ    类型:ap_int32
         飞控版本号:SYS_REV		类型:ap_int32
         臂灯控制:LED_CONTROL	类型:ap_int8   0关闭 1打开  臂灯控制对应的硬件接口需要确定
         低电量操作比率：FS_BATT_PRCENT类型:ap_int8   0-100不同比率，低于设置指定比率时进行低电量操作。
         */
        self.sys_req=-1;
        self.sys_rev=-1;
        self.led_control=-1;
        self.fs_batt_prcent=-1;
        
        self.fs_batt_voltage=0;
        self.batt_capacity=0;
        self.fs_mssion_higth=0;
        
        
        //通道原始值
        self.ch1=0;
        self.ch2=0;
        self.ch3=0;
        self.ch4=0;
        
        self.rc1_mac=0;
        self.rc1_min=0;
        self.rc2_mac=0;
        self.rc2_min=0;
        self.rc3_mac=0;
        self.rc3_min=0;
        self.rc4_mac=0;
        self.rc4_min=0;
        
        //监听标记置为0
        self.isOpenMoitor=0;
        
        self.log_count=-1;
        
        
        
        self.current_mission_count=-1;
        self.current_mission_array=[[NSMutableArray alloc]init];
        
        self.m_missionAck=16;
        
        self.lose_packet_flag=0;
        self.lose_count=0;
        self.lose_packet=0;
    }
    
    return self;
}



-(int)connectSendServer:(NSString *)hostIP port:(int)hostPort
{
    //因为测试只用一个连接，所以先只建一个连接，以后再改
    int result=[_m_keyshareTcpSocket_Send connectServer:hostIP port:hostPort];
    //  [_m_keyshareTcpSocket_Rece connectServer:@"192.168.2.3" port:11520];
    
    if (result==0) {
        NSLog(@"连接初始化失败");
    }
    
    if (result==1) {
        NSLog(@"连接初始化成功");
    }
    
    return result;
}




-(int)connectReceServer:(NSString *)hostIP port:(int)hostPort
{
    //因为测试只用一个连接，所以先只建一个连接，以后再改
    int result=[_m_keyshareTcpSocket_Rece connectServer:hostIP port:hostPort];
    
    if (result==0) {
        NSLog(@"连接初始化失败");
    }
    
    if (result==1) {
        NSLog(@"连接初始化成功");
    }
    
    return result;
}

-(void)disConnect
{
    [_m_keyshareTcpSocket_Send disConnect];
    [_m_keyshareTcpSocket_Rece disConnect];
}

//socket断开
-(void)processSocketDisConnect
{
    //socket断开的处理
    //关闭心跳监听
    self.isOpenMoitor=0;
    self.isConnSocket=0;
}

//socket连接成功
-(void)processSocketDidConnect
{
    self.isConnSocket=1;
}

#pragma mark 基础
//心跳数据 _type==1室内 _type==2室外
-(void)sendHeart;
{
    MVMessageHeartbeat *message = [[MVMessageHeartbeat alloc] initWithSystemId:255.0 componentId:190.0 type:0 autopilot:0.0 baseMode:0.0 customMode:0.0 systemStatus:0.0 mavlink_version:1.0];
    
    [self.m_mavlink sendMessage:message];
}

//76号控制指令
-(void)command_long:(uint16_t) _command m_param1:(float)_param1 m_param2:(float)_param2 m_param3:(float)_param3 m_param4:(float)_param4 m_param5:(float)_param5 m_param6:(float)_param6 m_param7:(float)_param7
{
    MVMessageCommandLong *message=[[MVMessageCommandLong alloc]initWithSystemId:255.0 componentId:190.0 targetSystem:1 targetComponent:1 command:_command confirmation:0 param1:_param1 param2:_param2 param3:_param3 param4:_param4 param5:_param5 param6:_param6 param7:_param7];
    
    [self.m_mavlink sendMessage:message];
    
}


//模式切换
-(void)set_Mode:(uint32_t)_mode
{
    MVMessageSetMode *message=[[MVMessageSetMode alloc]initWithSystemId:255 componentId:190 targetSystem:1 baseMode:1 customMode:_mode];
    
    [self.m_mavlink sendMessage:message];
}


#pragma mark 操作

typedef NS_ENUM(uint16_t, Test)
{
    Test1= 1 << 0,
    Test2= 1 << 1,
    Test3= 1 << 2,
    Test4= 1 << 3,
    Test5= 1 << 4,
    Test6= 1 << 5,
    Test7= 1 << 6,
    Test8= 1 << 7,
    Test9= 1 << 8,
    Test10= 1 << 9,
    Test11= 1 << 10,
    Test12= 1 << 11,
    Test13= 1 << 12,
    Test14= 1 << 13,
    Test15= 1 << 14,
    Test16= 1 << 15,
};

//让飞控执行指定动作
-(void)exceuteCommand:(BOOL)bit1 _bit2:(BOOL)bit2 _bit3:(BOOL)bit3 _bit4:(BOOL)bit4 _bit5:(BOOL)bit5 _bit6:(BOOL)bit6 _bit7:(BOOL)bit7 _bit8:(BOOL)bit8 _bit9:(BOOL)bit9 _bit10:(BOOL)bit10 _bit11:(BOOL)bit11 _bit12:(BOOL)bit12 _bit13:(BOOL)bit13 _bit14:(BOOL)bit14 _bit15:(BOOL)bit15 _bit16:(BOOL)bit16


{
    Test tes;
    
    if (bit1) {
        tes|=Test1;
    }
    
    if (bit2) {
        tes|=Test2;
    }
    
    if (bit3) {
        tes|=Test3;
    }
    
    if (bit4) {
        tes|=Test4;
    }
    
    if (bit5) {
        tes|=Test5;
    }
    
    if (bit6) {
        tes|=Test6;
    }
    
    if (bit7) {
        tes|=Test7;
    }
    
    if (bit8) {
        tes|=Test8;
    }
    
    if (bit9) {
        tes|=Test9;
    }
    
    if (bit10) {
        tes|=Test10;
    }
    
    if (bit11) {
        tes|=Test11;
    }
    
    if (bit12) {
        tes|=Test12;
    }
    
    if (bit13) {
        tes|=Test13;
    }
    
    if (bit14) {
        tes|=Test14;
    }
    
    if (bit15) {
        tes|=Test15;
    }
    
    if (bit16) {
        tes|=Test16;
    }
    
    
   // NSLog(@"==%d",tes);
    
    
    MVMessageexceute *message=[[MVMessageexceute alloc]initWithSystemId:255 componentId:190 m_command:0 m_reserve1:tes m_reserve2:0] ;
    
    [self.m_mavlink sendMessage:message];
}

//起飞
-(void)startFly{
    
    
    __weak typeof(self) weakSelf=self;
    
    dispatch_queue_t concurrentQueue = dispatch_queue_create("my.concurrent.queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(concurrentQueue, ^{
        
        
        //起飞部份
        [weakSelf set_Mode:4];
        [NSThread sleepForTimeInterval:0.2];
        
        [weakSelf arm];
        [NSThread sleepForTimeInterval:0.2];
        /*
         int count=0;
         
         while (count< 10) {
         [NSThread sleepForTimeInterval:0.2];
         count++;
         //已经解锁
         if (weakSelf.islock==0) {
         NSLog(@"切指导模式");
         [weakSelf set_Mode:4];
         break;
         }
         }*/
        
        [NSThread sleepForTimeInterval:0.2];
        
        [weakSelf command_long:22 m_param1:0 m_param2:0 m_param3:0 m_param4:0 m_param5:0 m_param6:0 m_param7:10];
        
        [NSThread sleepForTimeInterval:2];
        
        
    });
}


//自稳
-(void)stab
{
   [self set_Mode:0];
    /*
  //  FE  10 D5 01 01 10 F8 04 E4 42 4A 66 B4 41 00 00 C8 42 02 00 00 00 13 8E
    Byte byte[] = { 0xfE,0x10,0xD5 ,0x01 ,0x01 ,0x10 ,0xF8 ,0x04 ,0xE4 ,0x42 ,0x4A ,0x66 ,0xB4 ,0x41 ,0x00 ,0x00 ,0xC8 ,0x42 ,0x02 ,0x00 ,0x00 ,0x00 ,0x13 ,0x8E};
    NSData *adata = [[NSData alloc] initWithBytes:byte length:24];
    [self.m_mavlink parseData:adata];
*/
}

//返航
-(void)rtl
{
    [self set_Mode:6];
}

//着陆
-(void)land
{
    [self set_Mode:9];
}

//悬停
-(void)loiter
{
    [self set_Mode:5];
}

-(void)guide{
    [self set_Mode:4];
}

-(void)auto{
    [self set_Mode:3];
}
//请求数据流
-(void)request_Data_Stream
{
    MVMessageRequestDataStream *message=[[MVMessageRequestDataStream alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 reqStreamId:0 reqMessageRate:2 startStop:1];
    
    [self.m_mavlink sendMessage:message];
    
}

//请求家的位置
-(void)request_Home{
    
    MVMessageMissionRequest *message=[[MVMessageMissionRequest alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 seq:0];
    
    [self.m_mavlink sendMessage:message];
}


//解锁
-(void)arm
{
    [self command_long:400 m_param1:1 m_param2:0 m_param3:0 m_param4:0 m_param5:0 m_param6:0 m_param7:0];
}




#pragma mark  航迹规划

//写入总数

-(void)set_Mission_Count:(uint32_t)count
{
    MVMessageMissionCount *message=[[MVMessageMissionCount alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 count:count];
    
    [self.m_mavlink sendMessage:message];
}


//写入单条航迹作务

-(void)set_Mission_Item:(uint16_t)m_seq _frame:(uint8_t)m_frame _command:(uint16_t)m_command _current:(uint8_t)m_current _autocontinue:(uint8_t)m_autocontinue _param1:(float)m_param1  _param2:(float)m_param2   _param3:(float)m_param3   _param4:(float)m_param4    _x:(float)m_x  _y:(float)m_y  _z:(float)m_z
{
    
    MVMessageMissionItem *message=[[MVMessageMissionItem alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 seq:m_seq frame:m_frame command:m_command current:m_current autocontinue:m_autocontinue param1:m_param1 param2:m_param2 param3:m_param3 param4:m_param4 x:m_x y:m_y z:m_z];
    
    [self.m_mavlink sendMessage:message];
}

//读取总数
-(void)readMissionCount
{
    MVMessageMissionRequestList *message=[[MVMessageMissionRequestList alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1];
    
    [self.m_mavlink sendMessage:message];
}

//读取作务项
-(void)readMissionItem:(uint16_t)m_seq
{
    MVMessageMissionRequest *message=[[MVMessageMissionRequest alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 seq:m_seq];
    
    [self.m_mavlink sendMessage:message];
    
}
//清除航点
-(void)clearMission{
    
    [self set_Mission_Count:0];
}
/*
if (weakSelf.writeMissionAck !=NULL) {
    weakSelf.writeMissionAck(weakSelf.m_missionAck);
}
 */
//写入数组传过来的航迹
-(void)writeMission:(NSMutableArray *) mission{
    
    __weak typeof(self) weakSelf=self;
    
    
    dispatch_queue_t concurrentQueue = dispatch_queue_create("my.concurrent.queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(concurrentQueue, ^{
        
        //第一步，写入航迹计数
        //写入航点计数  包含默认家的位置和起飞和最后一个位置返航
        NSUInteger wayPointCount=mission.count+2;
        NSLog(@"写入的总航点数%lu",mission.count + 2);
        [weakSelf set_Mission_Count:(int32_t)wayPointCount];
        [NSThread sleepForTimeInterval:0.2];
        
        //第二步 第一个航点 为家的位置
        [weakSelf set_Mission_Item:0 _frame:0 _command:16 _current:0 _autocontinue:1 _param1:0 _param2:0 _param3:0 _param4:0 _x:0 _y:0 _z:0];
        
        [NSThread sleepForTimeInterval:0.2];
        
        /*
         //第三步 在家的位置起飞  _param1为高度，默主为10米
         [weakSelf set_Mission_Item:1 _frame:0 _command:22 _current:0 _autocontinue:1 _param1:10 _param2:0 _param3:0 _param4:0 _x:0 _y:0 _z:0];
         
         [NSThread sleepForTimeInterval:0.2];
         */
        
        //第四步 依次写入航点
        for (int i=0; i<mission.count; i++) {
            //读取
            NSValue *value = mission[i];
            current_mission_item_t tmp;
            [value getValue:&tmp];
            //将值写入航点
            
            NSLog(@"写入的航迹 delayTime=%d  action=%d  _latitude=%f _longitude =%f height =%d",tmp.delayTime,tmp.m_action,tmp.latitude,tmp.longitude,tmp.height);
            
            //  [weakSelf set_Mission_Item:i+1 _frame:3 _command:16 _current:0 _autocontinue:1 _param1:tmp.delayTime _param2:tmp.action _param3:0 _param4:0 _x:tmp.latitude _y:tmp.longitude _z:tmp.height];
            
            
            [weakSelf set_Mission_Item:i+1 _frame:3 _command:16 _current:0 _autocontinue:1 _param1:10 _param2:tmp.m_action _param3:tmp.speed _param4:0 _x:tmp.latitude _y:tmp.longitude _z:tmp.height];
            [NSThread sleepForTimeInterval:0.2];
        }
        //第五步 在最后一个位置 写入返航
        [weakSelf set_Mission_Item:mission.count+1  _frame:3 _command:20 _current:0 _autocontinue:1 _param1:0 _param2:0 _param3:0 _param4:0 _x:0 _y:0 _z:0];
    });
}


//读取航迹
-(void)readMission{
    
    self.current_mission_count=-1;
    [self.current_mission_array removeAllObjects];
    //第一步 读取航点总数
    [self readMissionCount];
    
    __weak typeof(self) weakSelf=self;
    
    dispatch_queue_t concurrentQueue = dispatch_queue_create("my.concurrent.queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(concurrentQueue, ^{
        //等一秒，等飞控返回
        [NSThread sleepForTimeInterval:0.5];
        //如果有航点
        if (weakSelf.current_mission_count >0) {
            //第二步 开始读取任务  第一个点家的位置 第二个点起飞点  最后一个点返航不用读，只读航点 用来在地图上显示
            for (int i=1;i< weakSelf.current_mission_count-1;i++) {
                // NSLog(@"i==%d count=%d",i,weakSelf.current_mission_count);
                
                [weakSelf readMissionItem:i];
                //等一秒钟等待飞控返回
                [NSThread sleepForTimeInterval:0.5];
                NSValue *value;
                
                value = [NSValue valueWithBytes: &current_mission_item objCType: @encode(current_mission_item_t)];
                
                [weakSelf.current_mission_array addObject:value];
                
              
                NSLog(@"库拿到的航点 %f %f",current_mission_item.latitude,current_mission_item.longitude);            }
        }
        
        //第三步 将读取到的结果 通过block返回
        dispatch_async(dispatch_get_main_queue(), ^{
            if(weakSelf.returnCurrentMission){
                weakSelf.returnCurrentMission(weakSelf.current_mission_array, weakSelf.current_mission_count);
            }
        });
    });
}

-(void)startMission{
    
    
    __weak typeof(self) weakSelf=self;
    
    dispatch_queue_t concurrentQueue = dispatch_queue_create("my.concurrent.queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(concurrentQueue, ^{
        
        
        //起飞部份
        [weakSelf set_Mode:4];
        [NSThread sleepForTimeInterval:0.2];
        
        [weakSelf arm];
        [NSThread sleepForTimeInterval:0.2];
        /*
         int count=0;
         
         while (count< 10) {
         [NSThread sleepForTimeInterval:0.2];
         count++;
         //已经解锁
         if (weakSelf.islock==0) {
         NSLog(@"切指导模式");
         [weakSelf set_Mode:4];
         break;
         }
         }*/
        
        [NSThread sleepForTimeInterval:0.2];
        
        [weakSelf command_long:22 m_param1:0 m_param2:0 m_param3:0 m_param4:0 m_param5:0 m_param6:0 m_param7:10];
        
        [NSThread sleepForTimeInterval:2];
        
        //起飞部份
        
        
        [weakSelf set_Mode:3];
    });
}

//启动航迹不自动起飞
-(void)startMissionNoTakeOff
{
   [self set_Mode:3];

}
//起飞
-(void)takeoff:(int) height
{
    __weak typeof(self) weakSelf=self;
    
    dispatch_queue_t concurrentQueue = dispatch_queue_create("my.concurrent.queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(concurrentQueue, ^{
        //起飞部份
        [weakSelf set_Mode:4];
        [NSThread sleepForTimeInterval:0.2];
        
        [weakSelf arm];
        [NSThread sleepForTimeInterval:0.2];
        /*
         int count=0;
         
         while (count< 10) {
         [NSThread sleepForTimeInterval:0.2];
         count++;
         //已经解锁
         if (weakSelf.islock==0) {
         NSLog(@"切指导模式");
         [weakSelf set_Mode:4];
         break;
         }
         }*/
        
        [NSThread sleepForTimeInterval:0.2];
        
        [weakSelf command_long:22 m_param1:0 m_param2:0 m_param3:0 m_param4:0 m_param5:0 m_param6:0 m_param7:height];
        
        [NSThread sleepForTimeInterval:2];
     });
}

#pragma mark 加速度六面校准部份

-(void)accel_Cali_Step:(int)count
{
    MVMessageCommandAck *message=[[MVMessageCommandAck alloc]initWithSystemId:255 componentId:190 command:1 result:count];
    [self.m_mavlink sendMessage:message];
}
//开启accel校准
-(void)openAccelCali
{
    [self command_long:241 m_param1:0 m_param2:0 m_param3:0 m_param4:0 m_param5:1 m_param6:0 m_param7:0];
}


#pragma mark 参数部份


//指南针校准值写入
-(void)write:(int) off_x _off_y:(int)off_y _off_z:(int)off_z
{
    
}

/*
 //设置参数
 -(void)setParam:(float)m_wp_Loiter_Speed _fence_Alt:(float)m_fence_Alt _fence_Radio:(float)m_fence_Radio _fence_Action:(float)m_fence_Action _rtl_Alt:(float)m_rtl_Alt _fs_Batt:(float)m_fs_Batt  _fs_Thr:(float)m_fs_Thr _fence_Enable:(float)m_fence_Enable{
 
 
 char *paramID="WPNAV_LOIT_SPEED";
 MVMessageParamSet *message=[[MVMessageParamSet alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramValue:m_wp_Loiter_Speed paramType:8];
 [self.m_mavlink sendMessage:message];
 
 paramID="RTL_ALT";
 message=[[MVMessageParamSet alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramValue:m_rtl_Alt paramType:8];
 [self.m_mavlink sendMessage:message];
 
 paramID="FS_BATT_ENABLE";
 message=[[MVMessageParamSet alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramValue:m_fs_Batt paramType:8];
 [self.m_mavlink sendMessage:message];
 
 paramID="FS_THR_ENABLE";
 message=[[MVMessageParamSet alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramValue:m_fs_Thr paramType:8];
 [self.m_mavlink sendMessage:message];
 
 paramID="FENCE_ENABLE";
 message=[[MVMessageParamSet alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramValue:m_fence_Enable paramType:8];
 [self.m_mavlink sendMessage:message];
 
 paramID="FENCE_ALT_MAX";
 message=[[MVMessageParamSet alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramValue:m_fence_Alt paramType:8];
 [self.m_mavlink sendMessage:message];
 
 paramID="FENCE_RADIUS";
 message=[[MVMessageParamSet alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramValue:m_fence_Radio paramType:8];
 [self.m_mavlink sendMessage:message];
 
 paramID="FENCE_ACTION";
 message=[[MVMessageParamSet alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramValue:m_fence_Action paramType:8];
 [self.m_mavlink sendMessage:message];
 
 
 }
 */

-(void)readParam{
    
    char *paramID="WPNAV_LOIT_SPEED";
    MVMessageParamRequestRead *message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    
    [self.m_mavlink sendMessage:message];
    
    paramID="RTL_ALT";
    message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
    
    paramID="FS_BATT_ENABLE";
    message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
    
    paramID="FS_THR_ENABLE";
    message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
    
    paramID="FENCE_ENABLE";
    message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
    
    paramID="FENCE_ALT_MAX";
    message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
    
    paramID="FENCE_RADIUS";
    message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
    
    paramID="FENCE_ACTION";
    message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
    
    paramID="SYS_REQ";
    message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
    
    paramID="SYS_REV";
    message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
    
    paramID="LED_CONTROL";
    message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
    
    paramID="FS_BATT_PRCENT";
    message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
    
    paramID="FS_BATT_VOLTAGE";
    message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
    
    paramID="BATT_CAPACITY";
    message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
    
    
    paramID="FS_MISSION_HIGTH";
    message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
    
    [self readParamRC1_MAX];
    [self readParamRC1_MIN];
    [self readParamRC2_MAX];
    [self readParamRC2_MIN];
    [self readParamRC3_MAX];
    [self readParamRC3_MIN];
    [self readParamRC4_MAX];
    [self readParamRC4_MIN];
}

/*
 飞控序列号:SYS_REQ    类型:ap_int32
 飞控版本号:SYS_REV		类型:ap_int32
 臂灯控制:LED_CONTROL	类型:ap_int8   0关闭 1打开  臂灯控制对应的硬件接口需要确定
 低电量操作比率：FS_BATT_PRCENT类型:ap_int8   0-100不同比率，低于设置指定比率时进行低电量操作。
 */
-(void)setParamSYS_REQ:(int)m_sys_req
{
    char *paramID="SYS_REQ";
    MVMessageParamSet *message=[[MVMessageParamSet alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramValue:m_sys_req paramType:8];
    [self.m_mavlink sendMessage:message];
}

-(void)readParamSYS_REQ
{
    char *paramID="SYS_REQ";
    MVMessageParamRequestRead *message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
    
    
}

-(void)setParamSYS_REV:(int)m_sys_rev
{
    char *paramID="SYS_REV";
    MVMessageParamSet  *message=[[MVMessageParamSet alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramValue:m_sys_rev paramType:8];
    [self.m_mavlink sendMessage:message];
    
}
-(void)readParamSYS_REV
{
    char *paramID="SYS_REV";
    MVMessageParamRequestRead *message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
}


-(void)setParamLED_CONTROL:(int)m_led_control
{
    char *paramID="LED_CONTROL";
    MVMessageParamSet  *message=[[MVMessageParamSet alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramValue:m_led_control paramType:8];
    [self.m_mavlink sendMessage:message];
}

-(void)readParamLED_CONTROL
{
    char *paramID="LED_CONTROL";
    MVMessageParamRequestRead *message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
}

-(void)setParamFS_BATT_PRCENT:(int)m_fs_batt_prcent
{
    char *paramID="FS_BATT_PRCENT";
    MVMessageParamSet  *message=[[MVMessageParamSet alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramValue:m_fs_batt_prcent paramType:8];
    [self.m_mavlink sendMessage:message];
    
}

-(void)readParamFS_BATT_PRCENT
{
    char *paramID="FS_BATT_PRCENT";
    MVMessageParamRequestRead *message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
}

-(void)setParamWp_Loiter_Speed:(float)m_wp_Loiter_Speed
{
    char *paramID="WPNAV_LOIT_SPEED";
    MVMessageParamSet *message=[[MVMessageParamSet alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramValue:m_wp_Loiter_Speed paramType:8];
    [self.m_mavlink sendMessage:message];
}

-(void)readParamwp_Loiter_Speed
{
    char *paramID="WPNAV_LOIT_SPEED";
    MVMessageParamRequestRead *message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    
    [self.m_mavlink sendMessage:message];
}

-(void)setParamFence_Alt:(float)m_fence_Alt
{
    char *paramID="FENCE_ALT_MAX";
    MVMessageParamSet *message=[[MVMessageParamSet alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramValue:m_fence_Alt paramType:8];
    [self.m_mavlink sendMessage:message];
}

-(void)readParamFence_Alt;
{
    char *paramID="FENCE_ALT_MAX";
    MVMessageParamRequestRead *message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
}

-(void)setParamFence_Radio:(float)m_fence_Radio
{
    char *paramID="FENCE_RADIUS";
    MVMessageParamSet *message=[[MVMessageParamSet alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramValue:m_fence_Radio paramType:8];
    [self.m_mavlink sendMessage:message];
}

-(void)readParamFence_Radio
{
    char *paramID="FENCE_RADIUS";
    MVMessageParamRequestRead *message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
}

-(void)setParamFence_Action:(float)m_fence_Action
{
    char *paramID="FENCE_ACTION";
    MVMessageParamSet *message=[[MVMessageParamSet alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramValue:m_fence_Action paramType:8];
    [self.m_mavlink sendMessage:message];
}

-(void)readParamFence_Action
{
    char *paramID="FENCE_ACTION";
    MVMessageParamRequestRead *message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
}

-(void)setParamRtl_Alt:(float)m_rtl_Alt
{
    
    char *paramID="RTL_ALT";
    MVMessageParamSet *message=[[MVMessageParamSet alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramValue:m_rtl_Alt paramType:8];
    [self.m_mavlink sendMessage:message];
    
}

-(void)readParamRtl_Alt
{
    char *paramID="RTL_ALT";
    MVMessageParamRequestRead *message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
}

-(void)setParamFs_Batt :(float)m_fs_Batt
{
    char *paramID="FS_BATT_ENABLE";
    MVMessageParamSet *message=[[MVMessageParamSet alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramValue:m_fs_Batt paramType:8];
    [self.m_mavlink sendMessage:message];
    
    
}

-(void)readParamFs_Batt
{
    char *paramID="FS_BATT_ENABLE";
    MVMessageParamRequestRead *message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
}

-(void)setParamFs_Thr :(float)m_fs_Thr
{
    char *paramID="FS_THR_ENABLE";
    MVMessageParamSet *message=[[MVMessageParamSet alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramValue:m_fs_Thr paramType:8];
    [self.m_mavlink sendMessage:message];
}

-(void)readParamFs_Thr
{
    char *paramID="FS_THR_ENABLE";
    MVMessageParamRequestRead *message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
}

-(void)setParamFence_Enable :(float)m_fence_Enable
{
    char *paramID="FENCE_ENABLE";
    MVMessageParamSet *message=[[MVMessageParamSet alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramValue:m_fence_Enable paramType:8];
    [self.m_mavlink sendMessage:message];
}

-(void)readParamFence_Enable
{
    char *paramID="FENCE_ENABLE";
    MVMessageParamRequestRead *message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
}


-(void)setParamFS_BATT_VOLTAGE :(float)m_fs_Batt_voltage
{
    char *paramID="FS_BATT_VOLTAGE";
    MVMessageParamSet *message=[[MVMessageParamSet alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramValue:m_fs_Batt_voltage paramType:8];
    [self.m_mavlink sendMessage:message];
}

-(void)readParamFS_BATT_VOLTAGE
{
    char *paramID="FS_BATT_VOLTAGE";
    MVMessageParamRequestRead *message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];

}


-(void)setParamBATT_CAPACITY :(float)m_batt_capacity
{
    char *paramID="BATT_CAPACITY";
    MVMessageParamSet *message=[[MVMessageParamSet alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramValue:m_batt_capacity paramType:8];
    [self.m_mavlink sendMessage:message];
}

-(void)readParamBATT_CAPACITY
{
    char *paramID="BATT_CAPACITY";
    MVMessageParamRequestRead *message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
}



-(void)setParamFS_MISSION_HIGTH:(float)m_fs_mission_higth
{
    char *paramID="FS_MISSION_HIGTH";
    MVMessageParamSet *message=[[MVMessageParamSet alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramValue:m_fs_mission_higth paramType:8];
    [self.m_mavlink sendMessage:message];
}

-(void)readParamFS_MISSION_HIGTH{
    char *paramID="FS_MISSION_HIGTH";
    MVMessageParamRequestRead *message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
}


-(void)readParamRC1_MAX
{
    char *paramID="RC1_MAX";
    MVMessageParamRequestRead *message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
}
-(void)readParamRC1_MIN
{
    char *paramID="RC1_MIN";
    MVMessageParamRequestRead *message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
}

-(void)readParamRC2_MAX
{
    char *paramID="RC2_MAX";
    MVMessageParamRequestRead *message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
}

-(void)readParamRC2_MIN
{
    char *paramID="RC2_MIN";
    MVMessageParamRequestRead *message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
}
-(void)readParamRC3_MAX
{
    char *paramID="RC3_MAX";
    MVMessageParamRequestRead *message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
}
-(void)readParamRC3_MIN
{
    char *paramID="RC3_MIN";
    MVMessageParamRequestRead *message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
}
-(void)readParamRC4_MAX
{
    char *paramID="RC4_MAX";
    MVMessageParamRequestRead *message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];
}
-(void)readParamRC4_MIN
{
    char *paramID="RC4_MIN";
    MVMessageParamRequestRead *message=[[MVMessageParamRequestRead alloc]initWithSystemId:255 componentId:190 targetSystem:1 targetComponent:1 paramId:paramID paramIndex:-1];
    [self.m_mavlink sendMessage:message];

}

-(void)goToPoint:(float)_lat m_lon:(float)_lon m_alt:(float)_flyalt
{

    __weak typeof(self) weakSelf=self;
    
    
    dispatch_queue_t concurrentQueue = dispatch_queue_create("my.concurrent.queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(concurrentQueue, ^{
        
        //切指导模式
        if (_custom_mode != 4) {
            [weakSelf set_Mode:4];
            [NSThread sleepForTimeInterval:2];
        }
        

        if(weakSelf.custom_mode!=4)
        {
            NSLog(@"模式不是指导！");
        }
        
        MVMessageMissionItem *message=[[MVMessageMissionItem alloc]initWithSystemId:255.0 componentId:190.0 targetSystem:1 targetComponent:1 seq:0 frame:3 command:16 current:2 autocontinue:1 param1:0 param2:0 param3:0 param4:0 x:_lat y:_lon z:_flyalt];
        
        NSLog(@"指点飞行传递的经度＝%f 纬度=%f 高度=%f",_lat,_lon,_flyalt);
        
        [weakSelf.m_mavlink sendMessage:message];
    });


}

-(void)goToPointParam:(float)_lat m_lon:(float)_lon m_alt:(float)_flyalt seq:(uint16_t)seq frame:(uint8_t)frame command:(uint16_t)command current:(uint8_t)current autocontinue:(uint8_t)autocontinue
{
    //切指导模式
    if (_custom_mode != 4) {
        [self set_Mode:4];
    }
    

    MVMessageMissionItem *message=[[MVMessageMissionItem alloc]initWithSystemId:255.0 componentId:190.0 targetSystem:1 targetComponent:1 seq:seq frame:frame command:command current:current autocontinue:autocontinue param1:0 param2:0 param3:0 param4:0 x:_lat y:_lon z:_flyalt];
    
    [self.m_mavlink sendMessage:message];
}


//开启和关闭磁罗盘校准
-(void)magComm:(int)command
{
    [self command_long:command m_param1:0 m_param2:0 m_param3:0 m_param4:0 m_param5:0 m_param6:0 m_param7:0];
}

#pragma mark  日志



-(void)request_Log_count
{
    MVMessageLogRequestList *message=[[MVMessageLogRequestList alloc]initWithSystemId:255 componentId:190 _start:0 _end:0xffff _target_system:1 _target_component:1];
    
    [self.m_mavlink sendMessage:message];
    
}

-(void)request_Log_size:(uint16_t)log_id
{
    MVMessageLogRequestList *message=[[MVMessageLogRequestList alloc]initWithSystemId:255 componentId:190 _start:log_id _end:log_id _target_system:1 _target_component:1];
    
    [self.m_mavlink sendMessage:message];
    
}


-(void)request_Log_Data:(uint16_t) id{
    
    if(id < 1 || id > 0xffff )
    {
        return;
    }
    //请求指令id的数据 ofs填0拿到大小
    MVMessageLogRequestData *message=[[MVMessageLogRequestData alloc]initWithSystemId:255 componentId:190 _target_system:1 _target_component:1 _ofs:0 _count:0xffffffff _id:id];
    
    [self.m_mavlink sendMessage:message];
}


#pragma mark 协议实现部份

//接收到完整数据包的协议的方法的实现
- (void)mavlink:(MVMavlink *)mavlink didGetMessage:(id<MVMessage>)message {
    
    __weak typeof(self) weakSelf=self;
    
    
    MVMessage *m_mess=message;
    uint8_t current_seq=[m_mess current_seq];
    static uint8_t last_seq;
    
    
   // NSLog(@"current_seq==%d msgid==%d 当前模式=%d",current_seq,[m_mess messageId],self.custom_mode);
    
    if (current_seq==0) {
        self.lose_packet_flag=1;
    }
    
    if (self.lose_packet_flag==1) {
        
        //说明超过255了
        if(current_seq < last_seq)
        {
            self.lose_packet=self.lose_count;
            last_seq=current_seq;
            self.lose_count=0;
        }else{
            //如果==0
            if (current_seq==0) {
                
                last_seq=current_seq;
                self.lose_count=0;
                
            }else{
                
                if(current_seq==255)
                {
                    self.lose_packet=self.lose_count;
                    // NSLog(@"lose_count==%d",lose_count);
                    
                    self.lose_count=0;
                    last_seq=0;
                }else{
                    self.lose_count=self.lose_count+(current_seq-last_seq)-1;
                    last_seq=current_seq;
                }
            }
        }

    }
    
    
    if([message isKindOfClass:[MVMessageHeartbeat class]]) {
        
        [self receHeartBeatProcess:message];
    }
    
    //日志相关的
    
    if([message isKindOfClass:[MVMessageLogEntry class]]) {
        
        
        MVMessageLogEntry *m_LogEntry=message;
        
        NSLog(@"日志返回 size=%d",[m_LogEntry size]);
        NSLog(@"日志返回 id=%d",[m_LogEntry id]);
        NSLog(@"日志返回 num_logs=%d",[m_LogEntry num_logs]);
        NSLog(@"日志返回 last_log_num=%d",[m_LogEntry last_log_num]);
        
        self.log_count=[m_LogEntry num_logs];
        
        if (self.return_Log_Count !=NULL) {
            self.return_Log_Count([m_LogEntry num_logs]);
        }
    }
    
    if([message isKindOfClass:[MVMessageLogData class]]) {
        
        MVMessageLogData *m_LogData=message;
        
        /*
         - (uint32_t)ofs;
         
         
         - (uint16_t)id;
         
         
         - (uint8_t)count;
         
         
         - (void) data:(uint8_t *)data ;
         */
        
        NSLog(@"日志数据返回 ofs=%d",[m_LogData ofs]);
        NSLog(@"日志数据返回 id=%d",[m_LogData id]);
        NSLog(@"日志数据返回 count=%d",[m_LogData count]);
        
        [m_LogData data:log_data];
        
        
        //char string[50];
        //mavlink_msg_statustext_get_text(&(self->_message), (char *)&string);
        
        /*
         for (int i=0; i< 90; i++) {
         printf("\n");
         printf("%d",log_data[i]);
         printf("\n");
         }
         */
        
        if (self.return_Log_Data !=NULL) {
            self.return_Log_Data(log_data,[m_LogData ofs],[m_LogData id],[m_LogData count]);
        }
        
    }

    
    if([message isKindOfClass:[MVMessageCommandAck class]])
    {
        MVMessageCommandAck *m_CommandAck=message;
        if (self.magReturn !=NULL) {
            self.magReturn(m_CommandAck.command,m_CommandAck.result);
        }
    }
    //到达作务点的信息返回
    
    if([message isKindOfClass:[MVMessagemission_message class]]) {
        
        MVMessagemission_message *m_mission_message=message;
        //到达任务点的，任务信息返回
        
        NSLog(@"收到到达指定点的消息");
        
        if (self.missionMessageReturn !=NULL) {
            self.missionMessageReturn(m_mission_message.x,m_mission_message.y,m_mission_message.z,m_mission_message.reserve1,m_mission_message.seq);
        }
        

    }
    
    
    if ([message isKindOfClass:[MVMessageMissionAck class]]) {
    
        MVMessageMissionAck *m_missionAck=message;
        
        /*
        typedef enum MAV_MISSION_RESULT
        {
            MAV_MISSION_ACCEPTED=0,
            MAV_MISSION_ERROR=1,
        } MAV_MISSION_RESULT;
        */
        NSLog(@"收到写入的返回=%d",[m_missionAck type]);
        self.m_missionAck=m_missionAck.type;
        
        if (weakSelf.writeMissionAck !=NULL) {
            weakSelf.writeMissionAck(weakSelf.m_missionAck);
        }
    }
    
    if ([message isKindOfClass:[MVMessageexceutereturn class]]) {
        
        
     //   NSLog(@"12345");
        
        BOOL bit1;
        BOOL bit2;
        BOOL bit3;
        BOOL bit4;
        BOOL bit5;
        BOOL bit6;
        BOOL bit7;
        BOOL bit8;
        BOOL bit9;
        BOOL bit10;
        BOOL bit11;
        BOOL bit12;
        BOOL bit13;
        BOOL bit14;
        BOOL bit15;
        BOOL bit16;
        BOOL bit17;
        BOOL bit18;
        
        MVMessageexceutereturn *m_exceutereturn=message;
        
        Test test=m_exceutereturn.reserve1;
        
        if(test & Test1)
        {
            bit1=1;
        }else{
            
            bit1=0;
        }
        
        if(test & Test1)
        {
            bit1=1;
        }else{
            
            bit1=0;
        }
        if(test & Test2)
        {
            bit2=1;
        }else{
            
            bit2=0;
        }
        if(test & Test3)
        {
            bit3=1;
        }else{
            
            bit3=0;
        }
        if(test & Test4)
        {
            bit4=1;
        }else{
            
            bit4=0;
        }
        
        if(test & Test5)
        {
            bit5=1;
        }else{
            
            bit5=0;
        }
        
        if(test & Test6)
        {
            bit6=1;
        }else{
            
            bit6=0;
        }
        
        if(test & Test7)
        {
            bit7=1;
        }else{
            
            bit7=0;
        }
        
        if(test & Test8)
        {
            bit8=1;
        }else{
            
            bit8=0;
        }
        
        if(test & Test9)
        {
            bit9=1;
        }else{
            
            bit9=0;
        }
        
        if(test & Test10)
        {
            bit10=1;
        }else{
            
            bit10=0;
        }
        
        if(test & Test11)
        {
            bit11=1;
        }else{
            
            bit11=0;
        }
        
        if(test & Test12)
        {
            bit12=1;
        }else{
            
            bit12=0;
        }
        
        if(test & Test13)
        {
            bit13=1;
        }else{
            
            bit13=0;
        }
        
        if(test & Test14)
        {
            bit14=1;
        }else{
            
            bit14=0;
        }
        
        if(test & Test15)
        {
            bit15=1;
        }else{
            
            bit15=0;
        }
        
        if(test & Test16)
        {
            bit16=1;
        }else{
            
            bit16=0;
        }
        
        Test test2=m_exceutereturn.reserve2;
        
        if(test2 & Test1)
        {
            bit17=1;
        }else{
            
            bit17=0;
        }
        
        if(test2 & Test1)
        {
            bit18=1;
        }else{
            
            bit18=0;
        }
        
      //  NSLog(@"bit1==%dbit2==%dbit03==%dbit4==%dbit5==%dbit6==%dbit7==%dbi8t==%dbit9==%dbit10==%dbit11==%dbit12==%dbit13==%dbit14==%dbit15==%dbit16==%dbit17==%dbit18==%d",bit1,bit2,bit3,bit4,bit5,bit6,bit7,bit8,bit9,bit10,bit11,bit12,bit13,bit14,bit15,bit16,bit17,bit18);
        
        if (self.exceuteReturn!=nil) {
            self.exceuteReturn(bit1,bit2,bit3,bit4,bit5,bit6,bit7,bit8,bit9,bit10,bit11,bit12,bit13,bit14,bit15,bit16,bit17,bit18);
        }
    }
    
    if([message isKindOfClass:[MVMessageSysStatus class]]) {
        
        MVMessageSysStatus *m_SysStatus=message;
        
        self.current_battery=[m_SysStatus currentBattery];
        self.voltage_battery=[m_SysStatus voltageBattery];
        self.battery_remaining=[m_SysStatus batteryRemaining];
    }
    
    if([message isKindOfClass:[MVMessageLogEntry class]]) {
        
        MVMessageLogEntry *m_logEntry=message;
        
      //  NSLog(@"last log==%d  log==%d",[m_logEntry last_log_num],[m_logEntry num_logs]);
        self.log_count=[m_logEntry num_logs];
        
    }
    
    
    
    if ([message isKindOfClass:[MVMessageRawImu class]]) {
        MVMessageRawImu *m_RawImu=message;
        self.xmag=[m_RawImu xmag];
        self.ymag=[m_RawImu ymag];
        self.zmag=[m_RawImu zmag];
    }
    
    
    if ([message isKindOfClass:[MVMessageVfrHud class]]) {
        MVMessageVfrHud *m_HudMessage=message;
        
        self.alt=[m_HudMessage alt];
        self.ground_speed=[m_HudMessage groundspeed];
        self.airspeed=[m_HudMessage airspeed];
        self.climb=[m_HudMessage climb];
        
        //  NSLog(@"收到高度 %f",self.alt);
        
    }
    
    //收到当前航迹总数
    if ([message isKindOfClass:[MVMessageMissionCount class]]) {
        MVMessageMissionCount *m_Mission_Count=message;
        self.current_mission_count=[m_Mission_Count count];
    }
    
    //收到的当前的作务
    if ([message isKindOfClass:[MVMessageMissionItem class]]) {
        MVMessageMissionItem *m_Mission_Item=message;
        
        current_mission_item.m_action=[m_Mission_Item param2];
        current_mission_item.latitude=[m_Mission_Item x];
        current_mission_item.longitude=[m_Mission_Item y];
        current_mission_item.delayTime=[m_Mission_Item param1];
        current_mission_item.seq=[m_Mission_Item seq];
        current_mission_item.height=[m_Mission_Item z];
        current_mission_item.speed=[m_Mission_Item param2];
        
        if ([m_Mission_Item seq]==0) {
            self.home_latitude=[m_Mission_Item x];
            self.home_longitude=[m_Mission_Item y];
            
            NSLog(@"home1＝＝%f==%f", self.home_latitude,self.home_longitude);
            if (self.returnHome !=NULL) {
                self.returnHome([m_Mission_Item x],[m_Mission_Item y]);
            }
        }
        
      //  NSLog(@"home2＝＝%f==%f", self.home_latitude,self.home_longitude);
    }
    
    
    
    if ([message isKindOfClass:[MVMessageGpsRawInt class]]) {
        MVMessageGpsRawInt *m_GpsRawInt=message;
        
        self.latitude=(double)([m_GpsRawInt lat])/10000000.0;
        self.longitude=(double)([m_GpsRawInt lon])/10000000.0;
        self.num_stat=[m_GpsRawInt  satellitesVisible];
    }
    
    //253
    if ([message isKindOfClass:[MVMessageStatustext class]]){
        MVMessageStatustext *m_Status=message;
        
        self.warText =  m_Status.text;
        
        if (weakSelf.warMessRtn !=NULL) {
            weakSelf.warMessRtn(m_Status.text);
        }
        
    }
    
    //通道原始值
    if ([message isKindOfClass:[MVMessageRcChannelsRaw class]]){
        MVMessageRcChannelsRaw *m_channel=message;
        self.ch1 =m_channel.chan1Raw;
        self.ch2 =m_channel.chan2Raw;
        self.ch3=m_channel.chan3Raw;
        self.ch4 =m_channel.chan4Raw;
        
    }
    
    if ([message isKindOfClass:[MVMessageStatustext class]]){
        MVMessageStatustext *m_Status=message;
        self.warText =m_Status.text;
    }
    
    //读取到的参数值
    if ([message isKindOfClass:[MVMessageParamValue class]]){
        
        MVMessageParamValue *m_k2message=message;
        
        //   NSLog(@"收到了param=%@==%f",m_k2message.paramId,m_k2message.paramValue);
        
        if ([[m_k2message.paramId substringToIndex:16] isEqualToString:@"WPNAV_LOIT_SPEED"]) {
            self.wpnav_loit_speed=m_k2message.paramValue;
        }
        
        
        if ([[m_k2message.paramId substringToIndex:7] isEqualToString:@"RTL_ALT"]) {
            //  NSLog(@"/////// RTL_ALT＝＝%f",m_k2message.paramValue);
            self.rtl_Alt=m_k2message.paramValue;
        }
        
        if ([[m_k2message.paramId substringToIndex:14] isEqualToString:@"FS_BATT_ENABLE"]) {
           // NSLog(@"/////// FS_BATT_ENABLE＝＝%f",m_k2message.paramValue);
            self.fs_Batt=m_k2message.paramValue;
        }
        
        if ([[m_k2message.paramId substringToIndex:13] isEqualToString:@"FS_THR_ENABLE"]) {
            self.fs_Thr=m_k2message.paramValue;
        }
        
        if ([[m_k2message.paramId substringToIndex:12] isEqualToString:@"FENCE_ENABLE"]) {
            self.fs_Enable=m_k2message.paramValue;
        }
        
        if ([[m_k2message.paramId substringToIndex:13] isEqualToString:@"FENCE_ALT_MAX"]) {
            self.fence_Alt=m_k2message.paramValue;
        }
        
        if ([[m_k2message.paramId substringToIndex:12] isEqualToString:@"FENCE_RADIUS"]) {
            self.fence_Radius=m_k2message.paramValue;
        }
        
        if ([[m_k2message.paramId substringToIndex:12] isEqualToString:@"FENCE_ACTION"]) {
            self.fence_Action=m_k2message.paramValue;
        }
        
        
        if ([[m_k2message.paramId substringToIndex:7] isEqualToString:@"SYS_REQ"]) {
            self.sys_req=m_k2message.paramValue;
        }
        
        if ([[m_k2message.paramId substringToIndex:7] isEqualToString:@"SYS_REV"]) {
            self.sys_rev=m_k2message.paramValue;
        }
        
        if ([[m_k2message.paramId substringToIndex:13] isEqualToString:@"LED_CONTROL"]) {
            self.led_control=m_k2message.paramValue;
        }
        
        if ([[m_k2message.paramId substringToIndex:14] isEqualToString:@"FS_BATT_PRCENT"]) {
            self.fs_batt_prcent=m_k2message.paramValue;
        }
        
        if ([[m_k2message.paramId substringToIndex:14] isEqualToString:@"FS_BATT_VOLTAGE"]) {
            self.fs_batt_voltage=m_k2message.paramValue;
        }
        
        if ([[m_k2message.paramId substringToIndex:13] isEqualToString:@"BATT_CAPACITY"]) {
            self.batt_capacity=m_k2message.paramValue;
        }
        
        
        
        if ([[m_k2message.paramId substringToIndex:16] isEqualToString:@"FS_MISSION_HIGTH"]) {
            self.fs_mssion_higth=m_k2message.paramValue;
        }
        
        if ([[m_k2message.paramId substringToIndex:7] isEqualToString:@"RC1_MAX"]) {
            self.rc1_mac=m_k2message.paramValue;
        }
        if ([[m_k2message.paramId substringToIndex:7] isEqualToString:@"RC1_MIN"]) {
            self.rc1_min=m_k2message.paramValue;
        }
        
        if ([[m_k2message.paramId substringToIndex:7] isEqualToString:@"RC2_MAX"]) {
            self.rc2_mac=m_k2message.paramValue;
        }
        if ([[m_k2message.paramId substringToIndex:7] isEqualToString:@"RC2_MIN"]) {
            self.rc2_min=m_k2message.paramValue;
        }
        
        if ([[m_k2message.paramId substringToIndex:7] isEqualToString:@"RC3_MAX"]) {
            self.rc3_mac=m_k2message.paramValue;
        }
        if ([[m_k2message.paramId substringToIndex:7] isEqualToString:@"RC3_MIN"]) {
            self.rc3_min=m_k2message.paramValue;
        }
        
        if ([[m_k2message.paramId substringToIndex:7] isEqualToString:@"RC4_MAX"]) {
            self.rc4_mac=m_k2message.paramValue;
        }
        if ([[m_k2message.paramId substringToIndex:7] isEqualToString:@"RC4_MIN"]) {
            self.rc4_min=m_k2message.paramValue;
        }
    }
}



-(void)receHeartBeatProcess:(id<MVMessage>)message
{
    MVMessageHeartbeat *m_Heartbeat=message;
    
 //   __weak typeof(self) weakSelf=self;
    //NSLog(@"收到心跳包 是否锁定=%d  能否解锁=%d  是否连接=%d istakeoff=%d alt=%f 当前模式为%d",weakSelf.islock,weakSelf.isDisArm,weakSelf.isConnFightSystem,weakSelf.isTakeOff,weakSelf.alt,self.custom_mode);
    //这个监听是否锁定
    
    //锁定
    if (([m_Heartbeat baseMode] & 128) != 128) {
        if (self.disArm!=0) {
            self.disArm=0;
        }
        
    }
    //解锁
    if (([m_Heartbeat baseMode] & 128) == 128) {
        if (self.disArm!=1) {
            self.disArm=1;
        }
    }
    
    
    //起飞了，只记录一次起飞时的gps点
    if ([m_Heartbeat systemStatus]== 4) {
        
        if ( self.isTakeOff!=1) {
            self.isTakeOff=1;
        }
    }else{
        if ( self.isTakeOff!=0) {
            self.isTakeOff=0;
        }
    }
    
    
    self.custom_mode=[m_Heartbeat customMode];
    
    
    //心跳标记置位
    self.isReceHeartBeat=1;
    
    //连接有效
    self.isConnFightSystem=1;
    
    
  //  NSLog(@"连接");
    if (self.connectRes!=nil) {
        self.connectRes(1);
    }
    
}


-(void)openHeartBeatSend
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        
        while (_isOpenMoitor) {
            [NSThread sleepForTimeInterval:1];
            [self sendHeart];
        }
        
    });
}

//监控线程
-(void)openMoitor
{
    __block int loopCount=0;
    __weak typeof(self) weakSelf=self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        while (1) {
            loopCount++;
            
            [NSThread sleepForTimeInterval:1];
            
            if (loopCount > CONN_LOSE_TIME) {
                
                if (weakSelf.isReceHeartBeat==0) {
                    //失去连接
                    weakSelf.isConnFightSystem=0;
                    NSLog(@"失去连接");
                    weakSelf.isOpenMoitor=0;//关闭监听
                    if (weakSelf.connectRes!=nil) {
                        weakSelf.connectRes(0);
                    }
                    break;
                }else{
                    //连接有效
                    weakSelf.isConnFightSystem=1;
                    
                    NSLog(@"连接");
                    if (weakSelf.connectRes!=nil) {
                        weakSelf.connectRes(1);
                    }
                }
                
                loopCount=0;
                
                //心跳包置位为未收到有效心跳包
                weakSelf.isReceHeartBeat=0;
            }
            
            //心跳包发送
            //   [self sendHeart];
        }
    });
}


-(void)closeMoitor
{
    
}

-(void)connect: (NSString *) hostIP port:(int) hostPort;
{
    
    //maoxue modify
    
    // [self connectReceServer:@"192.168.1.1" port:8080];
    // [self connectSendServer:@"192.168.1.1" port:8888];
    
    int result = [self compareDate];
    if (result== 1) {
        
        NSLog(@"error call me");
        return;
    }else if(result== -1){
        //当前时间小于指定时间的时候就连接，把连接代码放这里
      //  NSLog(@"当前时间小于指定时间");
    }else{
      //  NSLog(@"当前时间等于指定时间");
        
    }

    [self connectReceServer:hostIP port:hostPort];
    
    if (self.isOpenMoitor==0) {
        self.isOpenMoitor=1;
        
        [self openMoitor];
    }
    
    self.lose_packet_flag=0;
    self.lose_count=0;
}

-(void)send_test
{
    Byte byte[] = {0xfe,0x14,0x02,0xff,0xbe,0x14,0xff,0xff,0x01,0x01,0x57,0x50,0x4e,0x41,0x56,0x5f,0x4c,0x4f,0x49,0x54,0x5f,0x53,0x50,0x45,0x45,0x44,0x02,0xb7};
    
    NSData *data = [[NSData alloc] initWithBytes:byte length:28];
    
    [_m_keyshareTcpSocket_Send sendMessage:data];
}

#pragma mark  根据经纬度计算两点之间的距离

const double RADIUS_OF_EARTH = 6378137.0;

#define degreesToRadians(x) ((x)*(M_PI/180.0))//用于将度数转化成弧度
#define radiansToDegress(x) ((x)*(180/M_PI))


-(double)LantitudeLongitudeDist:(double)lng1 other_Lat:(double)lat1 self_Lon:(double)lng2 self_Lat:(double)lat2{
    
    CLLocation *locA = [[CLLocation alloc] initWithLatitude:lat1 longitude:lng1];
    
    CLLocation *locB = [[CLLocation alloc] initWithLatitude:lat2 longitude:lng2];
    
    CLLocationDistance distance = [locA distanceFromLocation:locB];
    
    return distance;
}

@end
