//
//  MVMessageSystemTime.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a SYSTEM_TIME Mavlink message.

 @discussion The system time is the time of the master clock, typically the computer clock of the main onboard computer.
 */
@interface MVMessageSystemTime : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUnixUsec:(uint64_t)timeUnixUsec timeBootMs:(uint32_t)timeBootMs;

//! Timestamp of the master clock in microseconds since UNIX epoch.
- (uint64_t)timeUnixUsec;

//! Timestamp of the component clock since boot time in milliseconds.
- (uint32_t)timeBootMs;

@end
