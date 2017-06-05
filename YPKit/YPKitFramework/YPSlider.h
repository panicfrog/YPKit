//
//  YPSlider.h
//  Rippton
//
//  Created by yeyongping on 2017/6/3.
//  Copyright © 2017年 Rippton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YPSlider : UIScrollView

@property (copy, nonatomic) NSString *title;
@property (strong, nonatomic) UIColor *titleColor;
@property (strong, nonatomic) UIFont *titleFont;

+ (instancetype)sliderWithFrame:(CGRect)frame sliderToRight:(void(^)(BOOL isRight))sliderHandle;
- (void)sliderToRight:(void(^)(BOOL isRight))sliderHandle;

@end
