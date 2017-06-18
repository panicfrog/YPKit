//
//  MVMessageLocalPositionNedSystemGlobalOffset.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageLocalPositionNedSystemGlobalOffset.h"

@implementation MVMessageLocalPositionNedSystemGlobalOffset

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeBootMs:(uint32_t)timeBootMs x:(float)x y:(float)y z:(float)z roll:(float)roll pitch:(float)pitch yaw:(float)yaw {
  if ((self = [super init])) {
    mavlink_msg_local_position_ned_system_global_offset_pack(systemId, componentId, &(self->_message), timeBootMs, x, y, z, roll, pitch, yaw);
  }
  return self;
}

- (uint32_t)timeBootMs {
  return mavlink_msg_local_position_ned_system_global_offset_get_time_boot_ms(&(self->_message));
}

- (float)x {
  return mavlink_msg_local_position_ned_system_global_offset_get_x(&(self->_message));
}

- (float)y {
  return mavlink_msg_local_position_ned_system_global_offset_get_y(&(self->_message));
}

- (float)z {
  return mavlink_msg_local_position_ned_system_global_offset_get_z(&(self->_message));
}

- (float)roll {
  return mavlink_msg_local_position_ned_system_global_offset_get_roll(&(self->_message));
}

- (float)pitch {
  return mavlink_msg_local_position_ned_system_global_offset_get_pitch(&(self->_message));
}

- (float)yaw {
  return mavlink_msg_local_position_ned_system_global_offset_get_yaw(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeBootMs=%d, x=%f, y=%f, z=%f, roll=%f, pitch=%f, yaw=%f", [super description], [self timeBootMs], [self x], [self y], [self z], [self roll], [self pitch], [self yaw]];
}

@end
