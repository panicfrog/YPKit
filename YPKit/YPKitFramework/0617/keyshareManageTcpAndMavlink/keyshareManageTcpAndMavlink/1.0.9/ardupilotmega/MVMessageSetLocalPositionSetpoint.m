//
//  MVMessageSetLocalPositionSetpoint.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageSetLocalPositionSetpoint.h"

@implementation MVMessageSetLocalPositionSetpoint

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent coordinateFrame:(uint8_t)coordinateFrame x:(float)x y:(float)y z:(float)z yaw:(float)yaw {
  if ((self = [super init])) {
    mavlink_msg_set_local_position_setpoint_pack(systemId, componentId, &(self->_message), targetSystem, targetComponent, coordinateFrame, x, y, z, yaw);
  }
  return self;
}

- (uint8_t)targetSystem {
  return mavlink_msg_set_local_position_setpoint_get_target_system(&(self->_message));
}

- (uint8_t)targetComponent {
  return mavlink_msg_set_local_position_setpoint_get_target_component(&(self->_message));
}

- (uint8_t)coordinateFrame {
  return mavlink_msg_set_local_position_setpoint_get_coordinate_frame(&(self->_message));
}

- (float)x {
  return mavlink_msg_set_local_position_setpoint_get_x(&(self->_message));
}

- (float)y {
  return mavlink_msg_set_local_position_setpoint_get_y(&(self->_message));
}

- (float)z {
  return mavlink_msg_set_local_position_setpoint_get_z(&(self->_message));
}

- (float)yaw {
  return mavlink_msg_set_local_position_setpoint_get_yaw(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, targetSystem=%d, targetComponent=%d, coordinateFrame=%d, x=%f, y=%f, z=%f, yaw=%f", [super description], [self targetSystem], [self targetComponent], [self coordinateFrame], [self x], [self y], [self z], [self yaw]];
}

@end
