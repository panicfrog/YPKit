//
//  MVMessageSafetyAllowedArea.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageSafetyAllowedArea.h"

@implementation MVMessageSafetyAllowedArea

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId frame:(uint8_t)frame p1x:(float)p1x p1y:(float)p1y p1z:(float)p1z p2x:(float)p2x p2y:(float)p2y p2z:(float)p2z {
  if ((self = [super init])) {
    mavlink_msg_safety_allowed_area_pack(systemId, componentId, &(self->_message), frame, p1x, p1y, p1z, p2x, p2y, p2z);
  }
  return self;
}

- (uint8_t)frame {
  return mavlink_msg_safety_allowed_area_get_frame(&(self->_message));
}

- (float)p1x {
  return mavlink_msg_safety_allowed_area_get_p1x(&(self->_message));
}

- (float)p1y {
  return mavlink_msg_safety_allowed_area_get_p1y(&(self->_message));
}

- (float)p1z {
  return mavlink_msg_safety_allowed_area_get_p1z(&(self->_message));
}

- (float)p2x {
  return mavlink_msg_safety_allowed_area_get_p2x(&(self->_message));
}

- (float)p2y {
  return mavlink_msg_safety_allowed_area_get_p2y(&(self->_message));
}

- (float)p2z {
  return mavlink_msg_safety_allowed_area_get_p2z(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, frame=%d, p1x=%f, p1y=%f, p1z=%f, p2x=%f, p2y=%f, p2z=%f", [super description], [self frame], [self p1x], [self p1y], [self p1z], [self p2x], [self p2y], [self p2z]];
}

@end
