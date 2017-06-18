//
//  MVMessageLocalPositionSetpoint.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageLocalPositionSetpoint.h"

@implementation MVMessageLocalPositionSetpoint

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId coordinateFrame:(uint8_t)coordinateFrame x:(float)x y:(float)y z:(float)z yaw:(float)yaw {
  if ((self = [super init])) {
    mavlink_msg_local_position_setpoint_pack(systemId, componentId, &(self->_message), coordinateFrame, x, y, z, yaw);
  }
  return self;
}

- (uint8_t)coordinateFrame {
  return mavlink_msg_local_position_setpoint_get_coordinate_frame(&(self->_message));
}

- (float)x {
  return mavlink_msg_local_position_setpoint_get_x(&(self->_message));
}

- (float)y {
  return mavlink_msg_local_position_setpoint_get_y(&(self->_message));
}

- (float)z {
  return mavlink_msg_local_position_setpoint_get_z(&(self->_message));
}

- (float)yaw {
  return mavlink_msg_local_position_setpoint_get_yaw(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, coordinateFrame=%d, x=%f, y=%f, z=%f, yaw=%f", [super description], [self coordinateFrame], [self x], [self y], [self z], [self yaw]];
}

@end
