//
//  MVMessageViconPositionEstimate.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageViconPositionEstimate.h"

@implementation MVMessageViconPositionEstimate

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId usec:(uint64_t)usec x:(float)x y:(float)y z:(float)z roll:(float)roll pitch:(float)pitch yaw:(float)yaw {
  if ((self = [super init])) {
    mavlink_msg_vicon_position_estimate_pack(systemId, componentId, &(self->_message), usec, x, y, z, roll, pitch, yaw);
  }
  return self;
}

- (uint64_t)usec {
  return mavlink_msg_vicon_position_estimate_get_usec(&(self->_message));
}

- (float)x {
  return mavlink_msg_vicon_position_estimate_get_x(&(self->_message));
}

- (float)y {
  return mavlink_msg_vicon_position_estimate_get_y(&(self->_message));
}

- (float)z {
  return mavlink_msg_vicon_position_estimate_get_z(&(self->_message));
}

- (float)roll {
  return mavlink_msg_vicon_position_estimate_get_roll(&(self->_message));
}

- (float)pitch {
  return mavlink_msg_vicon_position_estimate_get_pitch(&(self->_message));
}

- (float)yaw {
  return mavlink_msg_vicon_position_estimate_get_yaw(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, usec=%lld, x=%f, y=%f, z=%f, roll=%f, pitch=%f, yaw=%f", [super description], [self usec], [self x], [self y], [self z], [self roll], [self pitch], [self yaw]];
}

@end
