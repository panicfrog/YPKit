//
//  NSString+YPString.h
//  YPKit
//
//  Created by  yeyongping on 15/2/16.
//  Copyright © 2015年  yeyongping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (YPString)

- (NSAttributedString *)htmlString;
- (NSString *)filterEmpty;
- (NSString *(^(^)(NSString *))(NSString *))concatSep;
- (NSString *(^)(NSString *))concat;

- (CGFloat)heightForWidth:(CGFloat)width;
- (CGSize)sizeForWidth:(CGFloat)width;
@end
