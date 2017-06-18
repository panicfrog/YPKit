//
//  MVMessageHeartbeat.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a HEARTBEAT Mavlink message.

 @discussion The heartbeat message shows that a system is present and responding. The type of the MAV and Autopilot hardware allow the receiving system to treat further messages from this system appropriate (e.g. by laying out the user interface based on the autopilot).
 */
@interface MVMessageHeartbeat : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId type:(uint8_t)type autopilot:(uint8_t)autopilot baseMode:(uint8_t)baseMode customMode:(uint32_t)customMode systemStatus:(uint8_t)systemStatus mavlink_version:(uint8_t)mavlink_version;

//! Type of the MAV (quadrotor, helicopter, etc., up to 15 types, defined in MAV_TYPE ENUM)
- (uint8_t)type;

//! Autopilot type / class. defined in MAV_AUTOPILOT ENUM
- (uint8_t)autopilot;

//! System mode bitfield, see MAV_MODE_FLAGS ENUM in mavlink/include/mavlink_types.h
- (uint8_t)baseMode;

//! A bitfield for use for autopilot-specific flags.
- (uint32_t)customMode;

//! System status flag, see MAV_STATE ENUM
- (uint8_t)systemStatus;

//! MAVLink version, not writable by user, gets added by protocol because of magic data type: uint8_t_mavlink_version
- (uint8_t)mavlinkVersion;

@end
