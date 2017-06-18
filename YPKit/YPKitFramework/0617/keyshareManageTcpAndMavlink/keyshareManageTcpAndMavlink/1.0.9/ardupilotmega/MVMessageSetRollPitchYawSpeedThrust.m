//
//  MVMessageSetRollPitchYawSpeedThrust.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageSetRollPitchYawSpeedThrust.h"

@implementation MVMessageSetRollPitchYawSpeedThrust

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent rollSpeed:(float)rollSpeed pitchSpeed:(float)pitchSpeed yawSpeed:(float)yawSpeed thrust:(float)thrust {
  if ((self = [super init])) {
    mavlink_msg_set_roll_pitch_yaw_speed_thrust_pack(systemId, componentId, &(self->_message), targetSystem, targetComponent, rollSpeed, pitchSpeed, yawSpeed, thrust);
  }
  return self;
}

- (uint8_t)targetSystem {
  return mavlink_msg_set_roll_pitch_yaw_speed_thrust_get_target_system(&(self->_message));
}

- (uint8_t)targetComponent {
  return mavlink_msg_set_roll_pitch_yaw_speed_thrust_get_target_component(&(self->_message));
}

- (float)rollSpeed {
  return mavlink_msg_set_roll_pitch_yaw_speed_thrust_get_roll_speed(&(self->_message));
}

- (float)pitchSpeed {
  return mavlink_msg_set_roll_pitch_yaw_speed_thrust_get_pitch_speed(&(self->_message));
}

- (float)yawSpeed {
  return mavlink_msg_set_roll_pitch_yaw_speed_thrust_get_yaw_speed(&(self->_message));
}

- (float)thrust {
  return mavlink_msg_set_roll_pitch_yaw_speed_thrust_get_thrust(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, targetSystem=%d, targetComponent=%d, rollSpeed=%f, pitchSpeed=%f, yawSpeed=%f, thrust=%f", [super description], [self targetSystem], [self targetComponent], [self rollSpeed], [self pitchSpeed], [self yawSpeed], [self thrust]];
}

@end
