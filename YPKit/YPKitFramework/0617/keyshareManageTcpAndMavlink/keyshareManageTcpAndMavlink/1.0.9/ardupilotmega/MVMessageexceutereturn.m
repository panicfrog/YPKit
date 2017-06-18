//
//  MVMessageApAdc.m
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageexceutereturn.h"

@implementation MVMessageexceutereturn

- (uint16_t)command
{
   return  mavlink_mission_execute_return_command(&(self->_message));
}

- (uint16_t)reserve1
{
    return mavlink_mission_execute_return_reserve1(&(self->_message));
}

- (uint16_t)reserve2
{
    return mavlink_mission_execute_return_reserve2(&(self->_message));
}



@end
