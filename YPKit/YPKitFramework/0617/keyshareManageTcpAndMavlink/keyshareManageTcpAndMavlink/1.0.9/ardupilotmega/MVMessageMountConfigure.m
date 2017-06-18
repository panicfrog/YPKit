//
//  MVMessageMountConfigure.m
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageMountConfigure.h"

@implementation MVMessageMountConfigure

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent mountMode:(uint8_t)mountMode stabRoll:(uint8_t)stabRoll stabPitch:(uint8_t)stabPitch stabYaw:(uint8_t)stabYaw {
  if ((self = [super init])) {
    mavlink_msg_mount_configure_pack(systemId, componentId, &(self->_message), targetSystem, targetComponent, mountMode, stabRoll, stabPitch, stabYaw);
  }
  return self;
}

- (uint8_t)targetSystem {
  return mavlink_msg_mount_configure_get_target_system(&(self->_message));
}

- (uint8_t)targetComponent {
  return mavlink_msg_mount_configure_get_target_component(&(self->_message));
}

- (uint8_t)mountMode {
  return mavlink_msg_mount_configure_get_mount_mode(&(self->_message));
}

- (uint8_t)stabRoll {
  return mavlink_msg_mount_configure_get_stab_roll(&(self->_message));
}

- (uint8_t)stabPitch {
  return mavlink_msg_mount_configure_get_stab_pitch(&(self->_message));
}

- (uint8_t)stabYaw {
  return mavlink_msg_mount_configure_get_stab_yaw(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, targetSystem=%d, targetComponent=%d, mountMode=%d, stabRoll=%d, stabPitch=%d, stabYaw=%d", [super description], [self targetSystem], [self targetComponent], [self mountMode], [self stabRoll], [self stabPitch], [self stabYaw]];
}

@end
