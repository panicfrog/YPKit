//
//  MVMessageRadio.m
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageRadio.h"

@implementation MVMessageRadio

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId rssi:(uint8_t)rssi remrssi:(uint8_t)remrssi txbuf:(uint8_t)txbuf noise:(uint8_t)noise remnoise:(uint8_t)remnoise rxerrors:(uint16_t)rxerrors fixed:(uint16_t)fixed {
  if ((self = [super init])) {
    mavlink_msg_radio_pack(systemId, componentId, &(self->_message), rssi, remrssi, txbuf, noise, remnoise, rxerrors, fixed);
  }
  return self;
}

- (uint8_t)rssi {
  return mavlink_msg_radio_get_rssi(&(self->_message));
}

- (uint8_t)remrssi {
  return mavlink_msg_radio_get_remrssi(&(self->_message));
}

- (uint8_t)txbuf {
  return mavlink_msg_radio_get_txbuf(&(self->_message));
}

- (uint8_t)noise {
  return mavlink_msg_radio_get_noise(&(self->_message));
}

- (uint8_t)remnoise {
  return mavlink_msg_radio_get_remnoise(&(self->_message));
}

- (uint16_t)rxerrors {
  return mavlink_msg_radio_get_rxerrors(&(self->_message));
}

- (uint16_t)fixed {
  return mavlink_msg_radio_get_fixed(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, rssi=%d, remrssi=%d, txbuf=%d, noise=%d, remnoise=%d, rxerrors=%d, fixed=%d", [super description], [self rssi], [self remrssi], [self txbuf], [self noise], [self remnoise], [self rxerrors], [self fixed]];
}

@end
