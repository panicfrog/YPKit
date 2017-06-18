//
//  MVMessageAttitudeQuaternion.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageAttitudeQuaternion.h"

@implementation MVMessageAttitudeQuaternion

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeBootMs:(uint32_t)timeBootMs q1:(float)q1 q2:(float)q2 q3:(float)q3 q4:(float)q4 rollspeed:(float)rollspeed pitchspeed:(float)pitchspeed yawspeed:(float)yawspeed {
  if ((self = [super init])) {
    mavlink_msg_attitude_quaternion_pack(systemId, componentId, &(self->_message), timeBootMs, q1, q2, q3, q4, rollspeed, pitchspeed, yawspeed);
  }
  return self;
}

- (uint32_t)timeBootMs {
  return mavlink_msg_attitude_quaternion_get_time_boot_ms(&(self->_message));
}

- (float)q1 {
  return mavlink_msg_attitude_quaternion_get_q1(&(self->_message));
}

- (float)q2 {
  return mavlink_msg_attitude_quaternion_get_q2(&(self->_message));
}

- (float)q3 {
  return mavlink_msg_attitude_quaternion_get_q3(&(self->_message));
}

- (float)q4 {
  return mavlink_msg_attitude_quaternion_get_q4(&(self->_message));
}

- (float)rollspeed {
  return mavlink_msg_attitude_quaternion_get_rollspeed(&(self->_message));
}

- (float)pitchspeed {
  return mavlink_msg_attitude_quaternion_get_pitchspeed(&(self->_message));
}

- (float)yawspeed {
  return mavlink_msg_attitude_quaternion_get_yawspeed(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeBootMs=%d, q1=%f, q2=%f, q3=%f, q4=%f, rollspeed=%f, pitchspeed=%f, yawspeed=%f", [super description], [self timeBootMs], [self q1], [self q2], [self q3], [self q4], [self rollspeed], [self pitchspeed], [self yawspeed]];
}

@end
