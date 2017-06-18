//
//  MVMessageNavControllerOutput.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a NAV_CONTROLLER_OUTPUT Mavlink message.

 @discussion Outputs of the APM navigation controller. The primary use of this message is to check the response and signs of the controller before actual flight and to assist with tuning controller parameters.
 */
@interface MVMessageNavControllerOutput : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId navRoll:(float)navRoll navPitch:(float)navPitch navBearing:(int16_t)navBearing targetBearing:(int16_t)targetBearing wpDist:(uint16_t)wpDist altError:(float)altError aspdError:(float)aspdError xtrackError:(float)xtrackError;

//! Current desired roll in degrees
- (float)navRoll;

//! Current desired pitch in degrees
- (float)navPitch;

//! Current desired heading in degrees
- (int16_t)navBearing;

//! Bearing to current MISSION/target in degrees
- (int16_t)targetBearing;

//! Distance to active MISSION in meters
- (uint16_t)wpDist;

//! Current altitude error in meters
- (float)altError;

//! Current airspeed error in meters/second
- (float)aspdError;

//! Current crosstrack error on x-y plane in meters
- (float)xtrackError;

@end
