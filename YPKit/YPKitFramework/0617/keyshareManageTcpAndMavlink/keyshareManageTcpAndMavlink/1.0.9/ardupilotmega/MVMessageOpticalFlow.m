//
//  MVMessageOpticalFlow.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageOpticalFlow.h"

@implementation MVMessageOpticalFlow

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec sensorId:(uint8_t)sensorId flowX:(int16_t)flowX flowY:(int16_t)flowY flowCompMX:(float)flowCompMX flowCompMY:(float)flowCompMY quality:(uint8_t)quality groundDistance:(float)groundDistance {
  if ((self = [super init])) {
    mavlink_msg_optical_flow_pack(systemId, componentId, &(self->_message), timeUsec, sensorId, flowX, flowY, flowCompMX, flowCompMY, quality, groundDistance);
  }
  return self;
}

- (uint64_t)timeUsec {
  return mavlink_msg_optical_flow_get_time_usec(&(self->_message));
}

- (uint8_t)sensorId {
  return mavlink_msg_optical_flow_get_sensor_id(&(self->_message));
}

- (int16_t)flowX {
  return mavlink_msg_optical_flow_get_flow_x(&(self->_message));
}

- (int16_t)flowY {
  return mavlink_msg_optical_flow_get_flow_y(&(self->_message));
}

- (float)flowCompMX {
  return mavlink_msg_optical_flow_get_flow_comp_m_x(&(self->_message));
}

- (float)flowCompMY {
  return mavlink_msg_optical_flow_get_flow_comp_m_y(&(self->_message));
}

- (uint8_t)quality {
  return mavlink_msg_optical_flow_get_quality(&(self->_message));
}

- (float)groundDistance {
  return mavlink_msg_optical_flow_get_ground_distance(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeUsec=%lld, sensorId=%d, flowX=%d, flowY=%d, flowCompMX=%f, flowCompMY=%f, quality=%d, groundDistance=%f", [super description], [self timeUsec], [self sensorId], [self flowX], [self flowY], [self flowCompMX], [self flowCompMY], [self quality], [self groundDistance]];
}

@end
