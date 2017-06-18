//
//  MVMessageSetGlobalPositionSetpointInt.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageSetGlobalPositionSetpointInt.h"

@implementation MVMessageSetGlobalPositionSetpointInt

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId coordinateFrame:(uint8_t)coordinateFrame latitude:(int32_t)latitude longitude:(int32_t)longitude altitude:(int32_t)altitude yaw:(int16_t)yaw {
  if ((self = [super init])) {
    mavlink_msg_set_global_position_setpoint_int_pack(systemId, componentId, &(self->_message), coordinateFrame, latitude, longitude, altitude, yaw);
  }
  return self;
}

- (uint8_t)coordinateFrame {
  return mavlink_msg_set_global_position_setpoint_int_get_coordinate_frame(&(self->_message));
}

- (int32_t)latitude {
  return mavlink_msg_set_global_position_setpoint_int_get_latitude(&(self->_message));
}

- (int32_t)longitude {
  return mavlink_msg_set_global_position_setpoint_int_get_longitude(&(self->_message));
}

- (int32_t)altitude {
  return mavlink_msg_set_global_position_setpoint_int_get_altitude(&(self->_message));
}

- (int16_t)yaw {
  return mavlink_msg_set_global_position_setpoint_int_get_yaw(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, coordinateFrame=%d, latitude=%d, longitude=%d, altitude=%d, yaw=%d", [super description], [self coordinateFrame], [self latitude], [self longitude], [self altitude], [self yaw]];
}

@end
