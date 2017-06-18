//
//  MVMessageSimstate.m
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageSimstate.h"

@implementation MVMessageSimstate

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId roll:(float)roll pitch:(float)pitch yaw:(float)yaw xacc:(float)xacc yacc:(float)yacc zacc:(float)zacc xgyro:(float)xgyro ygyro:(float)ygyro zgyro:(float)zgyro {
  if ((self = [super init])) {
    mavlink_msg_simstate_pack(systemId, componentId, &(self->_message), roll, pitch, yaw, xacc, yacc, zacc, xgyro, ygyro, zgyro);
  }
  return self;
}

- (float)roll {
  return mavlink_msg_simstate_get_roll(&(self->_message));
}

- (float)pitch {
  return mavlink_msg_simstate_get_pitch(&(self->_message));
}

- (float)yaw {
  return mavlink_msg_simstate_get_yaw(&(self->_message));
}

- (float)xacc {
  return mavlink_msg_simstate_get_xacc(&(self->_message));
}

- (float)yacc {
  return mavlink_msg_simstate_get_yacc(&(self->_message));
}

- (float)zacc {
  return mavlink_msg_simstate_get_zacc(&(self->_message));
}

- (float)xgyro {
  return mavlink_msg_simstate_get_xgyro(&(self->_message));
}

- (float)ygyro {
  return mavlink_msg_simstate_get_ygyro(&(self->_message));
}

- (float)zgyro {
  return mavlink_msg_simstate_get_zgyro(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, roll=%f, pitch=%f, yaw=%f, xacc=%f, yacc=%f, zacc=%f, xgyro=%f, ygyro=%f, zgyro=%f", [super description], [self roll], [self pitch], [self yaw], [self xacc], [self yacc], [self zacc], [self xgyro], [self ygyro], [self zgyro]];
}

@end
