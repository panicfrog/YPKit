//
//  MVMessageMissionAck.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageMissionAck.h"

@implementation MVMessageMissionAck

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent type:(uint8_t)type {
  if ((self = [super init])) {
    mavlink_msg_mission_ack_pack(systemId, componentId, &(self->_message), targetSystem, targetComponent, type);
  }
  return self;
}

- (uint8_t)targetSystem {
  return mavlink_msg_mission_ack_get_target_system(&(self->_message));
}

- (uint8_t)targetComponent {
  return mavlink_msg_mission_ack_get_target_component(&(self->_message));
}

- (uint8_t)type {
  return mavlink_msg_mission_ack_get_type(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, targetSystem=%d, targetComponent=%d, type=%d", [super description], [self targetSystem], [self targetComponent], [self type]];
}

@end
