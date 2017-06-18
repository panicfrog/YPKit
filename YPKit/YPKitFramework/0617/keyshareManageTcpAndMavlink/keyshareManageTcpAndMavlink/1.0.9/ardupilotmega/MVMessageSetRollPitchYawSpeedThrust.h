//
//  MVMessageSetRollPitchYawSpeedThrust.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a SET_ROLL_PITCH_YAW_SPEED_THRUST Mavlink message.

 @discussion Set roll, pitch and yaw.
 */
@interface MVMessageSetRollPitchYawSpeedThrust : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent rollSpeed:(float)rollSpeed pitchSpeed:(float)pitchSpeed yawSpeed:(float)yawSpeed thrust:(float)thrust;

//! System ID
- (uint8_t)targetSystem;

//! Component ID
- (uint8_t)targetComponent;

//! Desired roll angular speed in rad/s
- (float)rollSpeed;

//! Desired pitch angular speed in rad/s
- (float)pitchSpeed;

//! Desired yaw angular speed in rad/s
- (float)yawSpeed;

//! Collective thrust, normalized to 0 .. 1
- (float)thrust;

@end
