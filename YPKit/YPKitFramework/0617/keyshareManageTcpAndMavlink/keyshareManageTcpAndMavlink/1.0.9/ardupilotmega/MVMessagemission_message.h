//
//  MVMessageApAdc.h
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 typedef struct __mavlink_mission_message
 {
 float x; //正在执行的航点的经度
 float y; //正在执行的航点的纬度
 float z; //正在执行的航点的高度 uint16_t seq; //任务序号
 uint16_t reserve1;//保留
 
 } mavlink_mission_message;
 */
@interface MVMessagemission_message: MVMessage

//! ADC output 1
- (float)x;

//! ADC output 2
- (float)y;

//! ADC output 3
- (float)z;

//! ADC output 4
- (uint16_t)reserve1;

- (uint16_t)seq;


@end
