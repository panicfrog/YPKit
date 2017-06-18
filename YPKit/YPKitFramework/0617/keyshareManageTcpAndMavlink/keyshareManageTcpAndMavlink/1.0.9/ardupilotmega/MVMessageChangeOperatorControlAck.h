//
//  MVMessageChangeOperatorControlAck.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a CHANGE_OPERATOR_CONTROL_ACK Mavlink message.

 @discussion Accept / deny control of this MAV
 */
@interface MVMessageChangeOperatorControlAck : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId gcsSystemId:(uint8_t)gcsSystemId controlRequest:(uint8_t)controlRequest ack:(uint8_t)ack;

//! ID of the GCS this message 
- (uint8_t)gcsSystemId;

//! 0: request control of this MAV, 1: Release control of this MAV
- (uint8_t)controlRequest;

//! 0: ACK, 1: NACK: Wrong passkey, 2: NACK: Unsupported passkey encryption method, 3: NACK: Already under control
- (uint8_t)ack;

@end
