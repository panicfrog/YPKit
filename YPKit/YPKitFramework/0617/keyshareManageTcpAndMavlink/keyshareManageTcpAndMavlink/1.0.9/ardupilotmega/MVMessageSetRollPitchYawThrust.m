//
//  MVMessageSetRollPitchYawThrust.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageSetRollPitchYawThrust.h"

@implementation MVMessageSetRollPitchYawThrust

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent roll:(float)roll pitch:(float)pitch yaw:(float)yaw thrust:(float)thrust {
  if ((self = [super init])) {
    mavlink_msg_set_roll_pitch_yaw_thrust_pack(systemId, componentId, &(self->_message), targetSystem, targetComponent, roll, pitch, yaw, thrust);
  }
  return self;
}

- (uint8_t)targetSystem {
  return mavlink_msg_set_roll_pitch_yaw_thrust_get_target_system(&(self->_message));
}

- (uint8_t)targetComponent {
  return mavlink_msg_set_roll_pitch_yaw_thrust_get_target_component(&(self->_message));
}

- (float)roll {
  return mavlink_msg_set_roll_pitch_yaw_thrust_get_roll(&(self->_message));
}

- (float)pitch {
  return mavlink_msg_set_roll_pitch_yaw_thrust_get_pitch(&(self->_message));
}

- (float)yaw {
  return mavlink_msg_set_roll_pitch_yaw_thrust_get_yaw(&(self->_message));
}

- (float)thrust {
  return mavlink_msg_set_roll_pitch_yaw_thrust_get_thrust(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, targetSystem=%d, targetComponent=%d, roll=%f, pitch=%f, yaw=%f, thrust=%f", [super description], [self targetSystem], [self targetComponent], [self roll], [self pitch], [self yaw], [self thrust]];
}

@end
