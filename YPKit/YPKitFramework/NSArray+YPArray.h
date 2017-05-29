//
//  NSArray+YPArray.h
//  YPKit
//
//  Created by  yeyongping on 15/2/16.
//  Copyright © 2015年  yeyongping. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark -
@interface NSArray (YPArray)
#pragma mark 拼接数组
- (NSArray *(^)(NSArray *))concat;
#pragma mark 递归展开数组
- (NSArray *)flatten;
#pragma mark 倒序排列数组
- (NSArray *)reverse;
@end


@interface NSArray (YPAll)
#pragma mark 判断数组每一个元素
//可以直接传一个类取判断是否是这个类
- (BOOL(^)(id $0))all;
@end


@interface NSArray (YPAny)
#pragma mark 判断数组任意一个元素
//同样可以传一个类型 进行判断
- (BOOL(^)(id $0))any;
@end


@interface NSArray (YPEach)
#pragma mark Each
//可以接受1~3个参数 (第一个是数组的元素,第二个是数组的index,第三个是数组本身)
- (NSArray *(^)(id yp_block))each;
@end


@interface NSArray (YPMap)
#pragma mark - map 函数
- (NSArray *(^)(id block))map;
@end


@interface NSArray (YPReduce)
#pragma mark Reduce 函数
- (id(^(^)(id memo))(id(^)(id $0,id $1)))reduce;
@end


@interface NSArray (YPFliter)
#pragma mark Fliter 函数
- (NSArray *(^)(id $0))fliter;
@end

@interface NSArray (YPFlatMap)
#pragma mark Flatmap 函数
- (NSArray *(^)(NSArray *(^)(id $0)))flatMap;
@end


#pragma mark - 切片函数
@interface NSArray (YPSlice)
- (NSArray *(^)(NSUInteger start, NSUInteger length))slice;
@end

@interface NSArray (YPJoin)
- (NSString *(^)(NSString *))join;
@end

#pragma mark -
@interface NSMutableArray (YPArray)
- (void)appendObject:(id)anObject;
- (void)prependObject:(id)anObject;
- (void)appendObjects:(NSArray *)objects;
- (void)prependObjects:(NSArray *)objects;
- (void)insertObjects:(NSArray *)objects atIndex:(NSUInteger)index;

- (id)pop;
- (instancetype (^)(id obj))push;
@end
