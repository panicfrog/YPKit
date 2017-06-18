//
//  MVMessageGlobalPositionInt.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageGlobalPositionInt.h"

@implementation MVMessageGlobalPositionInt

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeBootMs:(uint32_t)timeBootMs lat:(int32_t)lat lon:(int32_t)lon alt:(int32_t)alt relativeAlt:(int32_t)relativeAlt vx:(int16_t)vx vy:(int16_t)vy vz:(int16_t)vz hdg:(uint16_t)hdg {
  if ((self = [super init])) {
    mavlink_msg_global_position_int_pack(systemId, componentId, &(self->_message), timeBootMs, lat, lon, alt, relativeAlt, vx, vy, vz, hdg);
  }
  return self;
}

- (uint32_t)timeBootMs {
  return mavlink_msg_global_position_int_get_time_boot_ms(&(self->_message));
}

- (int32_t)lat {
  return mavlink_msg_global_position_int_get_lat(&(self->_message));
}

- (int32_t)lon {
  return mavlink_msg_global_position_int_get_lon(&(self->_message));
}

- (int32_t)alt {
  return mavlink_msg_global_position_int_get_alt(&(self->_message));
}

- (int32_t)relativeAlt {
  return mavlink_msg_global_position_int_get_relative_alt(&(self->_message));
}

- (int16_t)vx {
  return mavlink_msg_global_position_int_get_vx(&(self->_message));
}

- (int16_t)vy {
  return mavlink_msg_global_position_int_get_vy(&(self->_message));
}

- (int16_t)vz {
  return mavlink_msg_global_position_int_get_vz(&(self->_message));
}

- (uint16_t)hdg {
  return mavlink_msg_global_position_int_get_hdg(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeBootMs=%d, lat=%d, lon=%d, alt=%d, relativeAlt=%d, vx=%d, vy=%d, vz=%d, hdg=%d", [super description], [self timeBootMs], [self lat], [self lon], [self alt], [self relativeAlt], [self vx], [self vy], [self vz], [self hdg]];
}

@end
