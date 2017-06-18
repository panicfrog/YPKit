//
//  MVMessageDigicamControl.m
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageDigicamControl.h"

@implementation MVMessageDigicamControl

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent session:(uint8_t)session zoomPos:(uint8_t)zoomPos zoomStep:(int8_t)zoomStep focusLock:(uint8_t)focusLock shot:(uint8_t)shot commandId:(uint8_t)commandId extraParam:(uint8_t)extraParam extraValue:(float)extraValue {
  if ((self = [super init])) {
    mavlink_msg_digicam_control_pack(systemId, componentId, &(self->_message), targetSystem, targetComponent, session, zoomPos, zoomStep, focusLock, shot, commandId, extraParam, extraValue);
  }
  return self;
}

- (uint8_t)targetSystem {
  return mavlink_msg_digicam_control_get_target_system(&(self->_message));
}

- (uint8_t)targetComponent {
  return mavlink_msg_digicam_control_get_target_component(&(self->_message));
}

- (uint8_t)session {
  return mavlink_msg_digicam_control_get_session(&(self->_message));
}

- (uint8_t)zoomPos {
  return mavlink_msg_digicam_control_get_zoom_pos(&(self->_message));
}

- (int8_t)zoomStep {
  return mavlink_msg_digicam_control_get_zoom_step(&(self->_message));
}

- (uint8_t)focusLock {
  return mavlink_msg_digicam_control_get_focus_lock(&(self->_message));
}

- (uint8_t)shot {
  return mavlink_msg_digicam_control_get_shot(&(self->_message));
}

- (uint8_t)commandId {
  return mavlink_msg_digicam_control_get_command_id(&(self->_message));
}

- (uint8_t)extraParam {
  return mavlink_msg_digicam_control_get_extra_param(&(self->_message));
}

- (float)extraValue {
  return mavlink_msg_digicam_control_get_extra_value(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, targetSystem=%d, targetComponent=%d, session=%d, zoomPos=%d, zoomStep=%d, focusLock=%d, shot=%d, commandId=%d, extraParam=%d, extraValue=%f", [super description], [self targetSystem], [self targetComponent], [self session], [self zoomPos], [self zoomStep], [self focusLock], [self shot], [self commandId], [self extraParam], [self extraValue]];
}

@end
