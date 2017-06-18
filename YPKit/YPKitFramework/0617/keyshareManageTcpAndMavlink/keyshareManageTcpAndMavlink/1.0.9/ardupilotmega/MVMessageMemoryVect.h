//
//  MVMessageMemoryVect.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a MEMORY_VECT Mavlink message.

 @discussion Send raw controller memory. The use of this message is discouraged for normal packets, but a quite efficient way for testing new messages and getting experimental debug output.
 */
@interface MVMessageMemoryVect : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId address:(uint16_t)address ver:(uint8_t)ver type:(uint8_t)type value:(int8_t *)value;

//! Starting address of the debug variables
- (uint16_t)address;

//! Version code of the type variable. 0=unknown, type ignored and assumed int16_t. 1=as below
- (uint8_t)ver;

//! Type code of the memory variables. for ver = 1: 0=16 x int16_t, 1=16 x uint16_t, 2=16 x Q15, 3=16 x 1Q14
- (uint8_t)type;

//! Memory contents at specified address
- (uint16_t)value:(int8_t *)value;

@end
