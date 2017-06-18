//
//  MVMessageGlobalVisionPositionEstimate.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a GLOBAL_VISION_POSITION_ESTIMATE Mavlink message.

 @discussion 
 */
@interface MVMessageGlobalVisionPositionEstimate : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId usec:(uint64_t)usec x:(float)x y:(float)y z:(float)z roll:(float)roll pitch:(float)pitch yaw:(float)yaw;

//! Timestamp (milliseconds)
- (uint64_t)usec;

//! Global X position
- (float)x;

//! Global Y position
- (float)y;

//! Global Z position
- (float)z;

//! Roll angle in rad
- (float)roll;

//! Pitch angle in rad
- (float)pitch;

//! Yaw angle in rad
- (float)yaw;

@end
