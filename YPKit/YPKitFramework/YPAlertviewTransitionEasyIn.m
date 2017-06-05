//
//  YPAlertviewTransitionEasyIn.m
//  YPAlertViewController
//
//  Created by yeyongping on 2016/10/15.
//  Copyright © 2016年 com.yeyongping@qq.com. All rights reserved.
//

#import "YPAlertviewTransitionEasyIn.h"
#import "YPAlertViewController.h"

@interface YPAlertviewTransitionEasyIn ()

@end

@implementation YPAlertviewTransitionEasyIn

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.2;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *toGOViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    if (![toGOViewController isKindOfClass:[YPAlertViewController class]]) {
        return;
    }
    YPAlertViewController *willGOViewController = (YPAlertViewController *)toGOViewController;
    UIView *toGoView = willGOViewController.alertView;
    willGOViewController.view.frame = [UIScreen mainScreen].bounds;
    toGoView.alpha = 0;
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:willGOViewController.view];
    
    [UIView animateWithDuration:duration animations:^{
        toGoView.alpha = 1;
        [self popAnimationWithLayer:toGoView.layer];
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

//pop动画效果
-(void)popAnimationWithLayer:(CALayer *)layer{
    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    CATransform3D startingScale = CATransform3DScale (layer.transform, 0, 0, 0);
    CATransform3D overshootScale = CATransform3DScale (layer.transform, 1.1, 1.1, 1.0);
    CATransform3D undershootScale = CATransform3DScale (layer.transform, 0.95, 0.95, 1.0);
    CATransform3D endingScale = layer.transform;
    
    NSArray *boundsValues = [NSArray arrayWithObjects:[NSValue valueWithCATransform3D:startingScale],
                             [NSValue valueWithCATransform3D:overshootScale],
                             [NSValue valueWithCATransform3D:undershootScale],
                             [NSValue valueWithCATransform3D:endingScale], nil];
    [popAnimation setValues:boundsValues];
    
    NSArray *times = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0f],
                      [NSNumber numberWithFloat:0.5f],
                      [NSNumber numberWithFloat:0.8f],
                      [NSNumber numberWithFloat:1.0f], nil];
    [popAnimation setKeyTimes:times];
    
    NSArray *timingFunctions = [NSArray arrayWithObjects:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                nil];
    [popAnimation setTimingFunctions:timingFunctions];
    
    [layer addAnimation:popAnimation forKey:nil];
}

@end
