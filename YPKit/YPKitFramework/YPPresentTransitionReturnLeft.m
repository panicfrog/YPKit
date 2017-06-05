//
//  YPPresentTransitionReturnLeft.m
//  Rippton
//
//  Created by yeyongping on 2017/6/4.
//  Copyright © 2017年 Rippton. All rights reserved.
//

#import "YPPresentTransitionReturnLeft.h"

@implementation YPPresentTransitionReturnLeft

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *toView = toViewController.view;
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        toView.frame = CGRectMake(
                                  -CGRectGetWidth([UIScreen mainScreen].bounds),
                                  0,
                                  CGRectGetWidth([UIScreen mainScreen].bounds),
                                  CGRectGetHeight([UIScreen mainScreen].bounds)
                                  );
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
}

@end
