//
//  UILabel+YPLabel.m
//  YPKit
//
//  Created by  yeyongping on 15/2/16.
//  Copyright © 2015年  yeyongping. All rights reserved.
//

#import "UILabel+YPLabel.h"

@implementation UILabel (YPLabel)

+ (instancetype)labelWithTextColor:(UIColor *)textColor font:(UIFont *)font text:(NSString *)text {
    UILabel *label = [[UILabel alloc] init];
    label.textColor = textColor;
    label.font = font;
    label.text = text;
    return label;
}

+ (instancetype)labelWithTextColor:(UIColor *)textColor font:(UIFont *)font{
    UILabel *label = [[UILabel alloc] init];
    label.textColor = textColor;
    label.font = font;
    return label;
}

@end
