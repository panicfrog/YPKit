//
//  MVMessageMissionItemReached.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a MISSION_ITEM_REACHED Mavlink message.

 @discussion A certain mission item has been reached. The system will either hold this position (or circle on the orbit) or (if the autocontinue on the WP was set) continue to the next MISSION.
 */
@interface MVMessageMissionItemReached : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId seq:(uint16_t)seq;

//! Sequence
- (uint16_t)seq;

@end
