//
//  UITextView+YPTextView.m
//  YPTextView
//
//  Created by  yeyongping on 15/3/28.
//  Copyright © 2015年  yeyongping. All rights reserved.
//

#import "UITextView+YPTextView.h"

static const CGFloat textViewPadding = 16;

@implementation UITextView (YPTextView)


- (CGFloat)hightForAutoFit{
    CGSize fitSize = [self sizeThatFits:CGSizeMake(CGRectGetWidth(self.bounds), MAXFLOAT)];
    return fitSize.height;
    
}

- (CGFloat(^)(CGFloat))heightForTextWidth{
    return ^(CGFloat width) {
        return self.heightForStringAndWidth(self.text,width);
    };
}

- (CGFloat(^)(NSString *,CGFloat))heightForStringAndWidth {
    return ^(NSString *string, CGFloat width) {
        NSAttributedString *attributstring = [[NSAttributedString alloc] initWithString:string];
        NSRange range = NSMakeRange(0, attributstring.length);
        NSDictionary *dic = [attributstring attributesAtIndex:0 effectiveRange:&range];
        CGRect stringRect = [string boundingRectWithSize:CGSizeMake(width - textViewPadding, MAXFLOAT)
                                                 options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                                              attributes:dic context:nil];
        return CGRectGetHeight(stringRect) + textViewPadding;
    };
}

@end
