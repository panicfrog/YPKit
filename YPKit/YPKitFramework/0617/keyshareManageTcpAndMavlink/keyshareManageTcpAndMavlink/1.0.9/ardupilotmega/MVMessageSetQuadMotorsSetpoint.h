//
//  MVMessageSetQuadMotorsSetpoint.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a SET_QUAD_MOTORS_SETPOINT Mavlink message.

 @discussion Setpoint in the four motor speeds
 */
@interface MVMessageSetQuadMotorsSetpoint : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem motorFrontNw:(uint16_t)motorFrontNw motorRightNe:(uint16_t)motorRightNe motorBackSe:(uint16_t)motorBackSe motorLeftSw:(uint16_t)motorLeftSw;

//! System ID of the system that should set these motor commands
- (uint8_t)targetSystem;

//! Front motor in + configuration, front left motor in x configuration
- (uint16_t)motorFrontNw;

//! Right motor in + configuration, front right motor in x configuration
- (uint16_t)motorRightNe;

//! Back motor in + configuration, back right motor in x configuration
- (uint16_t)motorBackSe;

//! Left motor in + configuration, back left motor in x configuration
- (uint16_t)motorLeftSw;

@end
