//
//  MVMessageMountControl.m
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageMountControl.h"

@implementation MVMessageMountControl

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent inputA:(int32_t)inputA inputB:(int32_t)inputB inputC:(int32_t)inputC savePosition:(uint8_t)savePosition {
  if ((self = [super init])) {
    mavlink_msg_mount_control_pack(systemId, componentId, &(self->_message), targetSystem, targetComponent, inputA, inputB, inputC, savePosition);
  }
  return self;
}

- (uint8_t)targetSystem {
  return mavlink_msg_mount_control_get_target_system(&(self->_message));
}

- (uint8_t)targetComponent {
  return mavlink_msg_mount_control_get_target_component(&(self->_message));
}

- (int32_t)inputA {
  return mavlink_msg_mount_control_get_input_a(&(self->_message));
}

- (int32_t)inputB {
  return mavlink_msg_mount_control_get_input_b(&(self->_message));
}

- (int32_t)inputC {
  return mavlink_msg_mount_control_get_input_c(&(self->_message));
}

- (uint8_t)savePosition {
  return mavlink_msg_mount_control_get_save_position(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, targetSystem=%d, targetComponent=%d, inputA=%d, inputB=%d, inputC=%d, savePosition=%d", [super description], [self targetSystem], [self targetComponent], [self inputA], [self inputB], [self inputC], [self savePosition]];
}

@end
