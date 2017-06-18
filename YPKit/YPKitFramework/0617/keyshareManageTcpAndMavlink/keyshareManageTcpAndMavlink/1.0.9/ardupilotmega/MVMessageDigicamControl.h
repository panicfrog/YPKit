//
//  MVMessageDigicamControl.h
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a DIGICAM_CONTROL Mavlink message.

 @discussion Control on-board Camera Control System to take shots.
 */
@interface MVMessageDigicamControl : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent session:(uint8_t)session zoomPos:(uint8_t)zoomPos zoomStep:(int8_t)zoomStep focusLock:(uint8_t)focusLock shot:(uint8_t)shot commandId:(uint8_t)commandId extraParam:(uint8_t)extraParam extraValue:(float)extraValue;

//! System ID
- (uint8_t)targetSystem;

//! Component ID
- (uint8_t)targetComponent;

//! 0: stop, 1: start or keep it up //Session control e.g. show/hide lens
- (uint8_t)session;

//! 1 to N //Zoom's absolute position (0 means ignore)
- (uint8_t)zoomPos;

//! -100 to 100 //Zooming step value to offset zoom from the current position
- (int8_t)zoomStep;

//! 0: unlock focus or keep unlocked, 1: lock focus or keep locked, 3: re-lock focus
- (uint8_t)focusLock;

//! 0: ignore, 1: shot or start filming
- (uint8_t)shot;

//! Command Identity (incremental loop: 0 to 255)//A command sent multiple times will be executed or pooled just once
- (uint8_t)commandId;

//! Extra parameters enumeration (0 means ignore)
- (uint8_t)extraParam;

//! Correspondent value to given extra_param
- (float)extraValue;

@end
