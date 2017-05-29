//
//  UIImage+YPImage.m
//  YPKit
//
//  Created by  yeyongping on 15/2/16.
//  Copyright © 2015年  yeyongping. All rights reserved.
//

#import "UIImage+YPImage.h"

@implementation UIImage (YPImage)

- (instancetype)clipOvalWithRect:(CGRect)rect{

    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0);
    [[UIBezierPath bezierPathWithOvalInRect:rect] addClip];
    [self drawInRect:rect];
    UIImage *ovalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return ovalImage;
}

@end
