//
//  MVMessageGpsGlobalOrigin.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageGpsGlobalOrigin.h"

@implementation MVMessageGpsGlobalOrigin

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId latitude:(int32_t)latitude longitude:(int32_t)longitude altitude:(int32_t)altitude {
  if ((self = [super init])) {
    mavlink_msg_gps_global_origin_pack(systemId, componentId, &(self->_message), latitude, longitude, altitude);
  }
  return self;
}

- (int32_t)latitude {
  return mavlink_msg_gps_global_origin_get_latitude(&(self->_message));
}

- (int32_t)longitude {
  return mavlink_msg_gps_global_origin_get_longitude(&(self->_message));
}

- (int32_t)altitude {
  return mavlink_msg_gps_global_origin_get_altitude(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, latitude=%d, longitude=%d, altitude=%d", [super description], [self latitude], [self longitude], [self altitude]];
}

@end
