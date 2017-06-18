//
//  MVMessageHwstatus.m
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageHwstatus.h"

@implementation MVMessageHwstatus

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId Vcc:(uint16_t)Vcc I2Cerr:(uint8_t)I2Cerr {
  if ((self = [super init])) {
    mavlink_msg_hwstatus_pack(systemId, componentId, &(self->_message), Vcc, I2Cerr);
  }
  return self;
}

- (uint16_t)Vcc {
  return mavlink_msg_hwstatus_get_Vcc(&(self->_message));
}

- (uint8_t)I2Cerr {
  return mavlink_msg_hwstatus_get_I2Cerr(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, Vcc=%d, I2Cerr=%d", [super description], [self Vcc], [self I2Cerr]];
}

@end
