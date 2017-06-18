//
//  MVMessageMountControl.h
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a MOUNT_CONTROL Mavlink message.

 @discussion Message to control a camera mount, directional antenna, etc.
 */
@interface MVMessageMountControl : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent inputA:(int32_t)inputA inputB:(int32_t)inputB inputC:(int32_t)inputC savePosition:(uint8_t)savePosition;

//! System ID
- (uint8_t)targetSystem;

//! Component ID
- (uint8_t)targetComponent;

//! pitch(deg*100) or lat, depending on mount mode
- (int32_t)inputA;

//! roll(deg*100) or lon depending on mount mode
- (int32_t)inputB;

//! yaw(deg*100) or alt (in cm) depending on mount mode
- (int32_t)inputC;

//! if "1" it will save current trimmed position on EEPROM (just valid for NEUTRAL and LANDING)
- (uint8_t)savePosition;

@end
