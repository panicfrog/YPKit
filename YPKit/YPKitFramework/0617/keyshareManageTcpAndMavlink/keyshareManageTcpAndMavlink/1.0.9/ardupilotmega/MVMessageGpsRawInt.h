//
//  MVMessageGpsRawInt.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a GPS_RAW_INT Mavlink message.

 @discussion The global position, as returned by the Global Positioning System (GPS). This is
                NOT the global position estimate of the sytem, but rather a RAW sensor value. See message GLOBAL_POSITION for the global position estimate. Coordinate frame is right-handed, Z-axis up (GPS frame).
 */
@interface MVMessageGpsRawInt : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec fixType:(uint8_t)fixType lat:(int32_t)lat lon:(int32_t)lon alt:(int32_t)alt eph:(uint16_t)eph epv:(uint16_t)epv vel:(uint16_t)vel cog:(uint16_t)cog satellitesVisible:(uint8_t)satellitesVisible;

//! Timestamp (microseconds since UNIX epoch or microseconds since system boot)
- (uint64_t)timeUsec;

//! 0-1: no fix, 2: 2D fix, 3: 3D fix. Some applications will not use the value of this field unless it is at least two, so always correctly fill in the fix.
- (uint8_t)fixType;

//! Latitude in 1E7 degrees
- (int32_t)lat;

//! Longitude in 1E7 degrees
- (int32_t)lon;

//! Altitude in 1E3 meters (millimeters) above MSL
- (int32_t)alt;

//! GPS HDOP horizontal dilution of position in cm (m*100). If unknown, set to: 65535
- (uint16_t)eph;

//! GPS VDOP horizontal dilution of position in cm (m*100). If unknown, set to: 65535
- (uint16_t)epv;

//! GPS ground speed (m/s * 100). If unknown, set to: 65535
- (uint16_t)vel;

//! Course over ground (NOT heading, but direction of movement) in degrees * 100, 0.0..359.99 degrees. If unknown, set to: 65535
- (uint16_t)cog;

//! Number of satellites visible. If unknown, set to 255
- (uint8_t)satellitesVisible;

@end
