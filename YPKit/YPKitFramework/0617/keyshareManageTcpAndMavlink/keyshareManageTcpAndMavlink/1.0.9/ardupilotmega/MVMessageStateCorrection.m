//
//  MVMessageStateCorrection.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageStateCorrection.h"

@implementation MVMessageStateCorrection

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId xErr:(float)xErr yErr:(float)yErr zErr:(float)zErr rollErr:(float)rollErr pitchErr:(float)pitchErr yawErr:(float)yawErr vxErr:(float)vxErr vyErr:(float)vyErr vzErr:(float)vzErr {
  if ((self = [super init])) {
    mavlink_msg_state_correction_pack(systemId, componentId, &(self->_message), xErr, yErr, zErr, rollErr, pitchErr, yawErr, vxErr, vyErr, vzErr);
  }
  return self;
}

- (float)xErr {
  return mavlink_msg_state_correction_get_xErr(&(self->_message));
}

- (float)yErr {
  return mavlink_msg_state_correction_get_yErr(&(self->_message));
}

- (float)zErr {
  return mavlink_msg_state_correction_get_zErr(&(self->_message));
}

- (float)rollErr {
  return mavlink_msg_state_correction_get_rollErr(&(self->_message));
}

- (float)pitchErr {
  return mavlink_msg_state_correction_get_pitchErr(&(self->_message));
}

- (float)yawErr {
  return mavlink_msg_state_correction_get_yawErr(&(self->_message));
}

- (float)vxErr {
  return mavlink_msg_state_correction_get_vxErr(&(self->_message));
}

- (float)vyErr {
  return mavlink_msg_state_correction_get_vyErr(&(self->_message));
}

- (float)vzErr {
  return mavlink_msg_state_correction_get_vzErr(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, xErr=%f, yErr=%f, zErr=%f, rollErr=%f, pitchErr=%f, yawErr=%f, vxErr=%f, vyErr=%f, vzErr=%f", [super description], [self xErr], [self yErr], [self zErr], [self rollErr], [self pitchErr], [self yawErr], [self vxErr], [self vyErr], [self vzErr]];
}

@end
