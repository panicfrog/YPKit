//
//  UIButton+YPButton.m
//  YPKit
//
//  Created by  yeyongping on 15/2/16.
//  Copyright © 2015年  yeyongping. All rights reserved.
//

#import "UIButton+YPButton.h"
#import "UIColor+YPColor.h"

@implementation UIButton (YPButton)

+ (UIButton *(^)(CGRect))creatWithFrame_yp {
    return ^(CGRect frame) {
        return [[self alloc] initWithFrame:frame];
    };
}

//背景图片
- (UIButton *(^)(UIImage *))nomalBackgroundImage_yp {
    return ^(UIImage *image) {
        [self setBackgroundImage:image forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton *(^)(UIImage *))highlightedBackgroundImage_yp {
    return ^(UIImage *image) {
        [self setBackgroundImage:image forState:UIControlStateHighlighted];
        return self;
    };
}
- (UIButton *(^)(UIImage *))disableBackgroundImage_yp {
    return ^(UIImage *image) {
        [self setBackgroundImage:image forState:UIControlStateDisabled];
        return self;
    };
}
- (UIButton *(^)(UIImage *))selectedBackgroundImage_yp {
    return ^(UIImage *image) {
        [self setBackgroundImage:image forState:UIControlStateSelected];
        return self;
    };
}

//背景颜色
- (UIButton *(^)(UIColor *))nomalBackgroundColor_yp {
    return ^(UIColor *color) {
        [self setBackgroundImage:color.imageWithSize(CGSizeMake(10, 10)) forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton *(^)(UIColor *))highlightBackgroundColor_yp {
    return ^(UIColor *color) {
        [self setBackgroundImage:color.imageWithSize(CGSizeMake(10, 10)) forState:UIControlStateHighlighted];
        return self;
    };
}
- (UIButton *(^)(UIColor *))disableBackgroundColor_yp {
    return ^(UIColor *color) {
        [self setBackgroundImage:color.imageWithSize(CGSizeMake(10, 10)) forState:UIControlStateDisabled];
        return self;
    };
}
- (UIButton *(^)(UIColor *))selectedBackgroundColor_yp {
    return ^(UIColor *color) {
        [self setBackgroundImage:color.imageWithSize(CGSizeMake(10, 10)) forState:UIControlStateSelected];
        return self;
    };
}

//图片
- (UIButton *(^)(UIImage *))nomalImage_yp {
    return ^(UIImage *image) {
        [self setImage:image forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton *(^)(UIImage *))highlightedImage_yp {
    return ^(UIImage *image) {
        [self setImage:image forState:UIControlStateHighlighted];
        return self;
    };
}
- (UIButton *(^)(UIImage *))disableImage_yp {
    return ^(UIImage *image) {
        [self setImage:image forState:UIControlStateDisabled];
        return self;
    };
}
- (UIButton *(^)(UIImage *))selectedImage_yp {
    return ^(UIImage *image) {
        [self setImage:image forState:UIControlStateSelected];
        return self;
    };
}


//字体
- (UIButton *(^)(UIFont *))font_yp {
    return ^(UIFont *font) {
        self.titleLabel.font = font;
        return self;
    };
}

//标题
- (UIButton *(^)(NSString *))nomalTitle_yp {
    return ^(NSString *title) {
        [self setTitle:title forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton *(^)(NSString *))highlightTitle_yp {
    return ^(NSString *title) {
        [self setTitle:title forState:UIControlStateHighlighted];
        return self;
    };
}
- (UIButton *(^)(NSString *))disableTitle_yp {
    return ^(NSString *title) {
        [self setTitle:title forState:UIControlStateDisabled];
        return self;
    };
}
- (UIButton *(^)(NSString *))selectedTitle_yp {
    return ^(NSString *title) {
        [self setTitle:title forState:UIControlStateSelected];
        return self;
    };
}


//标题颜色
- (UIButton *(^)(UIColor *))nomalTitleColor_yp {
    return ^(UIColor *color) {
        [self setTitleColor:color forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton *(^)(UIColor *))highlightTitleColor_yp {
    return ^(UIColor *color) {
        [self setTitleColor:color forState:UIControlStateHighlighted];
        return self;
    };
}
- (UIButton *(^)(UIColor *))disableTitleColor_yp {
    return ^(UIColor *color) {
        [self setTitleColor:color forState:UIControlStateDisabled];
        return self;
    };
}
- (UIButton *(^)(UIColor *))selectedTitleColor_yp {
    return ^(UIColor *color) {
        [self setTitleColor:color forState:UIControlStateSelected];
        return self;
    };
}

//添加方法
- (UIButton *(^)(id ,SEL,UIControlEvents))addTarget_action_events_yp{
    return ^(id target,SEL action,UIControlEvents events){
        [self addTarget:target action:action forControlEvents:events];
        return self;
    };
}

- (UIButton *(^)(id,SEL,UIControlEvents))addTarget_action_events_once_yp {
    return ^(id target,SEL action,UIControlEvents events){
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            [self addTarget:target action:action forControlEvents:events];
        });
        return self;
    };
}
@end
