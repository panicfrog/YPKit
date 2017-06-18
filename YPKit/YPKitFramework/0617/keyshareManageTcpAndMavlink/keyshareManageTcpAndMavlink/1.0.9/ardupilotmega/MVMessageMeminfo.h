//
//  MVMessageMeminfo.h
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a MEMINFO Mavlink message.

 @discussion state of APM memory
 */
@interface MVMessageMeminfo : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId brkval:(uint16_t)brkval freemem:(uint16_t)freemem;

//! heap top
- (uint16_t)brkval;

//! free memory
- (uint16_t)freemem;

@end
