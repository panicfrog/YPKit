//
//  MVMessageDataStream.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageDataStream.h"

@implementation MVMessageDataStream

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId streamId:(uint8_t)streamId messageRate:(uint16_t)messageRate onOff:(uint8_t)onOff {
  if ((self = [super init])) {
    mavlink_msg_data_stream_pack(systemId, componentId, &(self->_message), streamId, messageRate, onOff);
  }
  return self;
}

- (uint8_t)streamId {
  return mavlink_msg_data_stream_get_stream_id(&(self->_message));
}

- (uint16_t)messageRate {
  return mavlink_msg_data_stream_get_message_rate(&(self->_message));
}

- (uint8_t)onOff {
  return mavlink_msg_data_stream_get_on_off(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, streamId=%d, messageRate=%d, onOff=%d", [super description], [self streamId], [self messageRate], [self onOff]];
}

@end
