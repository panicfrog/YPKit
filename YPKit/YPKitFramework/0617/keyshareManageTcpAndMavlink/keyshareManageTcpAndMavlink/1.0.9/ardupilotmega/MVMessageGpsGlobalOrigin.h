//
//  MVMessageGpsGlobalOrigin.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a GPS_GLOBAL_ORIGIN Mavlink message.

 @discussion Once the MAV sets a new GPS-Local correspondence, this message announces the origin (0,0,0) position
 */
@interface MVMessageGpsGlobalOrigin : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId latitude:(int32_t)latitude longitude:(int32_t)longitude altitude:(int32_t)altitude;

//! Latitude (WGS84), expressed as * 1E7
- (int32_t)latitude;

//! Longitude (WGS84), expressed as * 1E7
- (int32_t)longitude;

//! Altitude(WGS84), expressed as * 1000
- (int32_t)altitude;

@end
