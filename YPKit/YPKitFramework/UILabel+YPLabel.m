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

+ (UILabel *(^)(CGRect))creatWithFrame_yp {
    return ^(CGRect frame) {
        return  [[UILabel alloc] initWithFrame:frame];
    };
}

//
- (UILabel *(^)(UIFont *))font_yp {
    return ^(UIFont *font) {
        self.font = font;
        return self;
    };
}
- (UILabel *(^)(NSString *))text_yp {
    return ^(NSString *text) {
        self.text = text;
        return self;
    };
}
- (UILabel *(^)(NSAttributedString *))attributedText_yp {
    return ^(NSAttributedString *attrString) {
        self.attributedText = attrString;
        return self;
    };
}


- (UILabel *(^)(UIColor *))textColor_yp {
    return ^(UIColor *textColor) {
        self.textColor = textColor;
        return self;
    };
}

- (UILabel *(^)(UIColor *))shadowColor_yp {
    return ^(UIColor *textColor) {
        self.shadowColor = textColor;
        return self;
    };
}
- (UILabel *(^)(CGSize))shadowOffset_yp {
    return ^(CGSize size) {
        self.shadowOffset = size;
        return self;
    };
}

- (UILabel *(^)(NSTextAlignment))textAlignment_yp {
    return ^(NSTextAlignment alignment) {
        self.textAlignment = alignment;
        return self;
    };
}

- (UILabel *(^)(NSInteger))numberOfLines_yp {
    return ^(NSInteger lines) {
        self.numberOfLines = lines;
        return self;
    };
}

- (UILabel *(^)(CGFloat))minimumScaleFactor_yp {
    return ^(CGFloat scaleFactor) {
        self.minimumScaleFactor = scaleFactor;
        return self;
    };
}

- (UILabel *(^)(UIBaselineAdjustment))baselineAdjustment_yp {
    return ^(UIBaselineAdjustment adjustment) {
        self.baselineAdjustment = adjustment;
        return self;
    };
}

- (UILabel *(^)(BOOL))adjustsFontSizeToFitWidth_yp {
    return ^(BOOL adjustsFontSizeToFitWidth) {
        self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth;
        return self;
    };
}

@end
