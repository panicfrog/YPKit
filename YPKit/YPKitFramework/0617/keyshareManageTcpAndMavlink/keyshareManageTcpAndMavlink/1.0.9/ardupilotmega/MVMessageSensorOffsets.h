//
//  MVMessageSensorOffsets.h
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a SENSOR_OFFSETS Mavlink message.

 @discussion Offsets and calibrations values for hardware
        sensors. This makes it easier to debug the calibration process.
 */
@interface MVMessageSensorOffsets : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId magOfsX:(int16_t)magOfsX magOfsY:(int16_t)magOfsY magOfsZ:(int16_t)magOfsZ magDeclination:(float)magDeclination rawPress:(int32_t)rawPress rawTemp:(int32_t)rawTemp gyroCalX:(float)gyroCalX gyroCalY:(float)gyroCalY gyroCalZ:(float)gyroCalZ accelCalX:(float)accelCalX accelCalY:(float)accelCalY accelCalZ:(float)accelCalZ;

//! magnetometer X offset
- (int16_t)magOfsX;

//! magnetometer Y offset
- (int16_t)magOfsY;

//! magnetometer Z offset
- (int16_t)magOfsZ;

//! magnetic declination (radians)
- (float)magDeclination;

//! raw pressure from barometer
- (int32_t)rawPress;

//! raw temperature from barometer
- (int32_t)rawTemp;

//! gyro X calibration
- (float)gyroCalX;

//! gyro Y calibration
- (float)gyroCalY;

//! gyro Z calibration
- (float)gyroCalZ;

//! accel X calibration
- (float)accelCalX;

//! accel Y calibration
- (float)accelCalY;

//! accel Z calibration
- (float)accelCalZ;

@end
