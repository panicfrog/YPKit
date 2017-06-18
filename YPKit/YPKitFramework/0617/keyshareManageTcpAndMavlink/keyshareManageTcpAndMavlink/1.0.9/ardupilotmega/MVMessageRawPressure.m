//
//  MVMessageRawPressure.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageRawPressure.h"

@implementation MVMessageRawPressure

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec pressAbs:(int16_t)pressAbs pressDiff1:(int16_t)pressDiff1 pressDiff2:(int16_t)pressDiff2 temperature:(int16_t)temperature {
  if ((self = [super init])) {
    mavlink_msg_raw_pressure_pack(systemId, componentId, &(self->_message), timeUsec, pressAbs, pressDiff1, pressDiff2, temperature);
  }
  return self;
}

- (uint64_t)timeUsec {
  return mavlink_msg_raw_pressure_get_time_usec(&(self->_message));
}

- (int16_t)pressAbs {
  return mavlink_msg_raw_pressure_get_press_abs(&(self->_message));
}

- (int16_t)pressDiff1 {
  return mavlink_msg_raw_pressure_get_press_diff1(&(self->_message));
}

- (int16_t)pressDiff2 {
  return mavlink_msg_raw_pressure_get_press_diff2(&(self->_message));
}

- (int16_t)temperature {
  return mavlink_msg_raw_pressure_get_temperature(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeUsec=%lld, pressAbs=%d, pressDiff1=%d, pressDiff2=%d, temperature=%d", [super description], [self timeUsec], [self pressAbs], [self pressDiff1], [self pressDiff2], [self temperature]];
}

@end
