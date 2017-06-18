//
//  MVMessageVfrHud.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageVfrHud.h"

@implementation MVMessageVfrHud

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId airspeed:(float)airspeed groundspeed:(float)groundspeed heading:(int16_t)heading throttle:(uint16_t)throttle alt:(float)alt climb:(float)climb {
  if ((self = [super init])) {
    mavlink_msg_vfr_hud_pack(systemId, componentId, &(self->_message), airspeed, groundspeed, heading, throttle, alt, climb);
  }
  return self;
}

- (float)airspeed {
  return mavlink_msg_vfr_hud_get_airspeed(&(self->_message));
}

- (float)groundspeed {
  return mavlink_msg_vfr_hud_get_groundspeed(&(self->_message));
}

- (int16_t)heading {
  return mavlink_msg_vfr_hud_get_heading(&(self->_message));
}

- (uint16_t)throttle {
  return mavlink_msg_vfr_hud_get_throttle(&(self->_message));
}

- (float)alt {
  return mavlink_msg_vfr_hud_get_alt(&(self->_message));
}

- (float)climb {
  return mavlink_msg_vfr_hud_get_climb(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, airspeed=%f, groundspeed=%f, heading=%d, throttle=%d, alt=%f, climb=%f", [super description], [self airspeed], [self groundspeed], [self heading], [self throttle], [self alt], [self climb]];
}

@end
