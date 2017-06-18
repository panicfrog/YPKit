//
//  MVMessageAhrs.m
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageAhrs.h"

@implementation MVMessageAhrs

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId omegaIx:(float)omegaIx omegaIy:(float)omegaIy omegaIz:(float)omegaIz accelWeight:(float)accelWeight renormVal:(float)renormVal errorRp:(float)errorRp errorYaw:(float)errorYaw {
  if ((self = [super init])) {
    mavlink_msg_ahrs_pack(systemId, componentId, &(self->_message), omegaIx, omegaIy, omegaIz, accelWeight, renormVal, errorRp, errorYaw);
  }
  return self;
}

- (float)omegaIx {
  return mavlink_msg_ahrs_get_omegaIx(&(self->_message));
}

- (float)omegaIy {
  return mavlink_msg_ahrs_get_omegaIy(&(self->_message));
}

- (float)omegaIz {
  return mavlink_msg_ahrs_get_omegaIz(&(self->_message));
}

- (float)accelWeight {
  return mavlink_msg_ahrs_get_accel_weight(&(self->_message));
}

- (float)renormVal {
  return mavlink_msg_ahrs_get_renorm_val(&(self->_message));
}

- (float)errorRp {
  return mavlink_msg_ahrs_get_error_rp(&(self->_message));
}

- (float)errorYaw {
  return mavlink_msg_ahrs_get_error_yaw(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, omegaIx=%f, omegaIy=%f, omegaIz=%f, accelWeight=%f, renormVal=%f, errorRp=%f, errorYaw=%f", [super description], [self omegaIx], [self omegaIy], [self omegaIz], [self accelWeight], [self renormVal], [self errorRp], [self errorYaw]];
}

@end
