//
//  MVMessageManualControl.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a MANUAL_CONTROL Mavlink message.

 @discussion 
 */
@interface MVMessageManualControl : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId target:(uint8_t)target roll:(float)roll pitch:(float)pitch yaw:(float)yaw thrust:(float)thrust rollManual:(uint8_t)rollManual pitchManual:(uint8_t)pitchManual yawManual:(uint8_t)yawManual thrustManual:(uint8_t)thrustManual;

//! The system to be controlled
- (uint8_t)target;

//! roll
- (float)roll;

//! pitch
- (float)pitch;

//! yaw
- (float)yaw;

//! thrust
- (float)thrust;

//! roll control enabled auto:0, manual:1
- (uint8_t)rollManual;

//! pitch auto:0, manual:1
- (uint8_t)pitchManual;

//! yaw auto:0, manual:1
- (uint8_t)yawManual;

//! thrust auto:0, manual:1
- (uint8_t)thrustManual;

@end
