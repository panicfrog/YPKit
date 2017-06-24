//
//  UIView+YPView.h
//  YPKit
//
//  Created by  fireFrog on 2017/6/2.
//  Copyright © 2017年 D8Ge_yeyongping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YPView)
- (UIImage *)snap_yp;
- (UIView *(^)(CGFloat))cornerRadius_yp;
- (UIView *(^)(BOOL))masksToBounds_yp;
- (UIView *(^)(CGFloat))borderWidth_yp;
- (UIView *(^)(UIColor *))borderColor_yp;

@end
