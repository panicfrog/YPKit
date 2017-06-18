//
//  MVMessageSetGpsGlobalOrigin.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a SET_GPS_GLOBAL_ORIGIN Mavlink message.

 @discussion As local MISSIONs exist, the global MISSION reference allows to transform between the local coordinate frame and the global (GPS) coordinate frame. This can be necessary when e.g. in- and outdoor settings are connected and the MAV should move from in- to outdoor.
 */
@interface MVMessageSetGpsGlobalOrigin : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem latitude:(int32_t)latitude longitude:(int32_t)longitude altitude:(int32_t)altitude;

//! System ID
- (uint8_t)targetSystem;

//! global position * 1E7
- (int32_t)latitude;

//! global position * 1E7
- (int32_t)longitude;

//! global position * 1000
- (int32_t)altitude;

@end
