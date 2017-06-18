//
//  MVMessageApAdc.m
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageLogRequestData.h"

@implementation MVMessageLogRequestData


- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId _target_system:(uint8_t)target_system _target_component:(uint8_t)target_component _ofs:(uint32_t)ofs _count:(uint32_t)count _id:(uint16_t) id{
    
    if ((self = [super init])) {
        mavlink_msg_log_request_data_pack( systemId,  componentId, &(self->_message),
                                          target_system,  target_component,  id,  ofs,  count);
    }
    return self;
}

@end
