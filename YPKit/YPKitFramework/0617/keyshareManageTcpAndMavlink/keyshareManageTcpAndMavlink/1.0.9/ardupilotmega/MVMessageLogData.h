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
@interface MVMessageLogData: MVMessage



- (uint32_t)ofs;


- (uint16_t)id;


- (uint8_t)count;


- (void) data:(uint8_t *)data ;




@end
