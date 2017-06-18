//
//  MVMessageLocalPositionSetpoint.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a LOCAL_POSITION_SETPOINT Mavlink message.

 @discussion Transmit the current local setpoint of the controller to other MAVs (collision avoidance) and to the GCS.
 */
@interface MVMessageLocalPositionSetpoint : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId coordinateFrame:(uint8_t)coordinateFrame x:(float)x y:(float)y z:(float)z yaw:(float)yaw;

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
