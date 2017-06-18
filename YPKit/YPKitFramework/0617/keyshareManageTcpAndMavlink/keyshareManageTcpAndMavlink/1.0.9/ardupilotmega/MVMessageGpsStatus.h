//
//  MVMessageGpsStatus.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a GPS_STATUS Mavlink message.

 @discussion The positioning status, as reported by GPS. This message is intended to display status information about each satellite visible to the receiver. See message GLOBAL_POSITION for the global position estimate. This message can contain information for up to 20 satellites.
 */
@interface MVMessageGpsStatus : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId satellitesVisible:(uint8_t)satellitesVisible satellitePrn:(uint8_t *)satellitePrn satelliteUsed:(uint8_t *)satelliteUsed satelliteElevation:(uint8_t *)satelliteElevation satelliteAzimuth:(uint8_t *)satelliteAzimuth satelliteSnr:(uint8_t *)satelliteSnr;

//! Number of satellites visible
- (uint8_t)satellitesVisible;

//! Global satellite ID
- (uint16_t)satellitePrn:(uint8_t *)satellite_prn;

//! 0: Satellite not used, 1: used for localization
- (uint16_t)satelliteUsed:(uint8_t *)satellite_used;

//! Elevation (0: right on top of receiver, 90: on the horizon) of satellite
- (uint16_t)satelliteElevation:(uint8_t *)satellite_elevation;

//! Direction of satellite, 0: 0 deg, 255: 360 deg.
- (uint16_t)satelliteAzimuth:(uint8_t *)satellite_azimuth;

//! Signal to noise ratio of satellite
- (uint16_t)satelliteSnr:(uint8_t *)satellite_snr;

@end
