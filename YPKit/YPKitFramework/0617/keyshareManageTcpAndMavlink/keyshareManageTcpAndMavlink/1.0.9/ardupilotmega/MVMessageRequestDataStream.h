//
//  MVMessageRequestDataStream.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a REQUEST_DATA_STREAM Mavlink message.

 @discussion 
 */
@interface MVMessageRequestDataStream : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent reqStreamId:(uint8_t)reqStreamId reqMessageRate:(uint16_t)reqMessageRate startStop:(uint8_t)startStop;

//! The target requested to send the message stream.
- (uint8_t)targetSystem;

//! The target requested to send the message stream.
- (uint8_t)targetComponent;

//! The ID of the requested data stream
- (uint8_t)reqStreamId;

//! The requested interval between two messages of this type
- (uint16_t)reqMessageRate;

//! 1 to start sending, 0 to stop sending.
- (uint8_t)startStop;

@end
