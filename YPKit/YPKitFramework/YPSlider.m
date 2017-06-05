//
//  YPSlider.m
//  Rippton
//
//  Created by yeyongping on 2017/6/3.
//  Copyright © 2017年 Rippton. All rights reserved.
//

#import "YPSlider.h"

@interface YPSlider ()<UIScrollViewDelegate>

@property (weak, nonatomic) UIView *slider;
@property (weak, nonatomic) UIView *leftBackgroundView;
@property (copy, nonatomic) void(^sliderHandle)( BOOL);

@end

@implementation YPSlider

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *hitTestView = [super hitTest:point withEvent:event];
    if (!CGRectContainsPoint(self.slider.frame,point) && CGRectContainsPoint(self.bounds, point)) {
        return nil;
    }
    return hitTestView;
}


+ (instancetype)sliderWithFrame:(CGRect)frame sliderToRight:(void(^)(BOOL))sliderHandle{
    CGFloat height = CGRectGetHeight(frame);
    CGFloat width = CGRectGetWidth(frame);
    YPSlider *sliderView = [[YPSlider alloc] initWithFrame:frame];
    
    sliderView.sliderHandle = sliderHandle;
    sliderView.layer.cornerRadius = height/2;
    sliderView.layer.masksToBounds = YES;
    sliderView.bounces = NO;
    sliderView.showsHorizontalScrollIndicator = NO;
    sliderView.pagingEnabled = YES;
    sliderView.backgroundColor = [UIColor greenColor];
    sliderView.contentSize = CGSizeMake(2*width - height, 0);
    sliderView.contentOffset = CGPointMake(width - height, 0);
    
    [sliderView setupSubviews];
    return sliderView;
}

- (void)setupSubviews {
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    self.delegate = self;
    
    UIView *leftBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width - height/2, height)];
    _leftBackgroundView = leftBackgroundView;
    leftBackgroundView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:leftBackgroundView];
    
    UIView *slider = [[UIView alloc] initWithFrame:CGRectMake(width - height, 0, height, height)];
    _slider = slider;
    slider.backgroundColor = [UIColor whiteColor];
    slider.layer.cornerRadius = height/2;
    slider.layer.masksToBounds = YES;
    [self addSubview:slider];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat x = scrollView.contentOffset.x;
    if (0 == x) {
        if (_sliderHandle) {
            _sliderHandle(YES);
        }
    } else if (CGRectGetWidth(scrollView.frame) - CGRectGetHeight(scrollView.frame) == x) {
        if (_sliderHandle) {
            _sliderHandle(NO);
        }
    }
}

@end
