//
//  MVMessageHilControls.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a HIL_CONTROLS Mavlink message.

 @discussion Sent from autopilot to simulation. Hardware in the loop control outputs
 */
@interface MVMessageHilControls : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec rollAilerons:(float)rollAilerons pitchElevator:(float)pitchElevator yawRudder:(float)yawRudder throttle:(float)throttle aux1:(float)aux1 aux2:(float)aux2 aux3:(float)aux3 aux4:(float)aux4 mode:(uint8_t)mode navMode:(uint8_t)navMode;

//! Timestamp (microseconds since UNIX epoch or microseconds since system boot)
- (uint64_t)timeUsec;

//! Control output -1 .. 1
- (float)rollAilerons;

//! Control output -1 .. 1
- (float)pitchElevator;

//! Control output -1 .. 1
- (float)yawRudder;

//! Throttle 0 .. 1
- (float)throttle;

//! Aux 1, -1 .. 1
- (float)aux1;

//! Aux 2, -1 .. 1
- (float)aux2;

//! Aux 3, -1 .. 1
- (float)aux3;

//! Aux 4, -1 .. 1
- (float)aux4;

//! System mode (MAV_MODE)
- (uint8_t)mode;

//! Navigation mode (MAV_NAV_MODE)
- (uint8_t)navMode;

@end
