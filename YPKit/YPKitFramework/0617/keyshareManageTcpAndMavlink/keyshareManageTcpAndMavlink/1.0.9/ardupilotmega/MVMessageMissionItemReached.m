//
//  MVMessageMissionItemReached.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageMissionItemReached.h"

@implementation MVMessageMissionItemReached

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId seq:(uint16_t)seq {
  if ((self = [super init])) {
    mavlink_msg_mission_item_reached_pack(systemId, componentId, &(self->_message), seq);
  }
  return self;
}

- (uint16_t)seq {
  return mavlink_msg_mission_item_reached_get_seq(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, seq=%d", [super description], [self seq]];
}

@end
