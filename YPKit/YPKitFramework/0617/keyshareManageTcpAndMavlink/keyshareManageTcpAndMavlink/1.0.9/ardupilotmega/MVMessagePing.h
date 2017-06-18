//
//  MVMessagePing.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a PING Mavlink message.

 @discussion A ping message either requesting or responding to a ping. This allows to measure the system latencies, including serial port, radio modem and UDP connections.
 */
@interface MVMessagePing : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec seq:(uint32_t)seq targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent;

//! Unix timestamp in microseconds
- (uint64_t)timeUsec;

//! PING sequence
- (uint32_t)seq;

//! 0: request ping from all receiving systems, if greater than 0: message is a ping response and number is the system id of the requesting system
- (uint8_t)targetSystem;

//! 0: request ping from all receiving components, if greater than 0: message is a ping response and number is the system id of the requesting system
- (uint8_t)targetComponent;

@end
