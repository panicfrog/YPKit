//
//  MVMessageVisionSpeedEstimate.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a VISION_SPEED_ESTIMATE Mavlink message.

 @discussion 
 */
@interface MVMessageVisionSpeedEstimate : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId usec:(uint64_t)usec x:(float)x y:(float)y z:(float)z;

//! Timestamp (milliseconds)
- (uint64_t)usec;

//! Global X speed
- (float)x;

//! Global Y speed
- (float)y;

//! Global Z speed
- (float)z;

@end
