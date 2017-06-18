//
//  MVMessageLocalPositionNed.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageLocalPositionNed.h"

@implementation MVMessageLocalPositionNed

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeBootMs:(uint32_t)timeBootMs x:(float)x y:(float)y z:(float)z vx:(float)vx vy:(float)vy vz:(float)vz {
  if ((self = [super init])) {
    mavlink_msg_local_position_ned_pack(systemId, componentId, &(self->_message), timeBootMs, x, y, z, vx, vy, vz);
  }
  return self;
}

- (uint32_t)timeBootMs {
  return mavlink_msg_local_position_ned_get_time_boot_ms(&(self->_message));
}

- (float)x {
  return mavlink_msg_local_position_ned_get_x(&(self->_message));
}

- (float)y {
  return mavlink_msg_local_position_ned_get_y(&(self->_message));
}

- (float)z {
  return mavlink_msg_local_position_ned_get_z(&(self->_message));
}

- (float)vx {
  return mavlink_msg_local_position_ned_get_vx(&(self->_message));
}

- (float)vy {
  return mavlink_msg_local_position_ned_get_vy(&(self->_message));
}

- (float)vz {
  return mavlink_msg_local_position_ned_get_vz(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeBootMs=%d, x=%f, y=%f, z=%f, vx=%f, vy=%f, vz=%f", [super description], [self timeBootMs], [self x], [self y], [self z], [self vx], [self vy], [self vz]];
}

@end
