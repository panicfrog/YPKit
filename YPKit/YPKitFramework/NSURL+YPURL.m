//
//  NSURL+YPURL.m
//  YPKit
//
//  Created by  fireFrog on 2017/6/2.
//  Copyright © 2017年 D8Ge_yeyongping. All rights reserved.
//

#import "NSURL+YPURL.h"

@implementation NSURL (YPURL)

- (NSDictionary *)params {
    NSMutableDictionary *__block dicM = [NSMutableDictionary dictionary];
    [[self.query componentsSeparatedByString:@"&"] enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *key = [obj componentsSeparatedByString:@"="].firstObject;
        NSString *value = [obj componentsSeparatedByString:@"="].lastObject;
        [dicM setObject:value forKey:key];
    }];
    return dicM.copy;
}

@end
