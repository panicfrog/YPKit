//
//  MVMessageSetQuadMotorsSetpoint.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageSetQuadMotorsSetpoint.h"

@implementation MVMessageSetQuadMotorsSetpoint

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem motorFrontNw:(uint16_t)motorFrontNw motorRightNe:(uint16_t)motorRightNe motorBackSe:(uint16_t)motorBackSe motorLeftSw:(uint16_t)motorLeftSw {
  if ((self = [super init])) {
    mavlink_msg_set_quad_motors_setpoint_pack(systemId, componentId, &(self->_message), targetSystem, motorFrontNw, motorRightNe, motorBackSe, motorLeftSw);
  }
  return self;
}

- (uint8_t)targetSystem {
  return mavlink_msg_set_quad_motors_setpoint_get_target_system(&(self->_message));
}

- (uint16_t)motorFrontNw {
  return mavlink_msg_set_quad_motors_setpoint_get_motor_front_nw(&(self->_message));
}

- (uint16_t)motorRightNe {
  return mavlink_msg_set_quad_motors_setpoint_get_motor_right_ne(&(self->_message));
}

- (uint16_t)motorBackSe {
  return mavlink_msg_set_quad_motors_setpoint_get_motor_back_se(&(self->_message));
}

- (uint16_t)motorLeftSw {
  return mavlink_msg_set_quad_motors_setpoint_get_motor_left_sw(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, targetSystem=%d, motorFrontNw=%d, motorRightNe=%d, motorBackSe=%d, motorLeftSw=%d", [super description], [self targetSystem], [self motorFrontNw], [self motorRightNe], [self motorBackSe], [self motorLeftSw]];
}

@end
