//
//  MVMessageMissionWritePartialList.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a MISSION_WRITE_PARTIAL_LIST Mavlink message.

 @discussion This message is sent to the MAV to write a partial list. If start index == end index, only one item will be transmitted / updated. If the start index is NOT 0 and above the current list size, this request should be REJECTED!
 */
@interface MVMessageMissionWritePartialList : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent startIndex:(int16_t)startIndex endIndex:(int16_t)endIndex;

//! System ID
- (uint8_t)targetSystem;

//! Component ID
- (uint8_t)targetComponent;

//! Start index, 0 by default and smaller / equal to the largest index of the current onboard list.
- (int16_t)startIndex;

//! End index, equal or greater than start index.
- (int16_t)endIndex;

@end
