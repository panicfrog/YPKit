//
//  MVMessageDebug.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a DEBUG Mavlink message.

 @discussion Send a debug value. The index is used to discriminate between values. These values show up in the plot of QGroundControl as DEBUG N.
 */
@interface MVMessageDebug : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeBootMs:(uint32_t)timeBootMs ind:(uint8_t)ind value:(float)value;

//! Timestamp (milliseconds since system boot)
- (uint32_t)timeBootMs;

//! index of debug variable
- (uint8_t)ind;

//! DEBUG value
- (float)value;

@end
