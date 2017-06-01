//
//  UILabel+YPLabel.h
//  YPKit
//
//  Created by  yeyongping on 15/2/16.
//  Copyright © 2015年  yeyongping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (YPLabel)

+ (instancetype)labelWithTextColor:(UIColor *)textColor
                              font:(UIFont *)font
                              text:(NSString *)text;

+ (instancetype)labelWithTextColor:(UIColor *)textColor
                              font:(UIFont *)font;
@end
