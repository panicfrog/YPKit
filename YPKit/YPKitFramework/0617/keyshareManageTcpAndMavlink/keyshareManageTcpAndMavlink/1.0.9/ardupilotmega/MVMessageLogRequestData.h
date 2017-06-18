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


 
 uint32_t time_utc; ///< UTC timestamp of log in seconds since 1970, or 0 if not available
 uint32_t size; ///< Size of the log (may be approximate) in bytes
 uint16_t id; ///< Log id
 uint16_t num_logs; ///< Total number of logs
 uint16_t last_log_num; ///< High log number
 
typedef struct __mavlink_log_request_data_t
{
    uint32_t ofs; ///< Offset into the log
    uint32_t count; ///< Number of bytes
    uint16_t id; ///< Log id (from LOG_ENTRY reply)
    uint8_t target_system; ///< System ID
    uint8_t target_component; ///< Component ID
} mavlink_log_request_data_t;
*/

@interface MVMessageLogRequestData: MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId _target_system:(uint8_t)target_system _target_component:(uint8_t)target_component _ofs:(uint32_t)ofs _count:(uint32_t)count _id:(uint16_t) id;

@end
