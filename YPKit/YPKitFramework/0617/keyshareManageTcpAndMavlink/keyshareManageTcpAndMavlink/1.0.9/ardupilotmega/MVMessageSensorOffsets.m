//
//  MVMessageSensorOffsets.m
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageSensorOffsets.h"

@implementation MVMessageSensorOffsets

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId magOfsX:(int16_t)magOfsX magOfsY:(int16_t)magOfsY magOfsZ:(int16_t)magOfsZ magDeclination:(float)magDeclination rawPress:(int32_t)rawPress rawTemp:(int32_t)rawTemp gyroCalX:(float)gyroCalX gyroCalY:(float)gyroCalY gyroCalZ:(float)gyroCalZ accelCalX:(float)accelCalX accelCalY:(float)accelCalY accelCalZ:(float)accelCalZ {
  if ((self = [super init])) {
    mavlink_msg_sensor_offsets_pack(systemId, componentId, &(self->_message), magOfsX, magOfsY, magOfsZ, magDeclination, rawPress, rawTemp, gyroCalX, gyroCalY, gyroCalZ, accelCalX, accelCalY, accelCalZ);
  }
  return self;
}

- (int16_t)magOfsX {
  return mavlink_msg_sensor_offsets_get_mag_ofs_x(&(self->_message));
}

- (int16_t)magOfsY {
  return mavlink_msg_sensor_offsets_get_mag_ofs_y(&(self->_message));
}

- (int16_t)magOfsZ {
  return mavlink_msg_sensor_offsets_get_mag_ofs_z(&(self->_message));
}

- (float)magDeclination {
  return mavlink_msg_sensor_offsets_get_mag_declination(&(self->_message));
}

- (int32_t)rawPress {
  return mavlink_msg_sensor_offsets_get_raw_press(&(self->_message));
}

- (int32_t)rawTemp {
  return mavlink_msg_sensor_offsets_get_raw_temp(&(self->_message));
}

- (float)gyroCalX {
  return mavlink_msg_sensor_offsets_get_gyro_cal_x(&(self->_message));
}

- (float)gyroCalY {
  return mavlink_msg_sensor_offsets_get_gyro_cal_y(&(self->_message));
}

- (float)gyroCalZ {
  return mavlink_msg_sensor_offsets_get_gyro_cal_z(&(self->_message));
}

- (float)accelCalX {
  return mavlink_msg_sensor_offsets_get_accel_cal_x(&(self->_message));
}

- (float)accelCalY {
  return mavlink_msg_sensor_offsets_get_accel_cal_y(&(self->_message));
}

- (float)accelCalZ {
  return mavlink_msg_sensor_offsets_get_accel_cal_z(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, magOfsX=%d, magOfsY=%d, magOfsZ=%d, magDeclination=%f, rawPress=%d, rawTemp=%d, gyroCalX=%f, gyroCalY=%f, gyroCalZ=%f, accelCalX=%f, accelCalY=%f, accelCalZ=%f", [super description], [self magOfsX], [self magOfsY], [self magOfsZ], [self magDeclination], [self rawPress], [self rawTemp], [self gyroCalX], [self gyroCalY], [self gyroCalZ], [self accelCalX], [self accelCalY], [self accelCalZ]];
}

@end
