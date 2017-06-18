//
//  MVMessageMissionCurrent.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a MISSION_CURRENT Mavlink message.

 @discussion Message that announces the sequence number of the current active mission item. The MAV will fly towards this mission item.
 */
@interface MVMessageMissionCurrent : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId seq:(uint16_t)seq;

//! Sequence
- (uint16_t)seq;

@end
