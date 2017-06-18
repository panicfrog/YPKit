//
//  MVMessageAuthKey.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageAuthKey.h"

@implementation MVMessageAuthKey

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId key:(char *)key {
  if ((self = [super init])) {
    mavlink_msg_auth_key_pack(systemId, componentId, &(self->_message), key);
  }
  return self;
}

- (NSString *)key {
  char string[32];
  mavlink_msg_auth_key_get_key(&(self->_message), (char *)&string);
  return [[NSString alloc] initWithBytes:string length:32 encoding:NSASCIIStringEncoding];
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, key=%@", [super description], [self key]];
}

@end
