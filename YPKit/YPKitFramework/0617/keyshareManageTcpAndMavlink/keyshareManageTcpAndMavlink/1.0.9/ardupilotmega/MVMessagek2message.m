

#import "MVMessagek2message.h"

@implementation MVMessagek2message

-(int32_t)latitude
{
    return mavlink_msg_k2_message_get_latitude(&(self->_message));

}

-(int32_t)longitude
{
    return mavlink_msg_k2_message_get_longitude(&(self->_message));
}

-(float)ground_speed
{
    return mavlink_msg_k2_message_get_ground_speed(&(self->_message));

}

-(uint16_t)battery_voltage
{
     return mavlink_msg_k2_message_get_battery_voltage(&(self->_message));
}

-(uint8_t)arm_status
{
    return mavlink_msg_k2_message_arm_status(&(self->_message));
}

- (float)alt
{
    return mavlink_msg_k2_message_get_alt(&(self->_message));
}

-(uint16_t)batt
{
     return mavlink_msg_k2_message_get_battery_voltage(&(self->_message));
}

-(uint8_t)num_stat
{
    return mavlink_msg_k2_message_get_num_stat(&(self->_message));
}



@end
