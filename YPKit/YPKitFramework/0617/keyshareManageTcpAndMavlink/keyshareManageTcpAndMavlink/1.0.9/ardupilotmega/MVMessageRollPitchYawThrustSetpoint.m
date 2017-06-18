//
//  MVMessageRollPitchYawThrustSetpoint.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageRollPitchYawThrustSetpoint.h"

@implementation MVMessageRollPitchYawThrustSetpoint

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeBootMs:(uint32_t)timeBootMs roll:(float)roll pitch:(float)pitch yaw:(float)yaw thrust:(float)thrust {
  if ((self = [super init])) {
    mavlink_msg_roll_pitch_yaw_thrust_setpoint_pack(systemId, componentId, &(self->_message), timeBootMs, roll, pitch, yaw, thrust);
  }
  return self;
}

- (uint32_t)timeBootMs {
  return mavlink_msg_roll_pitch_yaw_thrust_setpoint_get_time_boot_ms(&(self->_message));
}

- (float)roll {
  return mavlink_msg_roll_pitch_yaw_thrust_setpoint_get_roll(&(self->_message));
}

- (float)pitch {
  return mavlink_msg_roll_pitch_yaw_thrust_setpoint_get_pitch(&(self->_message));
}

- (float)yaw {
  return mavlink_msg_roll_pitch_yaw_thrust_setpoint_get_yaw(&(self->_message));
}

- (float)thrust {
  return mavlink_msg_roll_pitch_yaw_thrust_setpoint_get_thrust(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeBootMs=%d, roll=%f, pitch=%f, yaw=%f, thrust=%f", [super description], [self timeBootMs], [self roll], [self pitch], [self yaw], [self thrust]];
}

@end
