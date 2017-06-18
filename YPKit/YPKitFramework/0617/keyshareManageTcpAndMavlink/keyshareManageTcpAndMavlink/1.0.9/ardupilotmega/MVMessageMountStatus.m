//
//  MVMessageMountStatus.m
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageMountStatus.h"

@implementation MVMessageMountStatus

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent pointingA:(int32_t)pointingA pointingB:(int32_t)pointingB pointingC:(int32_t)pointingC {
  if ((self = [super init])) {
    mavlink_msg_mount_status_pack(systemId, componentId, &(self->_message), targetSystem, targetComponent, pointingA, pointingB, pointingC);
  }
  return self;
}

- (uint8_t)targetSystem {
  return mavlink_msg_mount_status_get_target_system(&(self->_message));
}

- (uint8_t)targetComponent {
  return mavlink_msg_mount_status_get_target_component(&(self->_message));
}

- (int32_t)pointingA {
  return mavlink_msg_mount_status_get_pointing_a(&(self->_message));
}

- (int32_t)pointingB {
  return mavlink_msg_mount_status_get_pointing_b(&(self->_message));
}

- (int32_t)pointingC {
  return mavlink_msg_mount_status_get_pointing_c(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, targetSystem=%d, targetComponent=%d, pointingA=%d, pointingB=%d, pointingC=%d", [super description], [self targetSystem], [self targetComponent], [self pointingA], [self pointingB], [self pointingC]];
}

@end
