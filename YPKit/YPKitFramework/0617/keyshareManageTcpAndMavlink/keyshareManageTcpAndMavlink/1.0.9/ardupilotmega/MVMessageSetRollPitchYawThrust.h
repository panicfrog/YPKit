//
//  MVMessageSetRollPitchYawThrust.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a SET_ROLL_PITCH_YAW_THRUST Mavlink message.

 @discussion Set roll, pitch and yaw.
 */
@interface MVMessageSetRollPitchYawThrust : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent roll:(float)roll pitch:(float)pitch yaw:(float)yaw thrust:(float)thrust;

//! System ID
- (uint8_t)targetSystem;

//! Component ID
- (uint8_t)targetComponent;

//! Desired roll angle in radians
- (float)roll;

//! Desired pitch angle in radians
- (float)pitch;

//! Desired yaw angle in radians
- (float)yaw;

//! Collective thrust, normalized to 0 .. 1
- (float)thrust;

@end
