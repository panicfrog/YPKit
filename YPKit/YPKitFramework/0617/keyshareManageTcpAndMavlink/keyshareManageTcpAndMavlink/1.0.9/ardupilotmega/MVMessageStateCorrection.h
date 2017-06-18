//
//  MVMessageStateCorrection.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a STATE_CORRECTION Mavlink message.

 @discussion Corrects the systems state by adding an error correction term to the position and velocity, and by rotating the attitude by a correction angle.
 */
@interface MVMessageStateCorrection : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId xErr:(float)xErr yErr:(float)yErr zErr:(float)zErr rollErr:(float)rollErr pitchErr:(float)pitchErr yawErr:(float)yawErr vxErr:(float)vxErr vyErr:(float)vyErr vzErr:(float)vzErr;

//! x position error
- (float)xErr;

//! y position error
- (float)yErr;

//! z position error
- (float)zErr;

//! roll error (radians)
- (float)rollErr;

//! pitch error (radians)
- (float)pitchErr;

//! yaw error (radians)
- (float)yawErr;

//! x velocity
- (float)vxErr;

//! y velocity
- (float)vyErr;

//! z velocity
- (float)vzErr;

@end
