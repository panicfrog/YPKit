//
//  MVMessageGpsStatus.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageGpsStatus.h"

@implementation MVMessageGpsStatus

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId satellitesVisible:(uint8_t)satellitesVisible satellitePrn:(uint8_t *)satellitePrn satelliteUsed:(uint8_t *)satelliteUsed satelliteElevation:(uint8_t *)satelliteElevation satelliteAzimuth:(uint8_t *)satelliteAzimuth satelliteSnr:(uint8_t *)satelliteSnr {
  if ((self = [super init])) {
    mavlink_msg_gps_status_pack(systemId, componentId, &(self->_message), satellitesVisible, satellitePrn, satelliteUsed, satelliteElevation, satelliteAzimuth, satelliteSnr);
  }
  return self;
}

- (uint8_t)satellitesVisible {
  return mavlink_msg_gps_status_get_satellites_visible(&(self->_message));
}

- (uint16_t)satellitePrn:(uint8_t *)satellite_prn {
  return mavlink_msg_gps_status_get_satellite_prn(&(self->_message), satellite_prn);
}

- (uint16_t)satelliteUsed:(uint8_t *)satellite_used {
  return mavlink_msg_gps_status_get_satellite_used(&(self->_message), satellite_used);
}

- (uint16_t)satelliteElevation:(uint8_t *)satellite_elevation {
  return mavlink_msg_gps_status_get_satellite_elevation(&(self->_message), satellite_elevation);
}

- (uint16_t)satelliteAzimuth:(uint8_t *)satellite_azimuth {
  return mavlink_msg_gps_status_get_satellite_azimuth(&(self->_message), satellite_azimuth);
}

- (uint16_t)satelliteSnr:(uint8_t *)satellite_snr {
  return mavlink_msg_gps_status_get_satellite_snr(&(self->_message), satellite_snr);
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, satellitesVisible=%d, satellitePrn=%@, satelliteUsed=%@, satelliteElevation=%@, satelliteAzimuth=%@, satelliteSnr=%@", [super description], [self satellitesVisible], @"[array of uint8_t[20]]", @"[array of uint8_t[20]]", @"[array of uint8_t[20]]", @"[array of uint8_t[20]]", @"[array of uint8_t[20]]"];
}

@end
