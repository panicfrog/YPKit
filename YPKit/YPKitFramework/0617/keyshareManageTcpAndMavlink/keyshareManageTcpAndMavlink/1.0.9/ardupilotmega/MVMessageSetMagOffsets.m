//
//  MVMessageSetMagOffsets.m
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageSetMagOffsets.h"

@implementation MVMessageSetMagOffsets

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent magOfsX:(int16_t)magOfsX magOfsY:(int16_t)magOfsY magOfsZ:(int16_t)magOfsZ {
  if ((self = [super init])) {
    mavlink_msg_set_mag_offsets_pack(systemId, componentId, &(self->_message), targetSystem, targetComponent, magOfsX, magOfsY, magOfsZ);
  }
  return self;
}

- (uint8_t)targetSystem {
  return mavlink_msg_set_mag_offsets_get_target_system(&(self->_message));
}

- (uint8_t)targetComponent {
  return mavlink_msg_set_mag_offsets_get_target_component(&(self->_message));
}

- (int16_t)magOfsX {
  return mavlink_msg_set_mag_offsets_get_mag_ofs_x(&(self->_message));
}

- (int16_t)magOfsY {
  return mavlink_msg_set_mag_offsets_get_mag_ofs_y(&(self->_message));
}

- (int16_t)magOfsZ {
  return mavlink_msg_set_mag_offsets_get_mag_ofs_z(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, targetSystem=%d, targetComponent=%d, magOfsX=%d, magOfsY=%d, magOfsZ=%d", [super description], [self targetSystem], [self targetComponent], [self magOfsX], [self magOfsY], [self magOfsZ]];
}

@end
