//
//  MVMessageMissionItem.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageMissionItem.h"

@implementation MVMessageMissionItem

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent seq:(uint16_t)seq frame:(uint8_t)frame command:(uint16_t)command current:(uint8_t)current autocontinue:(uint8_t)autocontinue param1:(float)param1 param2:(float)param2 param3:(float)param3 param4:(float)param4 x:(float)x y:(float)y z:(float)z {
  if ((self = [super init])) {
    mavlink_msg_mission_item_pack(systemId, componentId, &(self->_message), targetSystem, targetComponent, seq, frame, command, current, autocontinue, param1, param2, param3, param4, x, y, z);
  }
  return self;
}

- (uint8_t)targetSystem {
  return mavlink_msg_mission_item_get_target_system(&(self->_message));
}

- (uint8_t)targetComponent {
  return mavlink_msg_mission_item_get_target_component(&(self->_message));
}

- (uint16_t)seq {
  return mavlink_msg_mission_item_get_seq(&(self->_message));
}

- (uint8_t)frame {
  return mavlink_msg_mission_item_get_frame(&(self->_message));
}

- (uint16_t)command {
  return mavlink_msg_mission_item_get_command(&(self->_message));
}

- (uint8_t)current {
  return mavlink_msg_mission_item_get_current(&(self->_message));
}

- (uint8_t)autocontinue {
  return mavlink_msg_mission_item_get_autocontinue(&(self->_message));
}

- (float)param1 {
  return mavlink_msg_mission_item_get_param1(&(self->_message));
}

- (float)param2 {
  return mavlink_msg_mission_item_get_param2(&(self->_message));
}

- (float)param3 {
  return mavlink_msg_mission_item_get_param3(&(self->_message));
}

- (float)param4 {
  return mavlink_msg_mission_item_get_param4(&(self->_message));
}

- (float)x {
  return mavlink_msg_mission_item_get_x(&(self->_message));
}

- (float)y {
  return mavlink_msg_mission_item_get_y(&(self->_message));
}

- (float)z {
  return mavlink_msg_mission_item_get_z(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, targetSystem=%d, targetComponent=%d, seq=%d, frame=%d, command=%d, current=%d, autocontinue=%d, param1=%f, param2=%f, param3=%f, param4=%f, x=%f, y=%f, z=%f", [super description], [self targetSystem], [self targetComponent], [self seq], [self frame], [self command], [self current], [self autocontinue], [self param1], [self param2], [self param3], [self param4], [self x], [self y], [self z]];
}

@end
