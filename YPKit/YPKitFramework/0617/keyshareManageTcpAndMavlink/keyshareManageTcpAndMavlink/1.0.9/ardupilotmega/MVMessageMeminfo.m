//
//  MVMessageMeminfo.m
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageMeminfo.h"

@implementation MVMessageMeminfo

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId brkval:(uint16_t)brkval freemem:(uint16_t)freemem {
  if ((self = [super init])) {
    mavlink_msg_meminfo_pack(systemId, componentId, &(self->_message), brkval, freemem);
  }
  return self;
}

- (uint16_t)brkval {
  return mavlink_msg_meminfo_get_brkval(&(self->_message));
}

- (uint16_t)freemem {
  return mavlink_msg_meminfo_get_freemem(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, brkval=%d, freemem=%d", [super description], [self brkval], [self freemem]];
}

@end
