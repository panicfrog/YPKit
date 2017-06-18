//
//  MVMessageFenceStatus.m
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageFenceStatus.h"

@implementation MVMessageFenceStatus

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId breachStatus:(uint8_t)breachStatus breachCount:(uint16_t)breachCount breachType:(uint8_t)breachType breachTime:(uint32_t)breachTime {
  if ((self = [super init])) {
    mavlink_msg_fence_status_pack(systemId, componentId, &(self->_message), breachStatus, breachCount, breachType, breachTime);
  }
  return self;
}

- (uint8_t)breachStatus {
  return mavlink_msg_fence_status_get_breach_status(&(self->_message));
}

- (uint16_t)breachCount {
  return mavlink_msg_fence_status_get_breach_count(&(self->_message));
}

- (uint8_t)breachType {
  return mavlink_msg_fence_status_get_breach_type(&(self->_message));
}

- (uint32_t)breachTime {
  return mavlink_msg_fence_status_get_breach_time(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, breachStatus=%d, breachCount=%d, breachType=%d, breachTime=%d", [super description], [self breachStatus], [self breachCount], [self breachType], [self breachTime]];
}

@end
