//
//  MVMessageDataStream.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a DATA_STREAM Mavlink message.

 @discussion 
 */
@interface MVMessageDataStream : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId streamId:(uint8_t)streamId messageRate:(uint16_t)messageRate onOff:(uint8_t)onOff;

//! The ID of the requested data stream
- (uint8_t)streamId;

//! The requested interval between two messages of this type
- (uint16_t)messageRate;

//! 1 stream is enabled, 0 stream is stopped.
- (uint8_t)onOff;

@end
