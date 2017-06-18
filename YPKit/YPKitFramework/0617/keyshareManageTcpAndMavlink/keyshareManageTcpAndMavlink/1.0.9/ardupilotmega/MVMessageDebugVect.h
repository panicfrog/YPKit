//
//  MVMessageDebugVect.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a DEBUG_VECT Mavlink message.

 @discussion 
 */
@interface MVMessageDebugVect : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId name:(char *)name timeUsec:(uint64_t)timeUsec x:(float)x y:(float)y z:(float)z;

//! Name
- (NSString *)name;

//! Timestamp
- (uint64_t)timeUsec;

//! x
- (float)x;

//! y
- (float)y;

//! z
- (float)z;

@end
