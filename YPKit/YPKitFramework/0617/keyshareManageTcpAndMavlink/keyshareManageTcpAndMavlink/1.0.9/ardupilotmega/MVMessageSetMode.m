//
//  MVMessageSetMode.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageSetMode.h"

@implementation MVMessageSetMode

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem baseMode:(uint8_t)baseMode customMode:(uint32_t)customMode {
  if ((self = [super init])) {
    mavlink_msg_set_mode_pack(systemId, componentId, &(self->_message), targetSystem, baseMode, customMode);
  }
  return self;
}

- (uint8_t)targetSystem {
  return mavlink_msg_set_mode_get_target_system(&(self->_message));
}

- (uint8_t)baseMode {
  return mavlink_msg_set_mode_get_base_mode(&(self->_message));
}

- (uint32_t)customMode {
  return mavlink_msg_set_mode_get_custom_mode(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, targetSystem=%d, baseMode=%d, customMode=%d", [super description], [self targetSystem], [self baseMode], [self customMode]];
}

@end
