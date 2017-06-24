//
//  UIView+YPView.m
//  YPKit
//
//  Created by  fireFrog on 2017/6/2.
//  Copyright © 2017年 D8Ge_yeyongping. All rights reserved.
//

#import "UIView+YPView.h"

@implementation UIView (YPView)
- (UIImage *)snap_yp{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return viewImage;
}


- (UIView *(^)(CGFloat))cornerRadius_yp {
    return ^(CGFloat radius) {
        self.layer.cornerRadius = radius;
        return self;
    };
}

- (UIView *(^)(CGFloat))borderWidth_yp {
    return ^(CGFloat borderWidth) {
        self.layer.borderWidth = borderWidth;
        return self;
    };
}

- (UIView *(^)(UIColor *))borderColor_yp {
    return ^(UIColor *borderColor) {
        self.layer.borderColor = borderColor.CGColor;
        return self;
    };
}

- (UIView *(^)(BOOL))masksToBounds_yp {
    return ^(BOOL masksToBounds) {
        self.layer.masksToBounds = masksToBounds;
        return self;
    };
}

@end
