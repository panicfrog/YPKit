//
//  MVMessageRollPitchYawSpeedThrustSetpoint.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageRollPitchYawSpeedThrustSetpoint.h"

@implementation MVMessageRollPitchYawSpeedThrustSetpoint

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeBootMs:(uint32_t)timeBootMs rollSpeed:(float)rollSpeed pitchSpeed:(float)pitchSpeed yawSpeed:(float)yawSpeed thrust:(float)thrust {
  if ((self = [super init])) {
    mavlink_msg_roll_pitch_yaw_speed_thrust_setpoint_pack(systemId, componentId, &(self->_message), timeBootMs, rollSpeed, pitchSpeed, yawSpeed, thrust);
  }
  return self;
}

- (uint32_t)timeBootMs {
  return mavlink_msg_roll_pitch_yaw_speed_thrust_setpoint_get_time_boot_ms(&(self->_message));
}

- (float)rollSpeed {
  return mavlink_msg_roll_pitch_yaw_speed_thrust_setpoint_get_roll_speed(&(self->_message));
}

- (float)pitchSpeed {
  return mavlink_msg_roll_pitch_yaw_speed_thrust_setpoint_get_pitch_speed(&(self->_message));
}

- (float)yawSpeed {
  return mavlink_msg_roll_pitch_yaw_speed_thrust_setpoint_get_yaw_speed(&(self->_message));
}

- (float)thrust {
  return mavlink_msg_roll_pitch_yaw_speed_thrust_setpoint_get_thrust(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeBootMs=%d, rollSpeed=%f, pitchSpeed=%f, yawSpeed=%f, thrust=%f", [super description], [self timeBootMs], [self rollSpeed], [self pitchSpeed], [self yawSpeed], [self thrust]];
}

@end
