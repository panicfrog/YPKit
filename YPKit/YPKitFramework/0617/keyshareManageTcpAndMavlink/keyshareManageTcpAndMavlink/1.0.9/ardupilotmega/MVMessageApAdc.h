//
//  MVMessageApAdc.h
//  MAVLink communications protocol built from ardupilotmega.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a AP_ADC Mavlink message.

 @discussion raw ADC output
 */
@interface MVMessageApAdc : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId adc1:(uint16_t)adc1 adc2:(uint16_t)adc2 adc3:(uint16_t)adc3 adc4:(uint16_t)adc4 adc5:(uint16_t)adc5 adc6:(uint16_t)adc6;

//! ADC output 1
- (uint16_t)adc1;

//! ADC output 2
- (uint16_t)adc2;

//! ADC output 3
- (uint16_t)adc3;

//! ADC output 4
- (uint16_t)adc4;

//! ADC output 5
- (uint16_t)adc5;

//! ADC output 6
- (uint16_t)adc6;

@end
