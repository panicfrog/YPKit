//
//  MVMessageChangeOperatorControlAck.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageChangeOperatorControlAck.h"

@implementation MVMessageChangeOperatorControlAck

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId gcsSystemId:(uint8_t)gcsSystemId controlRequest:(uint8_t)controlRequest ack:(uint8_t)ack {
  if ((self = [super init])) {
    mavlink_msg_change_operator_control_ack_pack(systemId, componentId, &(self->_message), gcsSystemId, controlRequest, ack);
  }
  return self;
}

- (uint8_t)gcsSystemId {
  return mavlink_msg_change_operator_control_ack_get_gcs_system_id(&(self->_message));
}

- (uint8_t)controlRequest {
  return mavlink_msg_change_operator_control_ack_get_control_request(&(self->_message));
}

- (uint8_t)ack {
  return mavlink_msg_change_operator_control_ack_get_ack(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, gcsSystemId=%d, controlRequest=%d, ack=%d", [super description], [self gcsSystemId], [self controlRequest], [self ack]];
}

@end
