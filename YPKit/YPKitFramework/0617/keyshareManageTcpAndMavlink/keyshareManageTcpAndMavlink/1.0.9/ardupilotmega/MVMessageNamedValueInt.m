//
//  MVMessageNamedValueInt.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageNamedValueInt.h"

@implementation MVMessageNamedValueInt

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeBootMs:(uint32_t)timeBootMs name:(char *)name value:(int32_t)value {
  if ((self = [super init])) {
    mavlink_msg_named_value_int_pack(systemId, componentId, &(self->_message), timeBootMs, name, value);
  }
  return self;
}

- (uint32_t)timeBootMs {
  return mavlink_msg_named_value_int_get_time_boot_ms(&(self->_message));
}

- (NSString *)name {
  char string[10];
  mavlink_msg_named_value_int_get_name(&(self->_message), (char *)&string);
  return [[NSString alloc] initWithBytes:string length:10 encoding:NSASCIIStringEncoding];
}

- (int32_t)value {
  return mavlink_msg_named_value_int_get_value(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeBootMs=%d, name=%@, value=%d", [super description], [self timeBootMs], [self name], [self value]];
}

@end
