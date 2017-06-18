//
//  MVMessageSetMagOffsets.h
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a SET_MAG_OFFSETS Mavlink message.

 @discussion set the magnetometer offsets
 */
@interface MVMessageSetMagOffsets : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent magOfsX:(int16_t)magOfsX magOfsY:(int16_t)magOfsY magOfsZ:(int16_t)magOfsZ;

//! System ID
- (uint8_t)targetSystem;

//! Component ID
- (uint8_t)targetComponent;

//! magnetometer X offset
- (int16_t)magOfsX;

//! magnetometer Y offset
- (int16_t)magOfsY;

//! magnetometer Z offset
- (int16_t)magOfsZ;

@end
