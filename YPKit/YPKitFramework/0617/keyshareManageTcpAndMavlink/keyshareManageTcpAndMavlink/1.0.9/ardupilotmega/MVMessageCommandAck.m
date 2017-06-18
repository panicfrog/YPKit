//
//  MVMessageCommandAck.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageCommandAck.h"

@implementation MVMessageCommandAck

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId command:(uint16_t)command result:(uint8_t)result {
  if ((self = [super init])) {
    mavlink_msg_command_ack_pack(systemId, componentId, &(self->_message), command, result);
  }
  return self;
}

- (uint16_t)command {
  return mavlink_msg_command_ack_get_command(&(self->_message));
}

- (uint8_t)result {
  return mavlink_msg_command_ack_get_result(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, command=%d, result=%d", [super description], [self command], [self result]];
}

@end
