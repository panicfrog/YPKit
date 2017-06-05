//
//  YPAlertViewController.m
//  Rippton
//
//  Created by yeyongping on 2017/6/4.
//  Copyright © 2017年 Rippton. All rights reserved.
//

#import "YPAlertViewController.h"
#import "YPAlertviewTransitionEasyIn.h"
#import "YPAlertviewTransitionEasyOut.h"

@interface YPAlertViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation YPAlertViewController

#pragma mark - Life Cycle

- (instancetype)init{
    if (self = [super init]) {
        self.transitioningDelegate = self;
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        self.touchDismiss = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

}

#pragma - 
+ (instancetype)alertView:(UIView *)view {
    NSParameterAssert(view);
    YPAlertViewController *alertViewController = [[YPAlertViewController alloc] init];
    alertViewController.alertView = view;
    [alertViewController.view addSubview:view];
    view.center = CGPointMake(CGRectGetMidX([UIScreen mainScreen].bounds), CGRectGetMidY([UIScreen mainScreen].bounds));
    alertViewController.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    return alertViewController;
}

#pragma mark - Transition Delegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[YPAlertviewTransitionEasyIn alloc] init];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[YPAlertviewTransitionEasyOut alloc] init];
}

- (void)setTouchDismiss:(BOOL)touchDismiss {
    _touchDismiss = touchDismiss;
    if (touchDismiss) {
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction:)];
        [self.view addGestureRecognizer:tapGesture];
    }
}

- (void)tapGestureAction:(UITapGestureRecognizer *)tapGesture {
    if (self.touchDismiss) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
