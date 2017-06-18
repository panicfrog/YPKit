//
//  MVMessageApAdc.m
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageLogData.h"

@implementation MVMessageLogData


- (uint32_t)ofs{
      return mavlink_msg_log_data_get_ofs(&(self->_message));
}


- (uint16_t)id{
    return mavlink_msg_log_data_get_id(&(self->_message));
}


- (uint8_t)count{
    return mavlink_msg_log_data_get_count(&(self->_message));
}


- (void)data:(uint8_t *)data{
    mavlink_msg_log_data_get_data(&(self->_message), (uint8_t *)data);
}


@end
