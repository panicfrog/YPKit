//
//  MVMessageMissionSetCurrent.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageMissionSetCurrent.h"

@implementation MVMessageMissionSetCurrent

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent seq:(uint16_t)seq {
  if ((self = [super init])) {
    mavlink_msg_mission_set_current_pack(systemId, componentId, &(self->_message), targetSystem, targetComponent, seq);
  }
  return self;
}

- (uint8_t)targetSystem {
  return mavlink_msg_mission_set_current_get_target_system(&(self->_message));
}

- (uint8_t)targetComponent {
  return mavlink_msg_mission_set_current_get_target_component(&(self->_message));
}

- (uint16_t)seq {
  return mavlink_msg_mission_set_current_get_seq(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, targetSystem=%d, targetComponent=%d, seq=%d", [super description], [self targetSystem], [self targetComponent], [self seq]];
}

@end
