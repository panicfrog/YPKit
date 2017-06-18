//
//  MVMessageHilState.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a HIL_STATE Mavlink message.

 @discussion Sent from simulation to autopilot. This packet is useful for high throughput applications such as hardware in the loop simulations.
 */
@interface MVMessageHilState : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec roll:(float)roll pitch:(float)pitch yaw:(float)yaw rollspeed:(float)rollspeed pitchspeed:(float)pitchspeed yawspeed:(float)yawspeed lat:(int32_t)lat lon:(int32_t)lon alt:(int32_t)alt vx:(int16_t)vx vy:(int16_t)vy vz:(int16_t)vz xacc:(int16_t)xacc yacc:(int16_t)yacc zacc:(int16_t)zacc;

//! Timestamp (microseconds since UNIX epoch or microseconds since system boot)
- (uint64_t)timeUsec;

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

//! Latitude, expressed as * 1E7
- (int32_t)lat;

//! Longitude, expressed as * 1E7
- (int32_t)lon;

//! Altitude in meters, expressed as * 1000 (millimeters)
- (int32_t)alt;

//! Ground X Speed (Latitude), expressed as m/s * 100
- (int16_t)vx;

//! Ground Y Speed (Longitude), expressed as m/s * 100
- (int16_t)vy;

//! Ground Z Speed (Altitude), expressed as m/s * 100
- (int16_t)vz;

//! X acceleration (mg)
- (int16_t)xacc;

//! Y acceleration (mg)
- (int16_t)yacc;

//! Z acceleration (mg)
- (int16_t)zacc;

@end
