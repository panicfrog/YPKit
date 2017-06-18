//
//  MVMessageMountStatus.h
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a MOUNT_STATUS Mavlink message.

 @discussion Message with some status from APM to GCS about camera or antenna mount
 */
@interface MVMessageMountStatus : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent pointingA:(int32_t)pointingA pointingB:(int32_t)pointingB pointingC:(int32_t)pointingC;

//! System ID
- (uint8_t)targetSystem;

//! Component ID
- (uint8_t)targetComponent;

//! pitch(deg*100) or lat, depending on mount mode
- (int32_t)pointingA;

//! roll(deg*100) or lon depending on mount mode
- (int32_t)pointingB;

//! yaw(deg*100) or alt (in cm) depending on mount mode
- (int32_t)pointingC;

@end
