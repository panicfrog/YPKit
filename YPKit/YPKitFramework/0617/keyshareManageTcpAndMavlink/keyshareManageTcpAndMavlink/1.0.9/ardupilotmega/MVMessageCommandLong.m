//
//  MVMessageCommandLong.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageCommandLong.h"

@implementation MVMessageCommandLong

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent command:(uint16_t)command confirmation:(uint8_t)confirmation param1:(float)param1 param2:(float)param2 param3:(float)param3 param4:(float)param4 param5:(float)param5 param6:(float)param6 param7:(float)param7 {
  if ((self = [super init])) {
    mavlink_msg_command_long_pack(systemId, componentId, &(self->_message), targetSystem, targetComponent, command, confirmation, param1, param2, param3, param4, param5, param6, param7);
  }
  return self;
}

- (uint8_t)targetSystem {
  return mavlink_msg_command_long_get_target_system(&(self->_message));
}

- (uint8_t)targetComponent {
  return mavlink_msg_command_long_get_target_component(&(self->_message));
}

- (uint16_t)command {
  return mavlink_msg_command_long_get_command(&(self->_message));
}

- (uint8_t)confirmation {
  return mavlink_msg_command_long_get_confirmation(&(self->_message));
}

- (float)param1 {
  return mavlink_msg_command_long_get_param1(&(self->_message));
}

- (float)param2 {
  return mavlink_msg_command_long_get_param2(&(self->_message));
}

- (float)param3 {
  return mavlink_msg_command_long_get_param3(&(self->_message));
}

- (float)param4 {
  return mavlink_msg_command_long_get_param4(&(self->_message));
}

- (float)param5 {
  return mavlink_msg_command_long_get_param5(&(self->_message));
}

- (float)param6 {
  return mavlink_msg_command_long_get_param6(&(self->_message));
}

- (float)param7 {
  return mavlink_msg_command_long_get_param7(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, targetSystem=%d, targetComponent=%d, command=%d, confirmation=%d, param1=%f, param2=%f, param3=%f, param4=%f, param5=%f, param6=%f, param7=%f", [super description], [self targetSystem], [self targetComponent], [self command], [self confirmation], [self param1], [self param2], [self param3], [self param4], [self param5], [self param6], [self param7]];
}

@end
