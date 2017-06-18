//
//  MVMessageDigicamConfigure.h
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a DIGICAM_CONFIGURE Mavlink message.

 @discussion Configure on-board Camera Control System.
 */
@interface MVMessageDigicamConfigure : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent mode:(uint8_t)mode shutterSpeed:(uint16_t)shutterSpeed aperture:(uint8_t)aperture iso:(uint8_t)iso exposureType:(uint8_t)exposureType commandId:(uint8_t)commandId engineCutOff:(uint8_t)engineCutOff extraParam:(uint8_t)extraParam extraValue:(float)extraValue;

//! System ID
- (uint8_t)targetSystem;

//! Component ID
- (uint8_t)targetComponent;

//! Mode enumeration from 1 to N //P, TV, AV, M, Etc (0 means ignore)
- (uint8_t)mode;

//! Divisor number //e.g. 1000 means 1/1000 (0 means ignore)
- (uint16_t)shutterSpeed;

//! F stop number x 10 //e.g. 28 means 2.8 (0 means ignore)
- (uint8_t)aperture;

//! ISO enumeration from 1 to N //e.g. 80, 100, 200, Etc (0 means ignore)
- (uint8_t)iso;

//! Exposure type enumeration from 1 to N (0 means ignore)
- (uint8_t)exposureType;

//! Command Identity (incremental loop: 0 to 255)//A command sent multiple times will be executed or pooled just once
- (uint8_t)commandId;

//! Main engine cut-off time before camera trigger in seconds/10 (0 means no cut-off)
- (uint8_t)engineCutOff;

//! Extra parameters enumeration (0 means ignore)
- (uint8_t)extraParam;

//! Correspondent value to given extra_param
- (float)extraValue;

@end
