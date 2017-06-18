//
//  MVMessageScaledPressure.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageScaledPressure.h"

@implementation MVMessageScaledPressure

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeBootMs:(uint32_t)timeBootMs pressAbs:(float)pressAbs pressDiff:(float)pressDiff temperature:(int16_t)temperature {
  if ((self = [super init])) {
    mavlink_msg_scaled_pressure_pack(systemId, componentId, &(self->_message), timeBootMs, pressAbs, pressDiff, temperature);
  }
  return self;
}

- (uint32_t)timeBootMs {
  return mavlink_msg_scaled_pressure_get_time_boot_ms(&(self->_message));
}

- (float)pressAbs {
  return mavlink_msg_scaled_pressure_get_press_abs(&(self->_message));
}

- (float)pressDiff {
  return mavlink_msg_scaled_pressure_get_press_diff(&(self->_message));
}

- (int16_t)temperature {
  return mavlink_msg_scaled_pressure_get_temperature(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeBootMs=%d, pressAbs=%f, pressDiff=%f, temperature=%d", [super description], [self timeBootMs], [self pressAbs], [self pressDiff], [self temperature]];
}

@end
