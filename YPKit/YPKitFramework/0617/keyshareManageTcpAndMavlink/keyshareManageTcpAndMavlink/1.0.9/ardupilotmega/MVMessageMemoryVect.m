//
//  MVMessageMemoryVect.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageMemoryVect.h"

@implementation MVMessageMemoryVect

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId address:(uint16_t)address ver:(uint8_t)ver type:(uint8_t)type value:(int8_t *)value {
  if ((self = [super init])) {
    mavlink_msg_memory_vect_pack(systemId, componentId, &(self->_message), address, ver, type, value);
  }
  return self;
}

- (uint16_t)address {
  return mavlink_msg_memory_vect_get_address(&(self->_message));
}

- (uint8_t)ver {
  return mavlink_msg_memory_vect_get_ver(&(self->_message));
}

- (uint8_t)type {
  return mavlink_msg_memory_vect_get_type(&(self->_message));
}

- (uint16_t)value:(int8_t *)value {
  return mavlink_msg_memory_vect_get_value(&(self->_message), value);
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, address=%d, ver=%d, type=%d, value=%@", [super description], [self address], [self ver], [self type], @"[array of int8_t[32]]"];
}

@end
