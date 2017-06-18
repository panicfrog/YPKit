//
//  MVMessageSysStatus.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageSysStatus.h"

@implementation MVMessageSysStatus

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId onboardControlSensorsPresent:(uint32_t)onboardControlSensorsPresent onboardControlSensorsEnabled:(uint32_t)onboardControlSensorsEnabled onboardControlSensorsHealth:(uint32_t)onboardControlSensorsHealth load:(uint16_t)load voltageBattery:(uint16_t)voltageBattery currentBattery:(int16_t)currentBattery batteryRemaining:(int8_t)batteryRemaining dropRateComm:(uint16_t)dropRateComm errorsComm:(uint16_t)errorsComm errorsCount1:(uint16_t)errorsCount1 errorsCount2:(uint16_t)errorsCount2 errorsCount3:(uint16_t)errorsCount3 errorsCount4:(uint16_t)errorsCount4 {
  if ((self = [super init])) {
    mavlink_msg_sys_status_pack(systemId, componentId, &(self->_message), onboardControlSensorsPresent, onboardControlSensorsEnabled, onboardControlSensorsHealth, load, voltageBattery, currentBattery, batteryRemaining, dropRateComm, errorsComm, errorsCount1, errorsCount2, errorsCount3, errorsCount4);
  }
  return self;
}

- (uint32_t)onboardControlSensorsPresent {
  return mavlink_msg_sys_status_get_onboard_control_sensors_present(&(self->_message));
}

- (uint32_t)onboardControlSensorsEnabled {
  return mavlink_msg_sys_status_get_onboard_control_sensors_enabled(&(self->_message));
}

- (uint32_t)onboardControlSensorsHealth {
  return mavlink_msg_sys_status_get_onboard_control_sensors_health(&(self->_message));
}

- (uint16_t)load {
  return mavlink_msg_sys_status_get_load(&(self->_message));
}

- (uint16_t)voltageBattery {
  return mavlink_msg_sys_status_get_voltage_battery(&(self->_message));
}

- (int16_t)currentBattery {
  return mavlink_msg_sys_status_get_current_battery(&(self->_message));
}

- (int8_t)batteryRemaining {
  return mavlink_msg_sys_status_get_battery_remaining(&(self->_message));
}

- (uint16_t)dropRateComm {
  return mavlink_msg_sys_status_get_drop_rate_comm(&(self->_message));
}

- (uint16_t)errorsComm {
  return mavlink_msg_sys_status_get_errors_comm(&(self->_message));
}

- (uint16_t)errorsCount1 {
  return mavlink_msg_sys_status_get_errors_count1(&(self->_message));
}

- (uint16_t)errorsCount2 {
  return mavlink_msg_sys_status_get_errors_count2(&(self->_message));
}

- (uint16_t)errorsCount3 {
  return mavlink_msg_sys_status_get_errors_count3(&(self->_message));
}

- (uint16_t)errorsCount4 {
  return mavlink_msg_sys_status_get_errors_count4(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, onboardControlSensorsPresent=0x%04x, onboardControlSensorsEnabled=0x%04x, onboardControlSensorsHealth=0x%04x, load=%d, voltageBattery=%d, currentBattery=%d, batteryRemaining=%d, dropRateComm=%d, errorsComm=%d, errorsCount1=%d, errorsCount2=%d, errorsCount3=%d, errorsCount4=%d", [super description], [self onboardControlSensorsPresent], [self onboardControlSensorsEnabled], [self onboardControlSensorsHealth], [self load], [self voltageBattery], [self currentBattery], [self batteryRemaining], [self dropRateComm], [self errorsComm], [self errorsCount1], [self errorsCount2], [self errorsCount3], [self errorsCount4]];
}

@end
