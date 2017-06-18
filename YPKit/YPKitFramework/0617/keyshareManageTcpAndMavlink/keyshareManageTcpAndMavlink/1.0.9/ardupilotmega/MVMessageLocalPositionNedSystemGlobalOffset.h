//
//  MVMessageLocalPositionNedSystemGlobalOffset.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a LOCAL_POSITION_NED_SYSTEM_GLOBAL_OFFSET Mavlink message.

 @discussion The offset in X, Y, Z and yaw between the LOCAL_POSITION_NED messages of MAV X and the global coordinate frame in NED coordinates. Coordinate frame is right-handed, Z-axis down (aeronautical frame, NED / north-east-down convention)
 */
@interface MVMessageLocalPositionNedSystemGlobalOffset : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeBootMs:(uint32_t)timeBootMs x:(float)x y:(float)y z:(float)z roll:(float)roll pitch:(float)pitch yaw:(float)yaw;

//! Timestamp (milliseconds since system boot)
- (uint32_t)timeBootMs;

//! X Position
- (float)x;

//! Y Position
- (float)y;

//! Z Position
- (float)z;

//! Roll
- (float)roll;

//! Pitch
- (float)pitch;

//! Yaw
- (float)yaw;

@end
