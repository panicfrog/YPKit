//
//  MVMessageFencePoint.m
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageFencePoint.h"

@implementation MVMessageFencePoint

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent idx:(uint8_t)idx count:(uint8_t)count lat:(float)lat lng:(float)lng {
  if ((self = [super init])) {
    mavlink_msg_fence_point_pack(systemId, componentId, &(self->_message), targetSystem, targetComponent, idx, count, lat, lng);
  }
  return self;
}

- (uint8_t)targetSystem {
  return mavlink_msg_fence_point_get_target_system(&(self->_message));
}

- (uint8_t)targetComponent {
  return mavlink_msg_fence_point_get_target_component(&(self->_message));
}

- (uint8_t)idx {
  return mavlink_msg_fence_point_get_idx(&(self->_message));
}

- (uint8_t)count {
  return mavlink_msg_fence_point_get_count(&(self->_message));
}

- (float)lat {
  return mavlink_msg_fence_point_get_lat(&(self->_message));
}

- (float)lng {
  return mavlink_msg_fence_point_get_lng(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, targetSystem=%d, targetComponent=%d, idx=%d, count=%d, lat=%f, lng=%f", [super description], [self targetSystem], [self targetComponent], [self idx], [self count], [self lat], [self lng]];
}

@end
