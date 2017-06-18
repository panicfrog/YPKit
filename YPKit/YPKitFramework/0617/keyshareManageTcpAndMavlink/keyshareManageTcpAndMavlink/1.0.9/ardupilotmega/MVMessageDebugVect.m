//
//  MVMessageDebugVect.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageDebugVect.h"

@implementation MVMessageDebugVect

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId name:(char *)name timeUsec:(uint64_t)timeUsec x:(float)x y:(float)y z:(float)z {
  if ((self = [super init])) {
    mavlink_msg_debug_vect_pack(systemId, componentId, &(self->_message), name, timeUsec, x, y, z);
  }
  return self;
}

- (NSString *)name {
  char string[10];
  mavlink_msg_debug_vect_get_name(&(self->_message), (char *)&string);
  return [[NSString alloc] initWithBytes:string length:10 encoding:NSASCIIStringEncoding];
}

- (uint64_t)timeUsec {
  return mavlink_msg_debug_vect_get_time_usec(&(self->_message));
}

- (float)x {
  return mavlink_msg_debug_vect_get_x(&(self->_message));
}

- (float)y {
  return mavlink_msg_debug_vect_get_y(&(self->_message));
}

- (float)z {
  return mavlink_msg_debug_vect_get_z(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, name=%@, timeUsec=%lld, x=%f, y=%f, z=%f", [super description], [self name], [self timeUsec], [self x], [self y], [self z]];
}

@end
