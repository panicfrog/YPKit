//
//  MVMessageHilState.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageHilState.h"

@implementation MVMessageHilState

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec roll:(float)roll pitch:(float)pitch yaw:(float)yaw rollspeed:(float)rollspeed pitchspeed:(float)pitchspeed yawspeed:(float)yawspeed lat:(int32_t)lat lon:(int32_t)lon alt:(int32_t)alt vx:(int16_t)vx vy:(int16_t)vy vz:(int16_t)vz xacc:(int16_t)xacc yacc:(int16_t)yacc zacc:(int16_t)zacc {
  if ((self = [super init])) {
    mavlink_msg_hil_state_pack(systemId, componentId, &(self->_message), timeUsec, roll, pitch, yaw, rollspeed, pitchspeed, yawspeed, lat, lon, alt, vx, vy, vz, xacc, yacc, zacc);
  }
  return self;
}

- (uint64_t)timeUsec {
  return mavlink_msg_hil_state_get_time_usec(&(self->_message));
}

- (float)roll {
  return mavlink_msg_hil_state_get_roll(&(self->_message));
}

- (float)pitch {
  return mavlink_msg_hil_state_get_pitch(&(self->_message));
}

- (float)yaw {
  return mavlink_msg_hil_state_get_yaw(&(self->_message));
}

- (float)rollspeed {
  return mavlink_msg_hil_state_get_rollspeed(&(self->_message));
}

- (float)pitchspeed {
  return mavlink_msg_hil_state_get_pitchspeed(&(self->_message));
}

- (float)yawspeed {
  return mavlink_msg_hil_state_get_yawspeed(&(self->_message));
}

- (int32_t)lat {
  return mavlink_msg_hil_state_get_lat(&(self->_message));
}

- (int32_t)lon {
  return mavlink_msg_hil_state_get_lon(&(self->_message));
}

- (int32_t)alt {
  return mavlink_msg_hil_state_get_alt(&(self->_message));
}

- (int16_t)vx {
  return mavlink_msg_hil_state_get_vx(&(self->_message));
}

- (int16_t)vy {
  return mavlink_msg_hil_state_get_vy(&(self->_message));
}

- (int16_t)vz {
  return mavlink_msg_hil_state_get_vz(&(self->_message));
}

- (int16_t)xacc {
  return mavlink_msg_hil_state_get_xacc(&(self->_message));
}

- (int16_t)yacc {
  return mavlink_msg_hil_state_get_yacc(&(self->_message));
}

- (int16_t)zacc {
  return mavlink_msg_hil_state_get_zacc(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeUsec=%lld, roll=%f, pitch=%f, yaw=%f, rollspeed=%f, pitchspeed=%f, yawspeed=%f, lat=%d, lon=%d, alt=%d, vx=%d, vy=%d, vz=%d, xacc=%d, yacc=%d, zacc=%d", [super description], [self timeUsec], [self roll], [self pitch], [self yaw], [self rollspeed], [self pitchspeed], [self yawspeed], [self lat], [self lon], [self alt], [self vx], [self vy], [self vz], [self xacc], [self yacc], [self zacc]];
}

@end
