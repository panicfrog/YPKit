//
//  MVMessageFencePoint.h
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a FENCE_POINT Mavlink message.

 @discussion A fence point. Used to set a point when from
	      GCS -> MAV. Also used to return a point from MAV -> GCS
 */
@interface MVMessageFencePoint : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent idx:(uint8_t)idx count:(uint8_t)count lat:(float)lat lng:(float)lng;

//! System ID
- (uint8_t)targetSystem;

//! Component ID
- (uint8_t)targetComponent;

//! point index (first point is 1, 0 is for return point)
- (uint8_t)idx;

//! total number of points (for sanity checking)
- (uint8_t)count;

//! Latitude of point
- (float)lat;

//! Longitude of point
- (float)lng;

@end
