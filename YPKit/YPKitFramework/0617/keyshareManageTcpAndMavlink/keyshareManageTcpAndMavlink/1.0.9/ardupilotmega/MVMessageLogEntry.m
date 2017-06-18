//
//  MVMessageApAdc.m
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageLogEntry.h"

@implementation MVMessageLogEntry



- (uint32_t)time_utc{
         return mavlink_msg_log_entry_get_time_utc(&(self->_message));
}
//! ADC output 2
- (uint32_t)size{
        return mavlink_msg_log_entry_get_size(&(self->_message));
}

//! ADC output 3
- (uint16_t)id{
    
    return mavlink_msg_log_entry_get_id(&(self->_message));
}

//! ADC output 4
- (uint16_t)num_logs{
        return mavlink_msg_log_entry_get_num_logs(&(self->_message));
}

//! ADC output 5
- (uint16_t)last_log_num{
        return mavlink_msg_log_entry_get_last_log_num(&(self->_message));
}


@end
