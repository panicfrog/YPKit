//
//  MVMessageSimstate.h
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a SIMSTATE Mavlink message.

 @discussion Status of simulation environment, if used
 */
@interface MVMessageSimstate : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId roll:(float)roll pitch:(float)pitch yaw:(float)yaw xacc:(float)xacc yacc:(float)yacc zacc:(float)zacc xgyro:(float)xgyro ygyro:(float)ygyro zgyro:(float)zgyro;

//! Roll angle (rad)
- (float)roll;

//! Pitch angle (rad)
- (float)pitch;

//! Yaw angle (rad)
- (float)yaw;

//! X acceleration m/s/s
- (float)xacc;

//! Y acceleration m/s/s
- (float)yacc;

//! Z acceleration m/s/s
- (float)zacc;

//! Angular speed around X axis rad/s
- (float)xgyro;

//! Angular speed around Y axis rad/s
- (float)ygyro;

//! Angular speed around Z axis rad/s
- (float)zgyro;

@end
