//
//  NSDictionary+YPDictionary.m
//  YPKit
//
//  Created by  yeyongping on 15/2/16.
//  Copyright © 2015年  yeyongping. All rights reserved.
//
#import "NSDictionary+YPDictionary.h"

@implementation NSDictionary (YPDictionary)

- (NSDictionary *(^)(NSDictionary *))extend {
    return ^NSDictionary *(NSDictionary *key) {
        if (!key) {
            return self;
        }
        NSMutableDictionary *dicTemp = self.mutableCopy;
        [dicTemp addEntriesFromDictionary:key];
        return dicTemp.copy;
    };
}
//FIXME: 这个方法暂时不要使用 还有多参数问题没有解决
- (NSDictionary *(^)(NSString *, ...))pick {
    return ^(NSString *arg0, ...) {
        va_list args;
        va_start(args, arg0);
        NSMutableArray *keys = [NSMutableArray array];
        NSMutableArray *objs = [NSMutableArray array];
        
        for (NSString *key = arg0; key != nil; key = va_arg(args, NSString *)) {
            NSLog(@"key = %@",key);
            id obj = self[key];
            if (obj) {
                [keys addObject:key];
                [objs addObject:obj];
            }
        }
        NSLog(@"");
        va_end(args);
        return [NSDictionary dictionaryWithObjects:objs forKeys:keys];
    };
}

- (NSArray *)toArray {
    NSMutableArray *arrm = [NSMutableArray array];
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [arrm addObject:@[key,obj]];
    }];
    return arrm.copy;
}

@end
