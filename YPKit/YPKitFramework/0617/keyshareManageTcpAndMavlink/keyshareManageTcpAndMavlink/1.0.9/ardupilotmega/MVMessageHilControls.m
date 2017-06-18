//
//  MVMessageHilControls.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageHilControls.h"

@implementation MVMessageHilControls

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec rollAilerons:(float)rollAilerons pitchElevator:(float)pitchElevator yawRudder:(float)yawRudder throttle:(float)throttle aux1:(float)aux1 aux2:(float)aux2 aux3:(float)aux3 aux4:(float)aux4 mode:(uint8_t)mode navMode:(uint8_t)navMode {
  if ((self = [super init])) {
    mavlink_msg_hil_controls_pack(systemId, componentId, &(self->_message), timeUsec, rollAilerons, pitchElevator, yawRudder, throttle, aux1, aux2, aux3, aux4, mode, navMode);
  }
  return self;
}

- (uint64_t)timeUsec {
  return mavlink_msg_hil_controls_get_time_usec(&(self->_message));
}

- (float)rollAilerons {
  return mavlink_msg_hil_controls_get_roll_ailerons(&(self->_message));
}

- (float)pitchElevator {
  return mavlink_msg_hil_controls_get_pitch_elevator(&(self->_message));
}

- (float)yawRudder {
  return mavlink_msg_hil_controls_get_yaw_rudder(&(self->_message));
}

- (float)throttle {
  return mavlink_msg_hil_controls_get_throttle(&(self->_message));
}

- (float)aux1 {
  return mavlink_msg_hil_controls_get_aux1(&(self->_message));
}

- (float)aux2 {
  return mavlink_msg_hil_controls_get_aux2(&(self->_message));
}

- (float)aux3 {
  return mavlink_msg_hil_controls_get_aux3(&(self->_message));
}

- (float)aux4 {
  return mavlink_msg_hil_controls_get_aux4(&(self->_message));
}

- (uint8_t)mode {
  return mavlink_msg_hil_controls_get_mode(&(self->_message));
}

- (uint8_t)navMode {
  return mavlink_msg_hil_controls_get_nav_mode(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeUsec=%lld, rollAilerons=%f, pitchElevator=%f, yawRudder=%f, throttle=%f, aux1=%f, aux2=%f, aux3=%f, aux4=%f, mode=%d, navMode=%d", [super description], [self timeUsec], [self rollAilerons], [self pitchElevator], [self yawRudder], [self throttle], [self aux1], [self aux2], [self aux3], [self aux4], [self mode], [self navMode]];
}

@end
