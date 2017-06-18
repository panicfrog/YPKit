//
//  MVMessageApAdc.m
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageexceute.h"

@implementation MVMessageexceute

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId m_command:(uint16_t)_command m_reserve1:(uint16_t)_reserve1 m_reserve2:(uint16_t)_reserve2
{
    
    if ((self = [super init])) {
        mavlink_execute_pack(systemId, componentId, &(self->_message), _command,_reserve1,_reserve2);
    }
    
    return self;
}

@end
