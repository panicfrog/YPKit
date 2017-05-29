//
//  NSString+YPString.m
//  YPKit
//
//  Created by  yeyongping on 15/2/16.
//  Copyright © 2015年  yeyongping. All rights reserved.
//

#import "NSString+YPString.h"

@implementation NSString (YPString)

- (NSAttributedString *)htmlString{
    NSError *error;
    NSAttributedString *htmlAttributedString = [[NSAttributedString alloc] initWithData:[self dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:&error];
    NSAssert(!error, nil);
    return htmlAttributedString;
}

- (NSString *)filterEmpty{
    if ([self isEqualToString:@"null"] || [self isEqualToString:@"nil"] || !self || [self isEqualToString:@"(null)"]) {
        return @"";
    } else {
        return self;
    }
}

- (NSString *(^(^)(NSString *))(NSString *))concat {
    return ^(NSString *sepeartor) {
        return ^(NSString *appendString) {
            return [NSString stringWithFormat:@"%@%@%@",self,sepeartor,appendString];
        };
    };
}


- (CGFloat)heightForWidth:(CGFloat)width {
    return [self sizeForWidth:width].height;
}

- (CGSize)sizeForWidth:(CGFloat)width {
    NSAttributedString *attributStr = [[NSAttributedString alloc]initWithString:self];
    NSRange range = NSMakeRange(0, attributStr.length);
    NSDictionary *dic = [attributStr attributesAtIndex:0 effectiveRange:&range];
    CGRect stringRect = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil];
    return stringRect.size;
}

@end
