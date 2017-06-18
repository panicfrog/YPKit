//
//  MVMessageSetQuadSwarmRollPitchYawThrust.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a SET_QUAD_SWARM_ROLL_PITCH_YAW_THRUST Mavlink message.

 @discussion Setpoint for up to four quadrotors in a group / wing
 */
@interface MVMessageSetQuadSwarmRollPitchYawThrust : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId group:(uint8_t)group mode:(uint8_t)mode ledRed:(uint8_t *)ledRed ledBlue:(uint8_t *)ledBlue ledGreen:(uint8_t *)ledGreen roll:(int16_t *)roll pitch:(int16_t *)pitch yaw:(int16_t *)yaw thrust:(uint16_t *)thrust;

//! ID of the quadrotor group (0 - 255, up to 256 groups supported)
- (uint8_t)group;

//! ID of the flight mode (0 - 255, up to 256 modes supported)
- (uint8_t)mode;

//! RGB red channel (0-255)
- (uint16_t)ledRed:(uint8_t *)led_red;

//! RGB green channel (0-255)
- (uint16_t)ledBlue:(uint8_t *)led_blue;

//! RGB blue channel (0-255)
- (uint16_t)ledGreen:(uint8_t *)led_green;

//! Desired roll angle in radians +-PI (+-32767)
- (uint16_t)roll:(int16_t *)roll;

//! Desired pitch angle in radians +-PI (+-32767)
- (uint16_t)pitch:(int16_t *)pitch;

//! Desired yaw angle in radians, scaled to int16 +-PI (+-32767)
- (uint16_t)yaw:(int16_t *)yaw;

//! Collective thrust, scaled to uint16 (0..65535)
- (uint16_t)thrust:(uint16_t *)thrust;

@end
