//
//  MVMessageApAdc.h
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a AP_ADC Mavlink message.

 @discussion raw ADC output
 
 typedef struct __mavlink_log_request_list_t
 {
 uint16_t start; ///< First log id (0 for first available)
 uint16_t end; ///< Last log id (0xffff for last available)
 uint8_t target_system; ///< System ID
 uint8_t target_component; ///< Component ID
 } mavlink_log_request_list_t;
 */
@interface MVMessageLogRequestList: MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId _start:(uint16_t)start _end:(uint16_t)end _target_system:(uint8_t)target_system _target_component:(uint8_t)target_component;



@end
