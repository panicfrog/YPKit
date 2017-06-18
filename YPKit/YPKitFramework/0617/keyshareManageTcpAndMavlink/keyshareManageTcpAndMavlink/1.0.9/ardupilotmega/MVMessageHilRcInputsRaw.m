//
//  MVMessageHilRcInputsRaw.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageHilRcInputsRaw.h"

@implementation MVMessageHilRcInputsRaw

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec chan1Raw:(uint16_t)chan1Raw chan2Raw:(uint16_t)chan2Raw chan3Raw:(uint16_t)chan3Raw chan4Raw:(uint16_t)chan4Raw chan5Raw:(uint16_t)chan5Raw chan6Raw:(uint16_t)chan6Raw chan7Raw:(uint16_t)chan7Raw chan8Raw:(uint16_t)chan8Raw chan9Raw:(uint16_t)chan9Raw chan10Raw:(uint16_t)chan10Raw chan11Raw:(uint16_t)chan11Raw chan12Raw:(uint16_t)chan12Raw rssi:(uint8_t)rssi {
  if ((self = [super init])) {
    mavlink_msg_hil_rc_inputs_raw_pack(systemId, componentId, &(self->_message), timeUsec, chan1Raw, chan2Raw, chan3Raw, chan4Raw, chan5Raw, chan6Raw, chan7Raw, chan8Raw, chan9Raw, chan10Raw, chan11Raw, chan12Raw, rssi);
  }
  return self;
}

- (uint64_t)timeUsec {
  return mavlink_msg_hil_rc_inputs_raw_get_time_usec(&(self->_message));
}

- (uint16_t)chan1Raw {
  return mavlink_msg_hil_rc_inputs_raw_get_chan1_raw(&(self->_message));
}

- (uint16_t)chan2Raw {
  return mavlink_msg_hil_rc_inputs_raw_get_chan2_raw(&(self->_message));
}

- (uint16_t)chan3Raw {
  return mavlink_msg_hil_rc_inputs_raw_get_chan3_raw(&(self->_message));
}

- (uint16_t)chan4Raw {
  return mavlink_msg_hil_rc_inputs_raw_get_chan4_raw(&(self->_message));
}

- (uint16_t)chan5Raw {
  return mavlink_msg_hil_rc_inputs_raw_get_chan5_raw(&(self->_message));
}

- (uint16_t)chan6Raw {
  return mavlink_msg_hil_rc_inputs_raw_get_chan6_raw(&(self->_message));
}

- (uint16_t)chan7Raw {
  return mavlink_msg_hil_rc_inputs_raw_get_chan7_raw(&(self->_message));
}

- (uint16_t)chan8Raw {
  return mavlink_msg_hil_rc_inputs_raw_get_chan8_raw(&(self->_message));
}

- (uint16_t)chan9Raw {
  return mavlink_msg_hil_rc_inputs_raw_get_chan9_raw(&(self->_message));
}

- (uint16_t)chan10Raw {
  return mavlink_msg_hil_rc_inputs_raw_get_chan10_raw(&(self->_message));
}

- (uint16_t)chan11Raw {
  return mavlink_msg_hil_rc_inputs_raw_get_chan11_raw(&(self->_message));
}

- (uint16_t)chan12Raw {
  return mavlink_msg_hil_rc_inputs_raw_get_chan12_raw(&(self->_message));
}

- (uint8_t)rssi {
  return mavlink_msg_hil_rc_inputs_raw_get_rssi(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeUsec=%lld, chan1Raw=%d, chan2Raw=%d, chan3Raw=%d, chan4Raw=%d, chan5Raw=%d, chan6Raw=%d, chan7Raw=%d, chan8Raw=%d, chan9Raw=%d, chan10Raw=%d, chan11Raw=%d, chan12Raw=%d, rssi=%d", [super description], [self timeUsec], [self chan1Raw], [self chan2Raw], [self chan3Raw], [self chan4Raw], [self chan5Raw], [self chan6Raw], [self chan7Raw], [self chan8Raw], [self chan9Raw], [self chan10Raw], [self chan11Raw], [self chan12Raw], [self rssi]];
}

@end
