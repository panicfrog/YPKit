//
//  MVMavlink.m
//  MAVLink communications protocol built from ardupilotmega, common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMavlink.h"

@implementation MVMavlink

- (void)parseData:(NSData *)data {
  mavlink_message_t msg;
  mavlink_status_t status;
  char *bytes = (char *)[data bytes];

  for (NSInteger i = 0; i < [data length]; ++i) {
      
    //  uint8_t data=bytes[i];
    //  NSLog(@"==%d",data);
      
    if (mavlink_parse_char(MAVLINK_COMM_0, bytes[i], &msg, &status)) {
      // Packet received
        //通过传过来的msg，转换成id<message>
      id<MVMessage> message = [MVMessage messageWithCMessage:msg];
        
        //id<message>通过协议传给外面，外面再通过类型判断得到具体消息类型
        /*
        if([message isKindOfClass:[MVMessageHeartbeat class]]) {
            self.lastHeartbeat = message;
        }
         类似于这种
         */
      [_delegate mavlink:self didGetMessage:message];
    }
  }
}

- (BOOL)sendMessage:(id<MVMessage>)message {
 //   NSLog(@"???????=%@",[message data]);
  return [_delegate mavlink:self shouldWriteData:[message data]];
}

@end
