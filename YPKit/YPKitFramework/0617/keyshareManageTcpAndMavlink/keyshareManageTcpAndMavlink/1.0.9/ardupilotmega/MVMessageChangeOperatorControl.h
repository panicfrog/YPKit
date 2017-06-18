//
//  MVMessageChangeOperatorControl.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a CHANGE_OPERATOR_CONTROL Mavlink message.

 @discussion Request to control this MAV
 */
@interface MVMessageChangeOperatorControl : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem controlRequest:(uint8_t)controlRequest version:(uint8_t)version passkey:(char *)passkey;

//! System the GCS requests control for
- (uint8_t)targetSystem;

//! 0: request control of this MAV, 1: Release control of this MAV
- (uint8_t)controlRequest;

//! 0: key as plaintext, 1-255: future, different hashing/encryption variants. The GCS should in general use the safest mode possible initially and then gradually move down the encryption level if it gets a NACK message indicating an encryption mismatch.
- (uint8_t)version;

//! Password / Key, depending on version plaintext or encrypted. 25 or less characters, NULL terminated. The characters may involve A-Z, a-z, 0-9, and "!?,.-"
- (NSString *)passkey;

@end
