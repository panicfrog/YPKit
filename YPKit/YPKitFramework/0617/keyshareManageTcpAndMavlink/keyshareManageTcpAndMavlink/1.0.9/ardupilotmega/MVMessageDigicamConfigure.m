//
//  MVMessageDigicamConfigure.m
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageDigicamConfigure.h"

@implementation MVMessageDigicamConfigure

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent mode:(uint8_t)mode shutterSpeed:(uint16_t)shutterSpeed aperture:(uint8_t)aperture iso:(uint8_t)iso exposureType:(uint8_t)exposureType commandId:(uint8_t)commandId engineCutOff:(uint8_t)engineCutOff extraParam:(uint8_t)extraParam extraValue:(float)extraValue {
  if ((self = [super init])) {
    mavlink_msg_digicam_configure_pack(systemId, componentId, &(self->_message), targetSystem, targetComponent, mode, shutterSpeed, aperture, iso, exposureType, commandId, engineCutOff, extraParam, extraValue);
  }
  return self;
}

- (uint8_t)targetSystem {
  return mavlink_msg_digicam_configure_get_target_system(&(self->_message));
}

- (uint8_t)targetComponent {
  return mavlink_msg_digicam_configure_get_target_component(&(self->_message));
}

- (uint8_t)mode {
  return mavlink_msg_digicam_configure_get_mode(&(self->_message));
}

- (uint16_t)shutterSpeed {
  return mavlink_msg_digicam_configure_get_shutter_speed(&(self->_message));
}

- (uint8_t)aperture {
  return mavlink_msg_digicam_configure_get_aperture(&(self->_message));
}

- (uint8_t)iso {
  return mavlink_msg_digicam_configure_get_iso(&(self->_message));
}

- (uint8_t)exposureType {
  return mavlink_msg_digicam_configure_get_exposure_type(&(self->_message));
}

- (uint8_t)commandId {
  return mavlink_msg_digicam_configure_get_command_id(&(self->_message));
}

- (uint8_t)engineCutOff {
  return mavlink_msg_digicam_configure_get_engine_cut_off(&(self->_message));
}

- (uint8_t)extraParam {
  return mavlink_msg_digicam_configure_get_extra_param(&(self->_message));
}

- (float)extraValue {
  return mavlink_msg_digicam_configure_get_extra_value(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, targetSystem=%d, targetComponent=%d, mode=%d, shutterSpeed=%d, aperture=%d, iso=%d, exposureType=%d, commandId=%d, engineCutOff=%d, extraParam=%d, extraValue=%f", [super description], [self targetSystem], [self targetComponent], [self mode], [self shutterSpeed], [self aperture], [self iso], [self exposureType], [self commandId], [self engineCutOff], [self extraParam], [self extraValue]];
}

@end
