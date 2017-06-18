//
//  MVMessageChangeOperatorControl.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageChangeOperatorControl.h"

@implementation MVMessageChangeOperatorControl

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem controlRequest:(uint8_t)controlRequest version:(uint8_t)version passkey:(char *)passkey {
  if ((self = [super init])) {
    mavlink_msg_change_operator_control_pack(systemId, componentId, &(self->_message), targetSystem, controlRequest, version, passkey);
  }
  return self;
}

- (uint8_t)targetSystem {
  return mavlink_msg_change_operator_control_get_target_system(&(self->_message));
}

- (uint8_t)controlRequest {
  return mavlink_msg_change_operator_control_get_control_request(&(self->_message));
}

- (uint8_t)version {
  return mavlink_msg_change_operator_control_get_version(&(self->_message));
}

- (NSString *)passkey {
  char string[25];
  mavlink_msg_change_operator_control_get_passkey(&(self->_message), (char *)&string);
  return [[NSString alloc] initWithBytes:string length:25 encoding:NSASCIIStringEncoding];
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, targetSystem=%d, controlRequest=%d, version=%d, passkey=%@", [super description], [self targetSystem], [self controlRequest], [self version], [self passkey]];
}

@end
