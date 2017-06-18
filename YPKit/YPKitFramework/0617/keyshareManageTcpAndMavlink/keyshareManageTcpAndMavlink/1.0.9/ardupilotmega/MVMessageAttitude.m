//
//  MVMessageAttitude.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageAttitude.h"

@implementation MVMessageAttitude

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeBootMs:(uint32_t)timeBootMs roll:(float)roll pitch:(float)pitch yaw:(float)yaw rollspeed:(float)rollspeed pitchspeed:(float)pitchspeed yawspeed:(float)yawspeed {
  if ((self = [super init])) {
    mavlink_msg_attitude_pack(systemId, componentId, &(self->_message), timeBootMs, roll, pitch, yaw, rollspeed, pitchspeed, yawspeed);
  }
  return self;
}

- (uint32_t)timeBootMs {
  return mavlink_msg_attitude_get_time_boot_ms(&(self->_message));
}

- (float)roll {
  return mavlink_msg_attitude_get_roll(&(self->_message));
}

- (float)pitch {
  return mavlink_msg_attitude_get_pitch(&(self->_message));
}

- (float)yaw {
  return mavlink_msg_attitude_get_yaw(&(self->_message));
}

- (float)rollspeed {
  return mavlink_msg_attitude_get_rollspeed(&(self->_message));
}

- (float)pitchspeed {
  return mavlink_msg_attitude_get_pitchspeed(&(self->_message));
}

- (float)yawspeed {
  return mavlink_msg_attitude_get_yawspeed(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeBootMs=%d, roll=%f, pitch=%f, yaw=%f, rollspeed=%f, pitchspeed=%f, yawspeed=%f", [super description], [self timeBootMs], [self roll], [self pitch], [self yaw], [self rollspeed], [self pitchspeed], [self yawspeed]];
}

@end
