//
//  MVMessageOpticalFlow.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a OPTICAL_FLOW Mavlink message.

 @discussion Optical flow from a flow sensor (e.g. optical mouse sensor)
 */
@interface MVMessageOpticalFlow : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec sensorId:(uint8_t)sensorId flowX:(int16_t)flowX flowY:(int16_t)flowY flowCompMX:(float)flowCompMX flowCompMY:(float)flowCompMY quality:(uint8_t)quality groundDistance:(float)groundDistance;

//! Timestamp (UNIX)
- (uint64_t)timeUsec;

//! Sensor ID
- (uint8_t)sensorId;

//! Flow in pixels in x-sensor direction
- (int16_t)flowX;

//! Flow in pixels in y-sensor direction
- (int16_t)flowY;

//! Flow in meters in x-sensor direction, angular-speed compensated
- (float)flowCompMX;

//! Flow in meters in y-sensor direction, angular-speed compensated
- (float)flowCompMY;

//! Optical flow quality / confidence. 0: bad, 255: maximum quality
- (uint8_t)quality;

//! Ground distance in meters. Positive value: distance known. Negative value: Unknown distance
- (float)groundDistance;

@end
