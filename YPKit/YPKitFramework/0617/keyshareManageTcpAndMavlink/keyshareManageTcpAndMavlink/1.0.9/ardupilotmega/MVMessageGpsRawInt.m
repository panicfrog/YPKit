//
//  MVMessageGpsRawInt.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageGpsRawInt.h"

@implementation MVMessageGpsRawInt

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec fixType:(uint8_t)fixType lat:(int32_t)lat lon:(int32_t)lon alt:(int32_t)alt eph:(uint16_t)eph epv:(uint16_t)epv vel:(uint16_t)vel cog:(uint16_t)cog satellitesVisible:(uint8_t)satellitesVisible {
  if ((self = [super init])) {
    mavlink_msg_gps_raw_int_pack(systemId, componentId, &(self->_message), timeUsec, fixType, lat, lon, alt, eph, epv, vel, cog, satellitesVisible);
  }
  return self;
}

- (uint64_t)timeUsec {
  return mavlink_msg_gps_raw_int_get_time_usec(&(self->_message));
}

- (uint8_t)fixType {
  return mavlink_msg_gps_raw_int_get_fix_type(&(self->_message));
}

- (int32_t)lat {
  return mavlink_msg_gps_raw_int_get_lat(&(self->_message));
}

- (int32_t)lon {
  return mavlink_msg_gps_raw_int_get_lon(&(self->_message));
}

- (int32_t)alt {
  return mavlink_msg_gps_raw_int_get_alt(&(self->_message));
}

- (uint16_t)eph {
  return mavlink_msg_gps_raw_int_get_eph(&(self->_message));
}

- (uint16_t)epv {
  return mavlink_msg_gps_raw_int_get_epv(&(self->_message));
}

- (uint16_t)vel {
  return mavlink_msg_gps_raw_int_get_vel(&(self->_message));
}

- (uint16_t)cog {
  return mavlink_msg_gps_raw_int_get_cog(&(self->_message));
}

- (uint8_t)satellitesVisible {
  return mavlink_msg_gps_raw_int_get_satellites_visible(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeUsec=%lld, fixType=%d, lat=%d, lon=%d, alt=%d, eph=%d, epv=%d, vel=%d, cog=%d, satellitesVisible=%d", [super description], [self timeUsec], [self fixType], [self lat], [self lon], [self alt], [self eph], [self epv], [self vel], [self cog], [self satellitesVisible]];
}

@end
