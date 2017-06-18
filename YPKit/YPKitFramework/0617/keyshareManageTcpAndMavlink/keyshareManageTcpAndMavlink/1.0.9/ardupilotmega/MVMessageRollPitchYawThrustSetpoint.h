//
//  MVMessageRollPitchYawThrustSetpoint.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a ROLL_PITCH_YAW_THRUST_SETPOINT Mavlink message.

 @discussion Setpoint in roll, pitch, yaw currently active on the system.
 */
@interface MVMessageRollPitchYawThrustSetpoint : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeBootMs:(uint32_t)timeBootMs roll:(float)roll pitch:(float)pitch yaw:(float)yaw thrust:(float)thrust;

//! Timestamp in milliseconds since system boot
- (uint32_t)timeBootMs;

//! Desired roll angle in radians
- (float)roll;

//! Desired pitch angle in radians
- (float)pitch;

//! Desired yaw angle in radians
- (float)yaw;

//! Collective thrust, normalized to 0 .. 1
- (float)thrust;

@end
