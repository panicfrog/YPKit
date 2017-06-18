//
//  MVMessageNamedValueInt.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a NAMED_VALUE_INT Mavlink message.

 @discussion Send a key-value pair as integer. The use of this message is discouraged for normal packets, but a quite efficient way for testing new messages and getting experimental debug output.
 */
@interface MVMessageNamedValueInt : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeBootMs:(uint32_t)timeBootMs name:(char *)name value:(int32_t)value;

//! Timestamp (milliseconds since system boot)
- (uint32_t)timeBootMs;

//! Name of the debug variable
- (NSString *)name;

//! Signed integer value
- (int32_t)value;

@end
