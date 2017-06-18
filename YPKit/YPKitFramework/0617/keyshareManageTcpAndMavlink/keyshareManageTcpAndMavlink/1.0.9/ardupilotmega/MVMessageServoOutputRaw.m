//
//  MVMessageServoOutputRaw.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageServoOutputRaw.h"

@implementation MVMessageServoOutputRaw

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint32_t)timeUsec port:(uint8_t)port servo1Raw:(uint16_t)servo1Raw servo2Raw:(uint16_t)servo2Raw servo3Raw:(uint16_t)servo3Raw servo4Raw:(uint16_t)servo4Raw servo5Raw:(uint16_t)servo5Raw servo6Raw:(uint16_t)servo6Raw servo7Raw:(uint16_t)servo7Raw servo8Raw:(uint16_t)servo8Raw {
  if ((self = [super init])) {
    mavlink_msg_servo_output_raw_pack(systemId, componentId, &(self->_message), timeUsec, port, servo1Raw, servo2Raw, servo3Raw, servo4Raw, servo5Raw, servo6Raw, servo7Raw, servo8Raw);
  }
  return self;
}

- (uint32_t)timeUsec {
  return mavlink_msg_servo_output_raw_get_time_usec(&(self->_message));
}

- (uint8_t)port {
  return mavlink_msg_servo_output_raw_get_port(&(self->_message));
}

- (uint16_t)servo1Raw {
  return mavlink_msg_servo_output_raw_get_servo1_raw(&(self->_message));
}

- (uint16_t)servo2Raw {
  return mavlink_msg_servo_output_raw_get_servo2_raw(&(self->_message));
}

- (uint16_t)servo3Raw {
  return mavlink_msg_servo_output_raw_get_servo3_raw(&(self->_message));
}

- (uint16_t)servo4Raw {
  return mavlink_msg_servo_output_raw_get_servo4_raw(&(self->_message));
}

- (uint16_t)servo5Raw {
  return mavlink_msg_servo_output_raw_get_servo5_raw(&(self->_message));
}

- (uint16_t)servo6Raw {
  return mavlink_msg_servo_output_raw_get_servo6_raw(&(self->_message));
}

- (uint16_t)servo7Raw {
  return mavlink_msg_servo_output_raw_get_servo7_raw(&(self->_message));
}

- (uint16_t)servo8Raw {
  return mavlink_msg_servo_output_raw_get_servo8_raw(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeUsec=%d, port=%d, servo1Raw=%d, servo2Raw=%d, servo3Raw=%d, servo4Raw=%d, servo5Raw=%d, servo6Raw=%d, servo7Raw=%d, servo8Raw=%d", [super description], [self timeUsec], [self port], [self servo1Raw], [self servo2Raw], [self servo3Raw], [self servo4Raw], [self servo5Raw], [self servo6Raw], [self servo7Raw], [self servo8Raw]];
}

@end
