//
//  MVMessageRawImu.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a RAW_IMU Mavlink message.

 @discussion The RAW IMU readings for the usual 9DOF sensor setup. This message should always contain the true raw values without any scaling to allow data capture and system debugging.
 */
@interface MVMessageRawImu : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec xacc:(int16_t)xacc yacc:(int16_t)yacc zacc:(int16_t)zacc xgyro:(int16_t)xgyro ygyro:(int16_t)ygyro zgyro:(int16_t)zgyro xmag:(int16_t)xmag ymag:(int16_t)ymag zmag:(int16_t)zmag;

//! Timestamp (microseconds since UNIX epoch or microseconds since system boot)
- (uint64_t)timeUsec;

//! X acceleration (raw)
- (int16_t)xacc;

//! Y acceleration (raw)
- (int16_t)yacc;

//! Z acceleration (raw)
- (int16_t)zacc;

//! Angular speed around X axis (raw)
- (int16_t)xgyro;

//! Angular speed around Y axis (raw)
- (int16_t)ygyro;

//! Angular speed around Z axis (raw)
- (int16_t)zgyro;

//! X Magnetic field (raw)
- (int16_t)xmag;

//! Y Magnetic field (raw)
- (int16_t)ymag;

//! Z Magnetic field (raw)
- (int16_t)zmag;

@end
