//
//  MVMessageCommandLong.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a COMMAND_LONG Mavlink message.

 @discussion Send a command with up to four parameters to the MAV
 */
@interface MVMessageCommandLong : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent command:(uint16_t)command confirmation:(uint8_t)confirmation param1:(float)param1 param2:(float)param2 param3:(float)param3 param4:(float)param4 param5:(float)param5 param6:(float)param6 param7:(float)param7;

//! System which should execute the command
- (uint8_t)targetSystem;

//! Component which should execute the command, 0 for all components
- (uint8_t)targetComponent;

//! Command ID, as defined by MAV_CMD enum.
- (uint16_t)command;

//! 0: First transmission of this command. 1-255: Confirmation transmissions (e.g. for kill command)
- (uint8_t)confirmation;

//! Parameter 1, as defined by MAV_CMD enum.
- (float)param1;

//! Parameter 2, as defined by MAV_CMD enum.
- (float)param2;

//! Parameter 3, as defined by MAV_CMD enum.
- (float)param3;

//! Parameter 4, as defined by MAV_CMD enum.
- (float)param4;

//! Parameter 5, as defined by MAV_CMD enum.
- (float)param5;

//! Parameter 6, as defined by MAV_CMD enum.
- (float)param6;

//! Parameter 7, as defined by MAV_CMD enum.
- (float)param7;

@end
