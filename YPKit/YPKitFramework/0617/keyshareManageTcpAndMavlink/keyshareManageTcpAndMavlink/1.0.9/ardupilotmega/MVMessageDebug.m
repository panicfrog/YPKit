//
//  MVMessageDebug.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageDebug.h"

@implementation MVMessageDebug

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeBootMs:(uint32_t)timeBootMs ind:(uint8_t)ind value:(float)value {
  if ((self = [super init])) {
    mavlink_msg_debug_pack(systemId, componentId, &(self->_message), timeBootMs, ind, value);
  }
  return self;
}

- (uint32_t)timeBootMs {
  return mavlink_msg_debug_get_time_boot_ms(&(self->_message));
}

- (uint8_t)ind {
  return mavlink_msg_debug_get_ind(&(self->_message));
}

- (float)value {
  return mavlink_msg_debug_get_value(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeBootMs=%d, ind=%d, value=%f", [super description], [self timeBootMs], [self ind], [self value]];
}

@end
