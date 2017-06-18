//
//  MVMessageFenceStatus.h
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a FENCE_STATUS Mavlink message.

 @discussion Status of geo-fencing. Sent in extended
	    status stream when fencing enabled
 */
@interface MVMessageFenceStatus : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId breachStatus:(uint8_t)breachStatus breachCount:(uint16_t)breachCount breachType:(uint8_t)breachType breachTime:(uint32_t)breachTime;

//! 0 if currently inside fence, 1 if outside
- (uint8_t)breachStatus;

//! number of fence breaches
- (uint16_t)breachCount;

//! last breach type (see FENCE_BREACH_* enum)
- (uint8_t)breachType;

//! time of last breach in milliseconds since boot
- (uint32_t)breachTime;

@end
