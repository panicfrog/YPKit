//
//  MVMessageStatustext.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a STATUSTEXT Mavlink message.

 @discussion Status text message. These messages are printed in yellow in the COMM console of QGroundControl. WARNING: They consume quite some bandwidth, so use only for important status and error messages. If implemented wisely, these messages are buffered on the MCU and sent only at a limited rate (e.g. 10 Hz).
 */
@interface MVMessageStatustext : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId severity:(uint8_t)severity text:(char *)text;

//! Severity of status. Relies on the definitions within RFC-5424. See enum MAV_SEVERITY.
- (uint8_t)severity;

//! Status text message, without null termination character
- (NSString *)text;

@end
