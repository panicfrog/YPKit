//
//  YPSlider.h
//  Rippton
//
//  Created by yeyongping on 2017/6/3.
//  Copyright © 2017年 Rippton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YPSlider : UIScrollView

+ (instancetype)sliderWithFrame:(CGRect)frame sliderToRight:(void(^)(BOOL isRight))sliderHandle;
@end
