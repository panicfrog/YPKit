//
//  MVMessageParamRequestList.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageParamRequestList.h"

@implementation MVMessageParamRequestList

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent {
  if ((self = [super init])) {
    mavlink_msg_param_request_list_pack(systemId, componentId, &(self->_message), targetSystem, targetComponent);
  }
  return self;
}

- (uint8_t)targetSystem {
  return mavlink_msg_param_request_list_get_target_system(&(self->_message));
}

- (uint8_t)targetComponent {
  return mavlink_msg_param_request_list_get_target_component(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, targetSystem=%d, targetComponent=%d", [super description], [self targetSystem], [self targetComponent]];
}

@end
