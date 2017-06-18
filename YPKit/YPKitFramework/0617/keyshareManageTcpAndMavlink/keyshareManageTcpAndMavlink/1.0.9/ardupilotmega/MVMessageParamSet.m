//
//  MVMessageParamSet.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageParamSet.h"

@implementation MVMessageParamSet

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent paramId:(char *)paramId paramValue:(float)paramValue paramType:(uint8_t)paramType {
  if ((self = [super init])) {
    mavlink_msg_param_set_pack(systemId, componentId, &(self->_message), targetSystem, targetComponent, paramId, paramValue, paramType);
  }
  return self;
}

- (uint8_t)targetSystem {
  return mavlink_msg_param_set_get_target_system(&(self->_message));
}

- (uint8_t)targetComponent {
  return mavlink_msg_param_set_get_target_component(&(self->_message));
}

- (NSString *)paramId {
  char string[16];
  mavlink_msg_param_set_get_param_id(&(self->_message), (char *)&string);
  return [[NSString alloc] initWithBytes:string length:16 encoding:NSASCIIStringEncoding];
}

- (float)paramValue {
  return mavlink_msg_param_set_get_param_value(&(self->_message));
}

- (uint8_t)paramType {
  return mavlink_msg_param_set_get_param_type(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, targetSystem=%d, targetComponent=%d, paramId=%@, paramValue=%f, paramType=%d", [super description], [self targetSystem], [self targetComponent], [self paramId], [self paramValue], [self paramType]];
}

@end
