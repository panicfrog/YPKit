//
//  MVMessageHwstatus.h
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a HWSTATUS Mavlink message.

 @discussion Status of key hardware
 */
@interface MVMessageHwstatus : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId Vcc:(uint16_t)Vcc I2Cerr:(uint8_t)I2Cerr;

//! board voltage (mV)
- (uint16_t)Vcc;

//! I2C error count
- (uint8_t)I2Cerr;

@end
