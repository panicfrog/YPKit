//
//  MVMessageCommandAck.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a COMMAND_ACK Mavlink message.

 @discussion Report status of a command. Includes feedback wether the command was executed.
 */
@interface MVMessageCommandAck : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId command:(uint16_t)command result:(uint8_t)result;

//! Command ID, as defined by MAV_CMD enum.
- (uint16_t)command;

//! See MAV_RESULT enum
- (uint8_t)result;

@end
