//
//  keyshareTcpSocket.m
//  BLE_KEYSHARE
//
//  Created by keyshare-maoxue on 15/12/15.
//  Copyright © 2015年 keyshare-maoxue. All rights reserved.
//

#import "keyshareTcpSocket.h"

@implementation keyshareTcpSocket

- (int) connectServer: (NSString *) hostIP port:(int) hostPort{
    
            NSLog(@"连接.........");
            if (!_asyncSocket)
            {
                _asyncSocket=nil;
            }
        
            _asyncSocket = [[GCDAsyncSocket alloc]initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
            _asyncSocket.delegate = self;
        
            NSError *error = nil;
            [_asyncSocket connectToHost:hostIP onPort:hostPort withTimeout:-1 error:&error];
            if (error!=nil) {
                NSLog(@"连接失败：%@",error);
                return 0;
            }else{
                NSLog(@"连接成功");
                return 1;
            }
            return 0;
}

-(void)disConnect
{

    [_asyncSocket disconnect];
}

#pragma mark socket delegate

- (void)socket:(GCDAsyncSocket *)sock willDisconnectWithError:(NSError *)err
{
    NSLog(@"willDisconnectWithError");

    if (err) {
        NSLog(@"错误报告：%@",err);
    }else{
        NSLog(@"连接工作正常");
    }
    
    NSLog(@"断开");
    _asyncSocket = nil;
}

- (void)socketDidDisconnect:(GCDAsyncSocket*)sock withError:(NSError*)err {
    
    NSLog(@"连接失败 !!!!!");
    
    // 断开连接
    if (_didDisConnect_blk) {
         _didDisConnect_blk();
    }
   
}


- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag
{
   // NSLog(@"did write");
}

- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port
{
    NSLog(@"完成连接 didConnectToHost");
    
    if (_didConnect_blk) {
        _didConnect_blk();
    }
    
    [sock readDataWithTimeout:-1 tag:0];
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
  //  NSLog(@"收到数据 didReadData");
    NSData *strData = [data subdataWithRange:NSMakeRange(0, [data length])];
    NSString *msg = [[NSString alloc] initWithData:strData encoding:NSASCIIStringEncoding];
    if(msg)
    {
//       NSLog(@"－－－－－－收到数据%@",msg);
//        NSLog(@"RECEIVE");
    }
    else
    {
        NSLog(@"错误");
    }
    
    //通过block传送
    if (_m_blk) {
         _m_blk(strData);
    }
   
    
    [sock readDataWithTimeout:-1 tag:0]; //一直监听网络
}

-(void)sendMessage:(NSData *)m_Data
{
    [_asyncSocket writeData:m_Data withTimeout:-1 tag:0];
    [_asyncSocket readDataWithTimeout:-1 tag:0];
}
@end





