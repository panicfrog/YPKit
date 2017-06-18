//
//  MVMessageAttitude.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a ATTITUDE Mavlink message.

 @discussion The attitude in the aeronautical frame (right-handed, Z-down, X-front, Y-right).
 */
@interface MVMessageAttitude : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeBootMs:(uint32_t)timeBootMs roll:(float)roll pitch:(float)pitch yaw:(float)yaw rollspeed:(float)rollspeed pitchspeed:(float)pitchspeed yawspeed:(float)yawspeed;

//! Timestamp (milliseconds since system boot)
- (uint32_t)timeBootMs;

//! Roll angle (rad)
- (float)roll;

//! Pitch angle (rad)
- (float)pitch;

//! Yaw angle (rad)
- (float)yaw;

//! Roll angular speed (rad/s)
- (float)rollspeed;

//! Pitch angular speed (rad/s)
- (float)pitchspeed;

//! Yaw angular speed (rad/s)
- (float)yawspeed;

@end
