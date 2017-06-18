//
//  MVMessageRcChannelsRaw.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageRcChannelsRaw.h"

@implementation MVMessageRcChannelsRaw

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeBootMs:(uint32_t)timeBootMs port:(uint8_t)port chan1Raw:(uint16_t)chan1Raw chan2Raw:(uint16_t)chan2Raw chan3Raw:(uint16_t)chan3Raw chan4Raw:(uint16_t)chan4Raw chan5Raw:(uint16_t)chan5Raw chan6Raw:(uint16_t)chan6Raw chan7Raw:(uint16_t)chan7Raw chan8Raw:(uint16_t)chan8Raw rssi:(uint8_t)rssi {
  if ((self = [super init])) {
    mavlink_msg_rc_channels_raw_pack(systemId, componentId, &(self->_message), timeBootMs, port, chan1Raw, chan2Raw, chan3Raw, chan4Raw, chan5Raw, chan6Raw, chan7Raw, chan8Raw, rssi);
  }
  return self;
}

- (uint32_t)timeBootMs {
  return mavlink_msg_rc_channels_raw_get_time_boot_ms(&(self->_message));
}

- (uint8_t)port {
  return mavlink_msg_rc_channels_raw_get_port(&(self->_message));
}

- (uint16_t)chan1Raw {
  return mavlink_msg_rc_channels_raw_get_chan1_raw(&(self->_message));
}

- (uint16_t)chan2Raw {
  return mavlink_msg_rc_channels_raw_get_chan2_raw(&(self->_message));
}

- (uint16_t)chan3Raw {
  return mavlink_msg_rc_channels_raw_get_chan3_raw(&(self->_message));
}

- (uint16_t)chan4Raw {
  return mavlink_msg_rc_channels_raw_get_chan4_raw(&(self->_message));
}

- (uint16_t)chan5Raw {
  return mavlink_msg_rc_channels_raw_get_chan5_raw(&(self->_message));
}

- (uint16_t)chan6Raw {
  return mavlink_msg_rc_channels_raw_get_chan6_raw(&(self->_message));
}

- (uint16_t)chan7Raw {
  return mavlink_msg_rc_channels_raw_get_chan7_raw(&(self->_message));
}

- (uint16_t)chan8Raw {
  return mavlink_msg_rc_channels_raw_get_chan8_raw(&(self->_message));
}

- (uint8_t)rssi {
  return mavlink_msg_rc_channels_raw_get_rssi(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeBootMs=%d, port=%d, chan1Raw=%d, chan2Raw=%d, chan3Raw=%d, chan4Raw=%d, chan5Raw=%d, chan6Raw=%d, chan7Raw=%d, chan8Raw=%d, rssi=%d", [super description], [self timeBootMs], [self port], [self chan1Raw], [self chan2Raw], [self chan3Raw], [self chan4Raw], [self chan5Raw], [self chan6Raw], [self chan7Raw], [self chan8Raw], [self rssi]];
}

@end
