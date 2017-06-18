//
//  MVMessageApAdc.m
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageLogRequestList.h"

@implementation MVMessageLogRequestList




- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId _start:(uint16_t)start _end:(uint16_t)end _target_system:(uint8_t)target_system _target_component:(uint8_t)target_component{
    
    if ((self = [super init])) {
        mavlink_msg_log_request_list_pack(systemId, componentId, &(self->_message), start, end, target_system, target_component);
    }
    return self;
}


@end
