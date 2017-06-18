//
//  MVMessagePing.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessagePing.h"

@implementation MVMessagePing

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec seq:(uint32_t)seq targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent {
  if ((self = [super init])) {
    mavlink_msg_ping_pack(systemId, componentId, &(self->_message), timeUsec, seq, targetSystem, targetComponent);
  }
  return self;
}

- (uint64_t)timeUsec {
  return mavlink_msg_ping_get_time_usec(&(self->_message));
}

- (uint32_t)seq {
  return mavlink_msg_ping_get_seq(&(self->_message));
}

- (uint8_t)targetSystem {
  return mavlink_msg_ping_get_target_system(&(self->_message));
}

- (uint8_t)targetComponent {
  return mavlink_msg_ping_get_target_component(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeUsec=%lld, seq=%d, targetSystem=%d, targetComponent=%d", [super description], [self timeUsec], [self seq], [self targetSystem], [self targetComponent]];
}

@end
