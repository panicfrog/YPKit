//
//  UIButton+YPButton.h
//  YPKit
//
//  Created by  yeyongping on 15/2/16.
//  Copyright © 2015年  yeyongping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (YPButton)

#pragma mark -
#pragma mark - Creat
+ (UIButton *(^)(CGRect))creatWithFrame_yp;

#pragma mark - Background Image
- (UIButton *(^)(UIImage *))nomalBackgroundImage_yp;
- (UIButton *(^)(UIImage *))highlightedBackgroundImage_yp;
- (UIButton *(^)(UIImage *))disableBackgroundImage_yp;
- (UIButton *(^)(UIImage *))selectedBackgroundImage_yp;

#pragma mark - Background Color
- (UIButton *(^)(UIColor *))nomalBackgroundColor_yp;
- (UIButton *(^)(UIColor *))highlightBackgroundColor_yp;
- (UIButton *(^)(UIColor *))disableBackgroundColor_yp;
- (UIButton *(^)(UIColor *))selectedBackgroundColor_yp;

#pragma mark - Image
- (UIButton *(^)(UIImage *))nomalImage_yp;
- (UIButton *(^)(UIImage *))highlightedImage_yp;
- (UIButton *(^)(UIImage *))disableImage_yp;
- (UIButton *(^)(UIImage *))selectedImage_yp;

#pragma mark - Font
- (UIButton *(^)(UIFont *))font_yp;

#pragma mark - Title
- (UIButton *(^)(NSString *))nomalTitle_yp;
- (UIButton *(^)(NSString *))highlightTitle_yp;
- (UIButton *(^)(NSString *))disableTitle_yp;
- (UIButton *(^)(NSString *))selectedTitle_yp;

#pragma mark - TitleColor
- (UIButton *(^)(UIColor *))nomalTitleColor_yp;
- (UIButton *(^)(UIColor *))highlightTitleColor_yp;
- (UIButton *(^)(UIColor *))disableTitleColor_yp;
- (UIButton *(^)(UIColor *))selectedTitleColor_yp;

#pragma mark - Actions
- (UIButton *(^)(id ,SEL,UIControlEvents))addTarget_action_events_yp;
- (UIButton *(^)(id,SEL,UIControlEvents))addTarget_action_events_once_yp;

- (UIButton *(^)(UIView *))addToParentView_yp {
    return ^(UIView *parentView) {
        [parentView addSubview:self];
        return self;
    };
}

#pragma mark - ParentView && SubView
- (UIButton *(^)(UIView *))addSubview_yp {
    return ^(UIView *subView) {
        [self addSubview:subView];
        return self;
    };
}
@end
