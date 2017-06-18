//
//  MVMessageManualControl.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageManualControl.h"

@implementation MVMessageManualControl

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId target:(uint8_t)target roll:(float)roll pitch:(float)pitch yaw:(float)yaw thrust:(float)thrust rollManual:(uint8_t)rollManual pitchManual:(uint8_t)pitchManual yawManual:(uint8_t)yawManual thrustManual:(uint8_t)thrustManual {
  if ((self = [super init])) {
    mavlink_msg_manual_control_pack(systemId, componentId, &(self->_message), target, roll, pitch, yaw, thrust, rollManual, pitchManual, yawManual, thrustManual);
  }
  return self;
}

- (uint8_t)target {
  return mavlink_msg_manual_control_get_target(&(self->_message));
}

- (float)roll {
  return mavlink_msg_manual_control_get_roll(&(self->_message));
}

- (float)pitch {
  return mavlink_msg_manual_control_get_pitch(&(self->_message));
}

- (float)yaw {
  return mavlink_msg_manual_control_get_yaw(&(self->_message));
}

- (float)thrust {
  return mavlink_msg_manual_control_get_thrust(&(self->_message));
}

- (uint8_t)rollManual {
  return mavlink_msg_manual_control_get_roll_manual(&(self->_message));
}

- (uint8_t)pitchManual {
  return mavlink_msg_manual_control_get_pitch_manual(&(self->_message));
}

- (uint8_t)yawManual {
  return mavlink_msg_manual_control_get_yaw_manual(&(self->_message));
}

- (uint8_t)thrustManual {
  return mavlink_msg_manual_control_get_thrust_manual(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, target=%d, roll=%f, pitch=%f, yaw=%f, thrust=%f, rollManual=%d, pitchManual=%d, yawManual=%d, thrustManual=%d", [super description], [self target], [self roll], [self pitch], [self yaw], [self thrust], [self rollManual], [self pitchManual], [self yawManual], [self thrustManual]];
}

@end
