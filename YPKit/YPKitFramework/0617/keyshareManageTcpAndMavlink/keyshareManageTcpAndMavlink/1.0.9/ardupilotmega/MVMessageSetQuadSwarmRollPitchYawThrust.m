//
//  MVMessageSetQuadSwarmRollPitchYawThrust.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageSetQuadSwarmRollPitchYawThrust.h"

@implementation MVMessageSetQuadSwarmRollPitchYawThrust

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId group:(uint8_t)group mode:(uint8_t)mode ledRed:(uint8_t *)ledRed ledBlue:(uint8_t *)ledBlue ledGreen:(uint8_t *)ledGreen roll:(int16_t *)roll pitch:(int16_t *)pitch yaw:(int16_t *)yaw thrust:(uint16_t *)thrust {
  if ((self = [super init])) {
    mavlink_msg_set_quad_swarm_roll_pitch_yaw_thrust_pack(systemId, componentId, &(self->_message), group, mode, ledRed, ledBlue, ledGreen, roll, pitch, yaw, thrust);
  }
  return self;
}

- (uint8_t)group {
  return mavlink_msg_set_quad_swarm_roll_pitch_yaw_thrust_get_group(&(self->_message));
}

- (uint8_t)mode {
  return mavlink_msg_set_quad_swarm_roll_pitch_yaw_thrust_get_mode(&(self->_message));
}

- (uint16_t)ledRed:(uint8_t *)led_red {
  return mavlink_msg_set_quad_swarm_roll_pitch_yaw_thrust_get_led_red(&(self->_message), led_red);
}

- (uint16_t)ledBlue:(uint8_t *)led_blue {
  return mavlink_msg_set_quad_swarm_roll_pitch_yaw_thrust_get_led_blue(&(self->_message), led_blue);
}

- (uint16_t)ledGreen:(uint8_t *)led_green {
  return mavlink_msg_set_quad_swarm_roll_pitch_yaw_thrust_get_led_green(&(self->_message), led_green);
}

- (uint16_t)roll:(int16_t *)roll {
  return mavlink_msg_set_quad_swarm_roll_pitch_yaw_thrust_get_roll(&(self->_message), roll);
}

- (uint16_t)pitch:(int16_t *)pitch {
  return mavlink_msg_set_quad_swarm_roll_pitch_yaw_thrust_get_pitch(&(self->_message), pitch);
}

- (uint16_t)yaw:(int16_t *)yaw {
  return mavlink_msg_set_quad_swarm_roll_pitch_yaw_thrust_get_yaw(&(self->_message), yaw);
}

- (uint16_t)thrust:(uint16_t *)thrust {
  return mavlink_msg_set_quad_swarm_roll_pitch_yaw_thrust_get_thrust(&(self->_message), thrust);
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, group=%d, mode=%d, ledRed=%@, ledBlue=%@, ledGreen=%@, roll=%@, pitch=%@, yaw=%@, thrust=%@", [super description], [self group], [self mode], @"[array of uint8_t[4]]", @"[array of uint8_t[4]]", @"[array of uint8_t[4]]", @"[array of int16_t[4]]", @"[array of int16_t[4]]", @"[array of int16_t[4]]", @"[array of uint16_t[4]]"];
}

@end
