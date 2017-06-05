//
//  YPPresentTransitionFromRight.m
//  Rippton Logo guidelines
//
//  Created by yeyongping on 2017/5/7.
//  Copyright © 2017年 chu. All rights reserved.
//

#import "YPPresentTransitionFromRight.h"

@implementation YPPresentTransitionFromRight

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *toGOViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toGOView = toGOViewController.view;
    toGOView.frame = CGRectMake(
                                CGRectGetWidth([UIScreen mainScreen].bounds),
                                0,
                                CGRectGetWidth([UIScreen mainScreen].bounds),
                                CGRectGetHeight([UIScreen mainScreen].bounds)
                                );
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toGOView];
    
    [UIView transitionWithView:toGOView duration:duration options:UIViewAnimationOptionCurveEaseIn animations:^{
        toGOView.frame = [UIScreen mainScreen].bounds;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
}
@end
