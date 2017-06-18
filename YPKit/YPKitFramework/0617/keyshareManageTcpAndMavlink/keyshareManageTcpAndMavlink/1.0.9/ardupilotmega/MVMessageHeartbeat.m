//
//  MVMessageHeartbeat.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageHeartbeat.h"

@implementation MVMessageHeartbeat

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId type:(uint8_t)type autopilot:(uint8_t)autopilot baseMode:(uint8_t)baseMode customMode:(uint32_t)customMode systemStatus:(uint8_t)systemStatus mavlink_version:(uint8_t)mavlink_version {
  if ((self = [super init])) {
    mavlink_msg_heartbeat_pack(systemId, componentId, &(self->_message), type, autopilot, baseMode, customMode, systemStatus,mavlink_version);
  }
  return self;
}

- (uint8_t)type {
  return mavlink_msg_heartbeat_get_type(&(self->_message));
}

- (uint8_t)autopilot {
  return mavlink_msg_heartbeat_get_autopilot(&(self->_message));
}

- (uint8_t)baseMode {
  return mavlink_msg_heartbeat_get_base_mode(&(self->_message));
}

- (uint32_t)customMode {
  return mavlink_msg_heartbeat_get_custom_mode(&(self->_message));
}

- (uint8_t)systemStatus {
  return mavlink_msg_heartbeat_get_system_status(&(self->_message));
}

- (uint8_t)mavlinkVersion {
  return mavlink_msg_heartbeat_get_mavlink_version(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, type=%d, autopilot=%d, baseMode=%d, customMode=%d, systemStatus=%d, mavlinkVersion=%d", [super description], [self type], [self autopilot], [self baseMode], [self customMode], [self systemStatus], [self mavlinkVersion]];
}

@end
