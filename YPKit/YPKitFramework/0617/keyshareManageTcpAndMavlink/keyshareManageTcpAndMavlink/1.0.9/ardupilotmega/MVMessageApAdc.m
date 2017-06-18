//
//  MVMessageApAdc.m
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageApAdc.h"

@implementation MVMessageApAdc

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId adc1:(uint16_t)adc1 adc2:(uint16_t)adc2 adc3:(uint16_t)adc3 adc4:(uint16_t)adc4 adc5:(uint16_t)adc5 adc6:(uint16_t)adc6 {
  if ((self = [super init])) {
    mavlink_msg_ap_adc_pack(systemId, componentId, &(self->_message), adc1, adc2, adc3, adc4, adc5, adc6);
  }
  return self;
}

- (uint16_t)adc1 {
  return mavlink_msg_ap_adc_get_adc1(&(self->_message));
}

- (uint16_t)adc2 {
  return mavlink_msg_ap_adc_get_adc2(&(self->_message));
}

- (uint16_t)adc3 {
  return mavlink_msg_ap_adc_get_adc3(&(self->_message));
}

- (uint16_t)adc4 {
  return mavlink_msg_ap_adc_get_adc4(&(self->_message));
}

- (uint16_t)adc5 {
  return mavlink_msg_ap_adc_get_adc5(&(self->_message));
}

- (uint16_t)adc6 {
  return mavlink_msg_ap_adc_get_adc6(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, adc1=%d, adc2=%d, adc3=%d, adc4=%d, adc5=%d, adc6=%d", [super description], [self adc1], [self adc2], [self adc3], [self adc4], [self adc5], [self adc6]];
}

@end
