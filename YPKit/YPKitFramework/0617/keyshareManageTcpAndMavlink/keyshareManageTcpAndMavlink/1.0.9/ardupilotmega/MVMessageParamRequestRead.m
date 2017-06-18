//
//  MVMessageParamRequestRead.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageParamRequestRead.h"

@implementation MVMessageParamRequestRead

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent paramId:(char *)paramId paramIndex:(int16_t)paramIndex {
  if ((self = [super init])) {
    mavlink_msg_param_request_read_pack(systemId, componentId, &(self->_message), targetSystem, targetComponent, paramId, paramIndex);
  }
  return self;
}

- (uint8_t)targetSystem {
  return mavlink_msg_param_request_read_get_target_system(&(self->_message));
}

- (uint8_t)targetComponent {
  return mavlink_msg_param_request_read_get_target_component(&(self->_message));
}

- (NSString *)paramId {
  char string[16];
  mavlink_msg_param_request_read_get_param_id(&(self->_message), (char *)&string);
  return [[NSString alloc] initWithBytes:string length:16 encoding:NSASCIIStringEncoding];
}

- (int16_t)paramIndex {
  return mavlink_msg_param_request_read_get_param_index(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, targetSystem=%d, targetComponent=%d, paramId=%@, paramIndex=%d", [super description], [self targetSystem], [self targetComponent], [self paramId], [self paramIndex]];
}

@end
