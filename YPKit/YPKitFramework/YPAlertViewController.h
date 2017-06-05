//
//  YPAlertViewController.h
//  Rippton
//
//  Created by yeyongping on 2017/6/4.
//  Copyright © 2017年 Rippton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YPAlertViewController : UIViewController

@property (weak, nonatomic) UIView *alertView;
//点击背景dismiss掉
@property (assign, nonatomic) BOOL touchDismiss;
+ (instancetype)alertView:(UIView *)view;
@end
