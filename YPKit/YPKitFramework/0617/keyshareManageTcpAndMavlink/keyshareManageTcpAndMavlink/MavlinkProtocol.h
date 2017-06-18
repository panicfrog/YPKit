//
//  keyshareManageTcpAndMavlink.h
//  BLE_KEYSHARE
//
//  Created by keyshare-maoxue on 15/12/22.
//  Copyright © 2015年 keyshare-maoxue. All rights reserved.
//



#import <Foundation/Foundation.h>

#define CONN_LOSE_TIME   5

@interface MavlinkProtocol : NSObject
#pragma mark 通信数据

@property  uint8_t isTakeOff;                  //是否起飞的标记
@property  uint32_t custom_mode;
@property  uint8_t disArm;                      //是否锁定状态  ==0锁定 ==1解锁
@property  uint8_t isConnFightSystem;           //和飞控连接是否是有效连接 1有效 0无效

@property  float    alt;//高度
@property  uint8_t  num_stat;//星数
@property double latitude;//
@property double longitude;//
@property float ground_speed;//地速

@property float roll;
@property float pitch;
@property float yaw;

//磁罗盘原始值
@property int16_t xmag; /*< X Magnetic field (raw)*/
@property int16_t ymag; /*< Y Magnetic field (raw)*/
@property int16_t zmag; /*< Z Magnetic field (raw)*/

@property float airspeed;//空速
@property float climb;//上升速度

@property uint16_t voltage_battery;//当前电压
@property int16_t current_battery;//当前电流
@property int8_t battery_remaining;//电池余量

@property uint8_t lose_packet;//丢包0-255

//通道原始值
@property uint16_t ch1;
@property uint16_t ch2;
@property uint16_t ch3;
@property uint16_t ch4;

@property double home_latitude;
@property double home_longitude;

@property (nonatomic,strong) NSString* warText;


#pragma mark 参数

//返回的相关参数的值
@property float wpnav_loit_speed;//悬停速度，用来限速
@property float fence_Alt;//围栏高度，用来限高
@property float fence_Radius;//围栏半径 用来限制飞行半径
@property float fence_Action;//围栏触发后的行为
@property float rtl_Alt;//返航高度
@property float fs_Batt;// 低电量行为  0关闭 1开启
@property float fs_Thr;//失控行为 0关闭  1返航 2继续执行任务 3着陆
@property float fs_Enable;// 围栏触发行为 0 警告 1返航或者着陆(飞控决定，电量不够就直接着陆)
@property float fs_batt_voltage;//设置电池电压保护，0为不开启，非0为当电池电压低于设定值后开启返航模式
@property float batt_capacity;//电池容量,APM将根据电流大小和放电时长计算剩余容量  mah
@property float fs_mssion_higth ;//任务高度参数

//通道的最大最小校准值
@property float rc1_min ;
@property float rc1_mac ;
@property float rc2_min ;
@property float rc2_mac ;
@property float rc3_min ;
@property float rc3_mac ;
@property float rc4_min ;
@property float rc4_mac ;


/*
 飞控序列号:SYS_REQ    类型:ap_int32
 飞控版本号:SYS_REV		类型:ap_int32
 臂灯控制:LED_CONTROL	类型:ap_int8   0关闭 1打开  臂灯控制对应的硬件接口需要确定
 低电量操作比率：FS_BATT_PRCENT类型:ap_int8   0-100不同比率，低于设置指定比率时进行低电量操作。
 */
@property int sys_req;
@property int sys_rev;
@property int led_control;
@property int fs_batt_prcent;



#pragma mark 日志相关
//

//得到日志总数
-(void)request_Log_count;

@property (nonatomic,strong)void (^return_Log_Count)(uint16_t logCount);

-(void)request_Log_Data:(uint16_t) id;

@property (nonatomic,strong)void (^return_Log_Data)(uint8_t *data,uint32_t ofs,uint16_t id,uint8_t count);


#pragma mark 指南针校准值写入
-(void)write:(int) off_x _off_y:(int)off_y _off_z:(int)off_z;

#pragma mark 单例模式实现
+(MavlinkProtocol *)shareManage;

#pragma mark 应用函数

-(void)connect: (NSString *) hostIP port:(int) hostPort;
-(void)disConnect;
//
-(void)startFly;
//自稳
-(void)stab;
//悬停
-(void)loiter;
//返航
-(void)rtl;
//着陆
-(void)land;
//请求数据流
-(void)request_Data_Stream;
//解锁
-(void)arm;
//指导
-(void)guide;
//自动
-(void)auto;

//请求家的位置
-(void)request_Home;



//设置参数

/*
 飞控序列号:SYS_REQ    类型:ap_int32
 飞控版本号:SYS_REV		类型:ap_int32
 臂灯控制:LED_CONTROL	类型:ap_int8   0关闭 1打开  臂灯控制对应的硬件接口需要确定
 低电量操作比率：FS_BATT_PRCENT类型:ap_int8   0-100不同比率，低于设置指定比率时进行低电量操作。
 */
-(void)setParamSYS_REQ:(int)m_sys_req;
-(void)readParamSYS_REQ;
-(void)setParamSYS_REV:(int)m_sys_rev;
-(void)readParamSYS_REV;
-(void)setParamLED_CONTROL:(int)m_led_control;
-(void)readParamLED_CONTROL;
-(void)setParamFS_BATT_PRCENT:(int)m_fs_batt_prcent;
-(void)readParamFS_BATT_PRCENT;

-(void)setParamWp_Loiter_Speed:(float)m_wp_Loiter_Speed;
-(void)readParamwp_Loiter_Speed;
-(void)setParamFence_Alt:(float)m_fence_Alt;
-(void)readParamFence_Alt;
-(void)setParamFence_Radio:(float)m_fence_Radio;
-(void)readParamFence_Radio;
-(void)setParamFence_Action:(float)m_fence_Action;
-(void)readParamFence_Action;
-(void)setParamRtl_Alt:(float)m_rtl_Alt;
-(void)readParamRtl_Alt;
-(void)setParamFs_Batt :(float)m_fs_Batt ;
-(void)readParamFs_Batt;
-(void)setParamFs_Thr :(float)m_fs_Thr ;
-(void)readParamFs_Thr;
-(void)setParamFence_Enable :(float)m_fence_Enable;
-(void)readParamFence_Enable;

-(void)setParamFS_BATT_VOLTAGE :(float)m_fs_Batt_voltage;
-(void)readParamFS_BATT_VOLTAGE;

-(void)setParamBATT_CAPACITY :(float)m_batt_capacity;
-(void)readParamBATT_CAPACITY;

-(void)setParamFS_MISSION_HIGTH:(float)m_fs_mission_higth;
-(void)readParamFS_MISSION_HIGTH;


-(void)readParamRC1_MAX;
-(void)readParamRC1_MIN;
-(void)readParamRC2_MAX;
-(void)readParamRC2_MIN;
-(void)readParamRC3_MAX;
-(void)readParamRC3_MIN;
-(void)readParamRC4_MAX;
-(void)readParamRC4_MIN;

//读取参数
-(void)readParam;

//飞到指定点
-(void)goToPoint:(float)_lat m_lon:(float)_lon m_alt:(float)_flyalt;

//飞到指定点
-(void)goToPointParam:(float)_lat m_lon:(float)_lon m_alt:(float)_flyalt seq:(uint16_t)seq frame:(uint8_t)frame command:(uint16_t)command current:(uint8_t)current autocontinue:(uint8_t)autocontinue;

//启动航迹自动起飞
-(void)startMission;
//启动航迹不自动起飞
-(void)startMissionNoTakeOff;
//起飞 height为起飞飞到的高度
-(void)takeoff:(int) height;


//写入航迹
-(void)writeMission:(NSMutableArray *) mission;

//读取航点
-(void)readMission;

//开启和关闭磁罗盘校准
-(void)magComm:(int)command;

//17
-(void)exceuteCommand:(BOOL)bit1 _bit2:(BOOL)bit2 _bit3:(BOOL)bit3 _bit4:(BOOL)bit4 _bit5:(BOOL)bit5 _bit6:(BOOL)bit6 _bit7:(BOOL)bit7 _bit8:(BOOL)bit8 _bit9:(BOOL)bit9 _bit10:(BOOL)bit10 _bit11:(BOOL)bit11 _bit12:(BOOL)bit12 _bit13:(BOOL)bit13 _bit14:(BOOL)bit14 _bit15:(BOOL)bit15 _bit16:(BOOL)bit16;//让飞控执行指定动作

//读取航点返回的block
@property (nonatomic,strong)void (^returnCurrentMission)(NSMutableArray *currentMission,int count);

#pragma mark 加速度六面校准部份
//开启accel校准
-(void)openAccelCali;
-(void)accel_Cali_Step:(int)count;

@property (nonatomic,strong)void (^connectRes)(NSInteger);

//18号
@property (nonatomic,strong)void (^exceuteReturn)(BOOL,BOOL,BOOL,BOOL,BOOL,BOOL,BOOL,BOOL,BOOL,BOOL,BOOL,BOOL,BOOL,BOOL,BOOL,BOOL,BOOL,BOOL);

//到达任务点的，任务信息返回16号
@property (nonatomic,strong)void (^missionMessageReturn)(float x,float y,float z,uint16_t reserve1,uint16_t seq);

@property (nonatomic,strong)void (^receveData)(NSData*);

//磁罗盘校准信息返回
@property (nonatomic,strong)void (^magReturn)(int command,int result);

//返回253号信息的block
@property (nonatomic,strong)void (^warMessRtn)(NSString* warText);

//写入作务的返回  0 success 1 error
@property (nonatomic,strong)void (^writeMissionAck)(uint8_t result);

//home点返回
@property (nonatomic,strong)void (^returnHome)(float x, float y);

@end


