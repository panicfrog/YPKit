//
//  keyshareTcpSocket.h
//  BLE_KEYSHARE
//
//  Created by keyshare-maoxue on 15/12/15.
//  Copyright © 2015年 keyshare-maoxue. All rights reserved.
//


//  SocketDemoViewController.h
//  SocketDemo
//
//  Created by xiang xiva on 10-7-10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GCDAsyncSocket.h"
#define SRV_CONNECTED 0
#define SRV_CONNECT_SUC 1
#define SRV_CONNECT_FAIL 2


typedef void(^ receDataBlk )(NSData *m_Data);
typedef void(^ didConnectBlk) (void);
typedef void(^ didDisConnectBlk) (void);

@interface keyshareTcpSocket : NSObject <GCDAsyncSocketDelegate>
{
    GCDAsyncSocket   *_asyncSocket;
}

@property (nonatomic,strong) receDataBlk m_blk;
@property (nonatomic,strong) didConnectBlk didConnect_blk;
@property (nonatomic,strong) didDisConnectBlk didDisConnect_blk;


-(int)connectServer: (NSString *) hostIP port:(int) hostPort;
-(void)sendMessage:(NSData *)m_Data;
-(void)disConnect;


@end
