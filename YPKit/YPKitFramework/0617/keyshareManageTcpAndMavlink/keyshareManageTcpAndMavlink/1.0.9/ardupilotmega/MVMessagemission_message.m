//
//  MVMessageApAdc.m
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessagemission_message.h"

@implementation MVMessagemission_message

- (float)x
{
    return mavlink_mission_message_get_x(&(self->_message));
}


- (float)y
{
   return mavlink_mission_message_get_y(&(self->_message));
}


- (float)z
{
   return mavlink_mission_message_get_z(&(self->_message));
}

- (uint16_t)reserve1
{
   return mavlink_mission_message_get_reserve1(&(self->_message));
}

- (uint16_t)seq
{
   return mavlink_mission_message_get_seq(&(self->_message));
}

@end
