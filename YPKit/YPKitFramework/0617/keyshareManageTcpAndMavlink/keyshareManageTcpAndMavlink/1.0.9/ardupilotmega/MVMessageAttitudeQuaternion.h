//
//  MVMessageAttitudeQuaternion.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a ATTITUDE_QUATERNION Mavlink message.

 @discussion The attitude in the aeronautical frame (right-handed, Z-down, X-front, Y-right), expressed as quaternion.
 */
@interface MVMessageAttitudeQuaternion : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeBootMs:(uint32_t)timeBootMs q1:(float)q1 q2:(float)q2 q3:(float)q3 q4:(float)q4 rollspeed:(float)rollspeed pitchspeed:(float)pitchspeed yawspeed:(float)yawspeed;

//! Timestamp (milliseconds since system boot)
- (uint32_t)timeBootMs;

//! Quaternion component 1
- (float)q1;

//! Quaternion component 2
- (float)q2;

//! Quaternion component 3
- (float)q3;

//! Quaternion component 4
- (float)q4;

//! Roll angular speed (rad/s)
- (float)rollspeed;

//! Pitch angular speed (rad/s)
- (float)pitchspeed;

//! Yaw angular speed (rad/s)
- (float)yawspeed;

@end
