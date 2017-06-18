//
//  MVMessageSetLocalPositionSetpoint.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a SET_LOCAL_POSITION_SETPOINT Mavlink message.

 @discussion Set the setpoint for a local position controller. This is the position in local coordinates the MAV should fly to. This message is sent by the path/MISSION planner to the onboard position controller. As some MAVs have a degree of freedom in yaw (e.g. all helicopters/quadrotors), the desired yaw angle is part of the message.
 */
@interface MVMessageSetLocalPositionSetpoint : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent coordinateFrame:(uint8_t)coordinateFrame x:(float)x y:(float)y z:(float)z yaw:(float)yaw;

//! System ID
- (uint8_t)targetSystem;

//! Component ID
- (uint8_t)targetComponent;

//! Coordinate frame - valid values are only MAV_FRAME_LOCAL_NED or MAV_FRAME_LOCAL_ENU
- (uint8_t)coordinateFrame;

//! x position
- (float)x;

//! y position
- (float)y;

//! z position
- (float)z;

//! Desired yaw angle
- (float)yaw;

@end
