//
//  MVMessageAuthKey.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a AUTH_KEY Mavlink message.

 @discussion Emit an encrypted signature / key identifying this system. PLEASE NOTE: This protocol has been kept simple, so transmitting the key requires an encrypted channel for true safety.
 */
@interface MVMessageAuthKey : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId key:(char *)key;

//! key
- (NSString *)key;

@end
