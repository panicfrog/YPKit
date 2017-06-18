//
//  MVMessageSystemTime.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageSystemTime.h"

@implementation MVMessageSystemTime

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUnixUsec:(uint64_t)timeUnixUsec timeBootMs:(uint32_t)timeBootMs {
  if ((self = [super init])) {
    mavlink_msg_system_time_pack(systemId, componentId, &(self->_message), timeUnixUsec, timeBootMs);
  }
  return self;
}

- (uint64_t)timeUnixUsec {
  return mavlink_msg_system_time_get_time_unix_usec(&(self->_message));
}

- (uint32_t)timeBootMs {
  return mavlink_msg_system_time_get_time_boot_ms(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeUnixUsec=%lld, timeBootMs=%d", [super description], [self timeUnixUsec], [self timeBootMs]];
}

@end
