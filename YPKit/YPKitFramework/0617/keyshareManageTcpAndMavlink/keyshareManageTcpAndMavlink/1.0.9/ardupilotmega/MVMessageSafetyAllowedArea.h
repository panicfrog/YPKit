//
//  MVMessageSafetyAllowedArea.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a SAFETY_ALLOWED_AREA Mavlink message.

 @discussion Read out the safety zone the MAV currently assumes.
 */
@interface MVMessageSafetyAllowedArea : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId frame:(uint8_t)frame p1x:(float)p1x p1y:(float)p1y p1z:(float)p1z p2x:(float)p2x p2y:(float)p2y p2z:(float)p2z;

//! Coordinate frame, as defined by MAV_FRAME enum in mavlink_types.h. Can be either global, GPS, right-handed with Z axis up or local, right handed, Z axis down.
- (uint8_t)frame;

//! x position 1 / Latitude 1
- (float)p1x;

//! y position 1 / Longitude 1
- (float)p1y;

//! z position 1 / Altitude 1
- (float)p1z;

//! x position 2 / Latitude 2
- (float)p2x;

//! y position 2 / Longitude 2
- (float)p2y;

//! z position 2 / Altitude 2
- (float)p2z;

@end
