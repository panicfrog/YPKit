//
//  MVMessageRcChannelsScaled.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageRcChannelsScaled.h"

@implementation MVMessageRcChannelsScaled

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeBootMs:(uint32_t)timeBootMs port:(uint8_t)port chan1Scaled:(int16_t)chan1Scaled chan2Scaled:(int16_t)chan2Scaled chan3Scaled:(int16_t)chan3Scaled chan4Scaled:(int16_t)chan4Scaled chan5Scaled:(int16_t)chan5Scaled chan6Scaled:(int16_t)chan6Scaled chan7Scaled:(int16_t)chan7Scaled chan8Scaled:(int16_t)chan8Scaled rssi:(uint8_t)rssi {
  if ((self = [super init])) {
    mavlink_msg_rc_channels_scaled_pack(systemId, componentId, &(self->_message), timeBootMs, port, chan1Scaled, chan2Scaled, chan3Scaled, chan4Scaled, chan5Scaled, chan6Scaled, chan7Scaled, chan8Scaled, rssi);
  }
  return self;
}

- (uint32_t)timeBootMs {
  return mavlink_msg_rc_channels_scaled_get_time_boot_ms(&(self->_message));
}

- (uint8_t)port {
  return mavlink_msg_rc_channels_scaled_get_port(&(self->_message));
}

- (int16_t)chan1Scaled {
  return mavlink_msg_rc_channels_scaled_get_chan1_scaled(&(self->_message));
}

- (int16_t)chan2Scaled {
  return mavlink_msg_rc_channels_scaled_get_chan2_scaled(&(self->_message));
}

- (int16_t)chan3Scaled {
  return mavlink_msg_rc_channels_scaled_get_chan3_scaled(&(self->_message));
}

- (int16_t)chan4Scaled {
  return mavlink_msg_rc_channels_scaled_get_chan4_scaled(&(self->_message));
}

- (int16_t)chan5Scaled {
  return mavlink_msg_rc_channels_scaled_get_chan5_scaled(&(self->_message));
}

- (int16_t)chan6Scaled {
  return mavlink_msg_rc_channels_scaled_get_chan6_scaled(&(self->_message));
}

- (int16_t)chan7Scaled {
  return mavlink_msg_rc_channels_scaled_get_chan7_scaled(&(self->_message));
}

- (int16_t)chan8Scaled {
  return mavlink_msg_rc_channels_scaled_get_chan8_scaled(&(self->_message));
}

- (uint8_t)rssi {
  return mavlink_msg_rc_channels_scaled_get_rssi(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeBootMs=%d, port=%d, chan1Scaled=%d, chan2Scaled=%d, chan3Scaled=%d, chan4Scaled=%d, chan5Scaled=%d, chan6Scaled=%d, chan7Scaled=%d, chan8Scaled=%d, rssi=%d", [super description], [self timeBootMs], [self port], [self chan1Scaled], [self chan2Scaled], [self chan3Scaled], [self chan4Scaled], [self chan5Scaled], [self chan6Scaled], [self chan7Scaled], [self chan8Scaled], [self rssi]];
}

@end
