//
//  MVMessageRollPitchYawSpeedThrustSetpoint.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a ROLL_PITCH_YAW_SPEED_THRUST_SETPOINT Mavlink message.

 @discussion Setpoint in rollspeed, pitchspeed, yawspeed currently active on the system.
 */
@interface MVMessageRollPitchYawSpeedThrustSetpoint : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeBootMs:(uint32_t)timeBootMs rollSpeed:(float)rollSpeed pitchSpeed:(float)pitchSpeed yawSpeed:(float)yawSpeed thrust:(float)thrust;

//! Timestamp in milliseconds since system boot
- (uint32_t)timeBootMs;

//! Desired roll angular speed in rad/s
- (float)rollSpeed;

//! Desired pitch angular speed in rad/s
- (float)pitchSpeed;

//! Desired yaw angular speed in rad/s
- (float)yawSpeed;

//! Collective thrust, normalized to 0 .. 1
- (float)thrust;

@end
