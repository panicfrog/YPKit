//
//  UIColor+YPColor.m
//  YPKit
//
//  Created by  yeyongping on 15/2/16.
//  Copyright © 2015年  yeyongping. All rights reserved.
//

#import "UIColor+YPColor.h"

@implementation UIColor (YPColor)

- (CGFloat)red{
    return  CGColorGetComponents(self.CGColor)[0];
}

- (CGFloat)green{
    return  CGColorGetComponents(self.CGColor)[1];
}

- (CGFloat)blue{
    return  CGColorGetComponents(self.CGColor)[2];
}

- (CGFloat)alphe{
    return  CGColorGetComponents(self.CGColor)[3];
}

- (UIImage *(^)(CGSize size))imageWithSize {
    return ^(CGSize size) {
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        UIGraphicsBeginImageContext(size);
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, self.CGColor);
        CGContextFillRect(context, rect);
        UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        return theImage;
    };
}
@end
