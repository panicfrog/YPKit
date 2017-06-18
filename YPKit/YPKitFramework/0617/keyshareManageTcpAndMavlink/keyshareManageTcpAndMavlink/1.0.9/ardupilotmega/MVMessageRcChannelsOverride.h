//
//  MVMessageRcChannelsOverride.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a RC_CHANNELS_OVERRIDE Mavlink message.

 @discussion The RAW values of the RC channels sent to the MAV to override info received from the RC radio. A value of -1 means no change to that channel. A value of 0 means control of that channel should be released back to the RC radio. The standard PPM modulation is as follows: 1000 microseconds: 0%, 2000 microseconds: 100%. Individual receivers/transmitters might violate this specification.
 */
@interface MVMessageRcChannelsOverride : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent chan1Raw:(uint16_t)chan1Raw chan2Raw:(uint16_t)chan2Raw chan3Raw:(uint16_t)chan3Raw chan4Raw:(uint16_t)chan4Raw chan5Raw:(uint16_t)chan5Raw chan6Raw:(uint16_t)chan6Raw chan7Raw:(uint16_t)chan7Raw chan8Raw:(uint16_t)chan8Raw;

//! System ID
- (uint8_t)targetSystem;

//! Component ID
- (uint8_t)targetComponent;

//! RC channel 1 value, in microseconds
- (uint16_t)chan1Raw;

//! RC channel 2 value, in microseconds
- (uint16_t)chan2Raw;

//! RC channel 3 value, in microseconds
- (uint16_t)chan3Raw;

//! RC channel 4 value, in microseconds
- (uint16_t)chan4Raw;

//! RC channel 5 value, in microseconds
- (uint16_t)chan5Raw;

//! RC channel 6 value, in microseconds
- (uint16_t)chan6Raw;

//! RC channel 7 value, in microseconds
- (uint16_t)chan7Raw;

//! RC channel 8 value, in microseconds
- (uint16_t)chan8Raw;

@end
