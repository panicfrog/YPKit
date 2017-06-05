//
//  YPPresentTransitionReturnRight.m
//  Rippton Logo guidelines
//
//  Created by yeyongping on 2017/5/7.
//  Copyright © 2017年 chu. All rights reserved.
//

#import "YPPresentTransitionReturnRight.h"

@implementation YPPresentTransitionReturnRight

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *toView = toViewController.view;
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        toView.frame = CGRectMake(
                                    CGRectGetWidth([UIScreen mainScreen].bounds),
                                    0,
                                    CGRectGetWidth([UIScreen mainScreen].bounds),
                                    CGRectGetHeight([UIScreen mainScreen].bounds)
                                    );
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
}

@end
