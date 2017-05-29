//
//  NSDictionary+YPDictionary.h
//  YPKit
//
//  Created by  yeyongping on 15/2/16.
//  Copyright © 2015年  yeyongping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (YPDictionary)

//优先自己,如果key重复了,用自己的覆盖其他的
- (NSDictionary *(^)(NSDictionary *precendenceDictionary))extend;
//选出固定的key所对应的值放到新的字典中
//FIXME: 这个方法暂时不要使用 还有多参数问题没有解决
//- (NSDictionary *(^)(NSString *key,...))pick;
#pragma mark 将字典展平成一个数组
- (NSArray *)toArray ;
@end
