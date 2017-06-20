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

+ (UILabel *(^)(CGRect))creatWithFrame_yp;

- (UILabel *(^)(UIFont *))font_yp;
- (UILabel *(^)(NSString *))text_yp;
- (UILabel *(^)(NSAttributedString *))attributedText_yp;
- (UILabel *(^)(UIColor *))textColor_yp;
- (UILabel *(^)(UIColor *))shadowColor_yp;
- (UILabel *(^)(CGSize))shadowOffset_yp;

- (UILabel *(^)(NSTextAlignment))textAlignment_yp;
- (UILabel *(^)(NSInteger))numberOfLines_yp;

- (UILabel *(^)(CGFloat))minimumScaleFactor_yp;
- (UILabel *(^)(UIBaselineAdjustment))baselineAdjustment_yp;
- (UILabel *(^)(BOOL))adjustsFontSizeToFitWidth_yp;

@end
