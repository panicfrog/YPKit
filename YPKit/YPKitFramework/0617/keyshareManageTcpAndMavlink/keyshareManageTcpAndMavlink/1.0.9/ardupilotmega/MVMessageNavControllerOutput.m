//
//  MVMessageNavControllerOutput.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageNavControllerOutput.h"

@implementation MVMessageNavControllerOutput

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId navRoll:(float)navRoll navPitch:(float)navPitch navBearing:(int16_t)navBearing targetBearing:(int16_t)targetBearing wpDist:(uint16_t)wpDist altError:(float)altError aspdError:(float)aspdError xtrackError:(float)xtrackError {
  if ((self = [super init])) {
    mavlink_msg_nav_controller_output_pack(systemId, componentId, &(self->_message), navRoll, navPitch, navBearing, targetBearing, wpDist, altError, aspdError, xtrackError);
  }
  return self;
}

- (float)navRoll {
  return mavlink_msg_nav_controller_output_get_nav_roll(&(self->_message));
}

- (float)navPitch {
  return mavlink_msg_nav_controller_output_get_nav_pitch(&(self->_message));
}

- (int16_t)navBearing {
  return mavlink_msg_nav_controller_output_get_nav_bearing(&(self->_message));
}

- (int16_t)targetBearing {
  return mavlink_msg_nav_controller_output_get_target_bearing(&(self->_message));
}

- (uint16_t)wpDist {
  return mavlink_msg_nav_controller_output_get_wp_dist(&(self->_message));
}

- (float)altError {
  return mavlink_msg_nav_controller_output_get_alt_error(&(self->_message));
}

- (float)aspdError {
  return mavlink_msg_nav_controller_output_get_aspd_error(&(self->_message));
}

- (float)xtrackError {
  return mavlink_msg_nav_controller_output_get_xtrack_error(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, navRoll=%f, navPitch=%f, navBearing=%d, targetBearing=%d, wpDist=%d, altError=%f, aspdError=%f, xtrackError=%f", [super description], [self navRoll], [self navPitch], [self navBearing], [self targetBearing], [self wpDist], [self altError], [self aspdError], [self xtrackError]];
}

@end
