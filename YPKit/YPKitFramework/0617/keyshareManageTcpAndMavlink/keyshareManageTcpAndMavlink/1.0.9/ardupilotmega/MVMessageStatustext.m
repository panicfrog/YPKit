//
//  MVMessageStatustext.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageStatustext.h"

@implementation MVMessageStatustext

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId severity:(uint8_t)severity text:(char *)text {
  if ((self = [super init])) {
    mavlink_msg_statustext_pack(systemId, componentId, &(self->_message), severity, text);
  }
  return self;
}

- (uint8_t)severity {
  return mavlink_msg_statustext_get_severity(&(self->_message));
}

- (NSString *)text {
  char string[50];
  mavlink_msg_statustext_get_text(&(self->_message), (char *)&string);
  return [[NSString alloc] initWithBytes:string length:50 encoding:NSASCIIStringEncoding];
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, severity=%d, text=%@", [super description], [self severity], [self text]];
}

@end
