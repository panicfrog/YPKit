//
//  MVMessageAhrs.h
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a AHRS Mavlink message.

 @discussion Status of DCM attitude estimator
 */
@interface MVMessageAhrs : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId omegaIx:(float)omegaIx omegaIy:(float)omegaIy omegaIz:(float)omegaIz accelWeight:(float)accelWeight renormVal:(float)renormVal errorRp:(float)errorRp errorYaw:(float)errorYaw;

//! X gyro drift estimate rad/s
- (float)omegaIx;

//! Y gyro drift estimate rad/s
- (float)omegaIy;

//! Z gyro drift estimate rad/s
- (float)omegaIz;

//! average accel_weight
- (float)accelWeight;

//! average renormalisation value
- (float)renormVal;

//! average error_roll_pitch value
- (float)errorRp;

//! average error_yaw value
- (float)errorYaw;

@end
