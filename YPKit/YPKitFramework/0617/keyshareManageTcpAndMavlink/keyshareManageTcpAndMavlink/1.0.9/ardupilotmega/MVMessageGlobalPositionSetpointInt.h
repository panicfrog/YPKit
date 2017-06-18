//
//  MVMessageGlobalPositionSetpointInt.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a GLOBAL_POSITION_SETPOINT_INT Mavlink message.

 @discussion Transmit the current local setpoint of the controller to other MAVs (collision avoidance) and to the GCS.
 */
@interface MVMessageGlobalPositionSetpointInt : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId coordinateFrame:(uint8_t)coordinateFrame latitude:(int32_t)latitude longitude:(int32_t)longitude altitude:(int32_t)altitude yaw:(int16_t)yaw;

//! Coordinate frame - valid values are only MAV_FRAME_GLOBAL or MAV_FRAME_GLOBAL_RELATIVE_ALT
- (uint8_t)coordinateFrame;

//! WGS84 Latitude position in degrees * 1E7
- (int32_t)latitude;

//! WGS84 Longitude position in degrees * 1E7
- (int32_t)longitude;

//! WGS84 Altitude in meters * 1000 (positive for up)
- (int32_t)altitude;

//! Desired yaw angle in degrees * 100
- (int16_t)yaw;

@end
