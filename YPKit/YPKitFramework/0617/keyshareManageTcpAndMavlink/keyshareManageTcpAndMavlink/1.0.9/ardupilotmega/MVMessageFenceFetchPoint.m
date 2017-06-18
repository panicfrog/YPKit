//
//  MVMessageFenceFetchPoint.m
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageFenceFetchPoint.h"

@implementation MVMessageFenceFetchPoint

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent idx:(uint8_t)idx {
  if ((self = [super init])) {
    mavlink_msg_fence_fetch_point_pack(systemId, componentId, &(self->_message), targetSystem, targetComponent, idx);
  }
  return self;
}

- (uint8_t)targetSystem {
  return mavlink_msg_fence_fetch_point_get_target_system(&(self->_message));
}

- (uint8_t)targetComponent {
  return mavlink_msg_fence_fetch_point_get_target_component(&(self->_message));
}

- (uint8_t)idx {
  return mavlink_msg_fence_fetch_point_get_idx(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, targetSystem=%d, targetComponent=%d, idx=%d", [super description], [self targetSystem], [self targetComponent], [self idx]];
}

@end
