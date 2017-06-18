//
//  MVMessageMountConfigure.h
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a MOUNT_CONFIGURE Mavlink message.

 @discussion Message to configure a camera mount, directional antenna, etc.
 */
@interface MVMessageMountConfigure : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent mountMode:(uint8_t)mountMode stabRoll:(uint8_t)stabRoll stabPitch:(uint8_t)stabPitch stabYaw:(uint8_t)stabYaw;

//! System ID
- (uint8_t)targetSystem;

//! Component ID
- (uint8_t)targetComponent;

//! mount operating mode (see MAV_MOUNT_MODE enum)
- (uint8_t)mountMode;

//! (1 = yes, 0 = no)
- (uint8_t)stabRoll;

//! (1 = yes, 0 = no)
- (uint8_t)stabPitch;

//! (1 = yes, 0 = no)
- (uint8_t)stabYaw;

@end
