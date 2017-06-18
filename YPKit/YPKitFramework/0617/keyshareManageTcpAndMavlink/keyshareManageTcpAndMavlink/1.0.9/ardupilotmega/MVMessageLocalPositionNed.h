//
//  MVMessageLocalPositionNed.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a LOCAL_POSITION_NED Mavlink message.

 @discussion The filtered local position (e.g. fused computer vision and accelerometers). Coordinate frame is right-handed, Z-axis down (aeronautical frame, NED / north-east-down convention)
 */
@interface MVMessageLocalPositionNed : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeBootMs:(uint32_t)timeBootMs x:(float)x y:(float)y z:(float)z vx:(float)vx vy:(float)vy vz:(float)vz;

//! Timestamp (milliseconds since system boot)
- (uint32_t)timeBootMs;

//! X Position
- (float)x;

//! Y Position
- (float)y;

//! Z Position
- (float)z;

//! X Speed
- (float)vx;

//! Y Speed
- (float)vy;

//! Z Speed
- (float)vz;

@end
