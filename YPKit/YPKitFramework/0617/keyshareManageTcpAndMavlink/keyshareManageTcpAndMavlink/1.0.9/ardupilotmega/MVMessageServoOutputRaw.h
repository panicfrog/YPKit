//
//  MVMessageServoOutputRaw.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a SERVO_OUTPUT_RAW Mavlink message.

 @discussion The RAW values of the servo outputs (for RC input from the remote, use the RC_CHANNELS messages). The standard PPM modulation is as follows: 1000 microseconds: 0%, 2000 microseconds: 100%.
 */
@interface MVMessageServoOutputRaw : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint32_t)timeUsec port:(uint8_t)port servo1Raw:(uint16_t)servo1Raw servo2Raw:(uint16_t)servo2Raw servo3Raw:(uint16_t)servo3Raw servo4Raw:(uint16_t)servo4Raw servo5Raw:(uint16_t)servo5Raw servo6Raw:(uint16_t)servo6Raw servo7Raw:(uint16_t)servo7Raw servo8Raw:(uint16_t)servo8Raw;

//! Timestamp (since UNIX epoch or microseconds since system boot)
- (uint32_t)timeUsec;

//! Servo output port (set of 8 outputs = 1 port). Most MAVs will just use one, but this allows to encode more than 8 servos.
- (uint8_t)port;

//! Servo output 1 value, in microseconds
- (uint16_t)servo1Raw;

//! Servo output 2 value, in microseconds
- (uint16_t)servo2Raw;

//! Servo output 3 value, in microseconds
- (uint16_t)servo3Raw;

//! Servo output 4 value, in microseconds
- (uint16_t)servo4Raw;

//! Servo output 5 value, in microseconds
- (uint16_t)servo5Raw;

//! Servo output 6 value, in microseconds
- (uint16_t)servo6Raw;

//! Servo output 7 value, in microseconds
- (uint16_t)servo7Raw;

//! Servo output 8 value, in microseconds
- (uint16_t)servo8Raw;

@end
