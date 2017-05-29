//
//  UITextView+YPTextView.h
//  YPTextView
//
//  Created by  yeyongping on 15/3/28.
//  Copyright © 2015年  yeyongping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (YPTextView)

- (CGFloat)hightForAutoFit;
- (CGFloat(^)(CGFloat))heightForTextWidth;
- (CGFloat(^)(NSString *,CGFloat))heightForStringAndWidth;

@end
