//
//  YPAlertviewTransitionEasyOut.m
//  YPAlertViewController
//
//  Created by yeyongping on 2016/10/15.
//  Copyright © 2016年 com.yeyongping@qq.com. All rights reserved.
//

#import "YPAlertviewTransitionEasyOut.h"

@interface YPAlertviewTransitionEasyOut ()

@end

@implementation YPAlertviewTransitionEasyOut

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.15;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromviewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
   
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromviewController.view.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

@end
