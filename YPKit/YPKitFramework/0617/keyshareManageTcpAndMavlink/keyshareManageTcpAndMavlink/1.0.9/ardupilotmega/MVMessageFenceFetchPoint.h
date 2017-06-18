//
//  MVMessageFenceFetchPoint.h
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a FENCE_FETCH_POINT Mavlink message.

 @discussion Request a current fence point from MAV
 */
@interface MVMessageFenceFetchPoint : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent idx:(uint8_t)idx;

//! System ID
- (uint8_t)targetSystem;

//! Component ID
- (uint8_t)targetComponent;

//! point index (first point is 1, 0 is for return point)
- (uint8_t)idx;

@end
