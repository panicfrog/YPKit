//
//  MVMessageRequestDataStream.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageRequestDataStream.h"

@implementation MVMessageRequestDataStream

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent reqStreamId:(uint8_t)reqStreamId reqMessageRate:(uint16_t)reqMessageRate startStop:(uint8_t)startStop {
  if ((self = [super init])) {
    mavlink_msg_request_data_stream_pack(systemId, componentId, &(self->_message), targetSystem, targetComponent, reqStreamId, reqMessageRate, startStop);
  }
  return self;
}

- (uint8_t)targetSystem {
  return mavlink_msg_request_data_stream_get_target_system(&(self->_message));
}

- (uint8_t)targetComponent {
  return mavlink_msg_request_data_stream_get_target_component(&(self->_message));
}

- (uint8_t)reqStreamId {
  return mavlink_msg_request_data_stream_get_req_stream_id(&(self->_message));
}

- (uint16_t)reqMessageRate {
  return mavlink_msg_request_data_stream_get_req_message_rate(&(self->_message));
}

- (uint8_t)startStop {
  return mavlink_msg_request_data_stream_get_start_stop(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, targetSystem=%d, targetComponent=%d, reqStreamId=%d, reqMessageRate=%d, startStop=%d", [super description], [self targetSystem], [self targetComponent], [self reqStreamId], [self reqMessageRate], [self startStop]];
}

@end
