

#import "MVMessagek2compasscali.h"

@implementation MVMessagek2compasscali

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId m_cali_flag:(uint8_t)_cali_flag m_xy_cali_step:(uint8_t)_xy_cali_step m_z_cali_step:(uint8_t) _z_cali_step
{

     if ((self = [super init])) {
            kslink_k2_compass_cali_pack(systemId, componentId, &(self->_message), _cali_flag,_xy_cali_step,_z_cali_step);
        }
    
    return self;
}


-(uint8_t)cali_flag
{
    return mavlink_msg_k2_compass_cali_get_cali_flag(&(self->_message));

}

-(uint8_t)xy_cali_step
{
    return mavlink_msg_k2_compass_cali_get_xy_cali_step(&(self->_message));
}

-(uint8_t)z_cali_step
{
    return mavlink_msg_k2_compass_cali_get_z_cali_step(&(self->_message));
}

@end
