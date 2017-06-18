
#import "MVMessage.h"


@interface MVMessagek2compasscali : MVMessage


- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId m_cali_flag:(uint8_t)_cali_flag m_xy_cali_step:(uint8_t)_xy_cali_step m_z_cali_step:(uint8_t) _z_cali_step;


- (uint8_t)cali_flag;

-(uint8_t)xy_cali_step;

-(uint8_t)z_cali_step;


@end
