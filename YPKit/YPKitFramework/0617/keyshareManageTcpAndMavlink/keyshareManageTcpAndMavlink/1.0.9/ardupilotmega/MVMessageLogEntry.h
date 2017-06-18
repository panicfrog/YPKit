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
 */
@interface MVMessageLogEntry: MVMessage

//! ADC output 1
- (uint32_t)time_utc;

//! ADC output 2
- (uint32_t)size;

//! ADC output 3
- (uint16_t)id;

//! ADC output 4
- (uint16_t)num_logs;

//! ADC output 5
- (uint16_t)last_log_num;



@end
