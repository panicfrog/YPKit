

#import "MVMessagek2messageack.h"

@implementation MVMessagek2messageack



-(uint8_t)ack_type
{
    return mavlink_msg_k2_message_get_ack_type(&(self->_message));

}

-(uint8_t)ack_value
{
    return mavlink_msg_k2_message_get_ack_value(&(self->_message));
}



@end
