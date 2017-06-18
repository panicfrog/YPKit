//
//  MVMessageSetMode.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a SET_MODE Mavlink message.

 @discussion Set the system mode, as defined by enum MAV_MODE. There is no target component id as the mode is by definition for the overall aircraft, not only for one component.
 */
@interface MVMessageSetMode : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem baseMode:(uint8_t)baseMode customMode:(uint32_t)customMode;

//! The system setting the mode
- (uint8_t)targetSystem;

//! The new base mode
- (uint8_t)baseMode;

//! The new autopilot-specific mode. This field can be ignored by an autopilot.
- (uint32_t)customMode;

@end
