//
//  MVMessageApAdc.h
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 typedef struct __mavlink_execute
 {
 uint16_t command; // 保留
 uint16_t reserve1; //低位对应关系,见表二。高位不用
 uint16_t reserve2;//预留
 } mavlink_execute;
 */
@interface MVMessageexceute: MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId m_command:(uint16_t)_command m_reserve1:(uint16_t)_reserve1 m_reserve2:(uint16_t) _reserve2;


@end
