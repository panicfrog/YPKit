//
//  NSArray+YPArray.m
//  YPKit
//
//  Created by  yeyongping on 15/2/16.
//  Copyright © 2015年  yeyongping. All rights reserved.
//

#import "NSArray+YPArray.h"
#import <objc/runtime.h>

extern NSMethodSignature *YPMethodSignature(id);
extern int YPArgCount(id);

#define YPISMetaClass(arg) class_isMetaClass(object_getClass(arg))

@implementation NSArray (YPArray)

- (NSArray *(^)(NSArray *))concat {
    return ^(NSArray *other_array) {
        return [self arrayByAddingObjectsFromArray:other_array];
    };
}

- (NSArray *)flatten {
    NSMutableArray *arrm = [NSMutableArray array];
    for (id objc in self) {
        if ([objc isKindOfClass:[NSArray class]]) {
            [arrm addObjectsFromArray:[objc flatten]];
        } else {
            [arrm addObject:objc];
        }
    }
    return arrm.copy;
}

- (NSArray *)reverse {
    NSMutableArray *arrm = self.mutableCopy;
    NSUInteger const count = self.count;
    NSUInteger const midIdx = count / 2;
    for (NSUInteger i = 0; i < midIdx; ++i) {
        id tmp = arrm[i];
        arrm[i] = arrm[count - i - 1];
        arrm[count - i - 1] = tmp;
    }
    return arrm;
}
@end

@implementation NSArray (YPAll)
- (BOOL(^)(id $0))all {
    return ^(id arg){
        BOOL (^block)(id $0) = nil;
        
        if (arg == NSString.class /*or segfaults!*/ || YPISMetaClass(arg)) {
            Class cls = arg;
            block = ^(id $0){
                return [$0 isKindOfClass:cls];
            };
        } else {
            switch ([YPMethodSignature(arg) getArgumentTypeAtIndex:1][0]) {
                case 'c': { block = ^(id $0){ return ((BOOL(^)(char))arg)([$0 charValue]); }; break; }
                case 'i': { block = ^(id $0){ return ((BOOL(^)(int))arg)([$0 intValue]); }; break; }
                case 's': { block = ^(id $0){ return ((BOOL(^)(short))arg)([$0 shortValue]); }; break; }
                case 'l': { block = ^(id $0){ return ((BOOL(^)(long))arg)([$0 longValue]); }; break; }
                case 'q': { block = ^(id $0){ return ((BOOL(^)(long long))arg)([$0 longLongValue]); }; break; }
                case 'C': { block = ^(id $0){ return ((BOOL(^)(unsigned char))arg)([$0 unsignedCharValue]); }; break; }
                case 'I': { block = ^(id $0){ return ((BOOL(^)(unsigned))arg)([$0 unsignedIntValue]); }; break; }
                case 'S': { block = ^(id $0){ return ((BOOL(^)(unsigned short))arg)([$0 unsignedShortValue]); }; break; }
                case 'L': { block = ^(id $0){ return ((BOOL(^)(unsigned long))arg)([$0 unsignedLongValue]); }; break; }
                case 'Q': { block = ^(id $0){ return ((BOOL(^)(unsigned long long))arg)([$0 unsignedLongLongValue]); }; break; }
                case 'f': { block = ^(id $0){ return ((BOOL(^)(float))arg)([$0 floatValue]); }; break; }
                case 'd': { block = ^(id $0){ return ((BOOL(^)(double))arg)([$0 doubleValue]); }; break; }
                case 'B': { block = ^(id $0){ return ((BOOL(^)(BOOL))arg)([$0 boolValue]); }; break; }
                default:
                    block = arg;
                    break;
            }
        }
        
        for (id $0 in self) {
            if (!block($0)) {
                return NO;
            }
        }
        return YES;
    };
}
@end

@implementation NSArray (YPAny)

- (BOOL(^)(id $0))any {
    return ^(id arg) {
        BOOL (^block)(id $0) = nil;
        
        if (arg == NSString.class || YPISMetaClass(arg)) {
            Class cls = arg;
            block = ^(id $0) {
                return [$0 isKindOfClass:cls];
            };
        } else { block = arg; }
        
        for (id $0 in self) {
            if (block($0)) { return YES; }
        }
        return NO;
    };
}
@end


@implementation NSArray (YPEach)

- (NSArray *(^)(id))each {
    return ^(id eachBlock) {
        NSMethodSignature *sig = YPMethodSignature(eachBlock);
        void (^block)(id, NSUInteger) = ^{
            switch (sig.numberOfArguments){
                case 2: return ^(id a, NSUInteger idx){ ((void(^)(id))eachBlock)(a); };
                case 3:
                    return [sig getArgumentTypeAtIndex:2][0] == '@'
                    ? ^(id a, NSUInteger idx){ ((void(^)(id, id))eachBlock)(a, @(idx)); }
                    : ^(id a, NSUInteger idx){ ((void(^)(id, NSUInteger))eachBlock)(a, idx); };
                case 4:
                    return [sig getArgumentTypeAtIndex:2][0] == '@'
                    ? ^(id a, NSUInteger idx){ ((void(^)(id, id, id))eachBlock)(a, @(idx), self); }
                    : ^(id a, NSUInteger idx){ ((void(^)(id, NSUInteger, id))eachBlock)(a, idx, self); };
                default:
                    @throw @"each 方法参数无效";
            }
        }();
        
        NSUInteger index = 0;
        for (id obj in self)
            block(obj, index++);
        return self;
    };
}

@end


@implementation NSArray (YPMap)
- (NSArray *(^)(id))map {
    return ^id(id mapBlock) {
        NSMethodSignature *signature = YPMethodSignature(mapBlock);
        id (^block)(id, NSUInteger) = ^{
            switch (signature.numberOfArguments){
                case 2: return ^(id obj, NSUInteger idx){ return ((id(^)(id))mapBlock)(obj); };
                case 3:
                    return [signature getArgumentTypeAtIndex:2][0] == '@'
                    ? ^(id obj, NSUInteger idx){ return ((id(^)(id, id))mapBlock)(obj, @(idx)); }
                    : ^(id obj, NSUInteger idx){ return ((id(^)(id, NSUInteger))mapBlock)(obj, idx); };
                case 4:
                    return [signature getArgumentTypeAtIndex:2][0] == '@'
                    ? ^(id obj, NSUInteger idx){ return ((id(^)(id, id, id))mapBlock)(obj, @(idx), self); }
                    : ^(id obj, NSUInteger idx){ return ((id(^)(id, NSUInteger, id))mapBlock)(obj, idx, self); };
                default:
                    @throw @"map 参数错误";
            }
        }();
        
        id mapped[self.count];
        NSUInteger index = 0;
        NSInteger index_in = 0;
        for (id mappable in self) {
            id objc = block(mappable, index++);
            if (objc)
                mapped[index_in++] = objc;
        }
        return [NSArray arrayWithObjects:mapped count:index_in];
    };
    
}
@end


@implementation NSArray (YPFlatMap)

- (NSArray *(^)(NSArray *(^)(id)))flatMap {
    return ^(NSArray *(^flatMapBlock)(id $0)) {
        NSMutableArray *resultArrm = [NSMutableArray array];
        for (id $0 in self) {
            NSArray *result = flatMapBlock($0);
            if (result) {
                [resultArrm addObjectsFromArray:result];
            }
        }
        return resultArrm;
    };
}

@end

@implementation NSArray (YPSlice)

- (NSArray *(^)(NSUInteger, NSUInteger))slice {
    return ^id(NSUInteger start, NSUInteger length) {
        NSUInteger const count = self.count;
        if ( 0 == count) {
            return self;
        }
        if (start > count - 1) { start = count - 1; }
        if (start + length > count) { length = count - start; }
        return [self subarrayWithRange:NSMakeRange(start, length)];
    };
}
@end


@implementation NSArray (YPReduce)

- (id (^(^)(id))(id (^)(id, id)))reduce {
    return ^(id memo) {
        return ^(id (^reduceBlock)(id,id)) {
            id memoTem = memo;
            for (id obj in self.slice(0,self.count)) {
                memoTem = reduceBlock(memoTem,obj);
            }
            return memoTem;
        };
    };
}

@end

@implementation NSArray (YPFliter)

- (NSArray *(^)(id))fliter {
    return ^(BOOL(^fliterBlock)(id)){
        NSMutableArray *arrm = [NSMutableArray array];
        for (id objc in self) {
            if (fliterBlock(objc)) {
                [arrm addObject:objc];
            }
        }
        return arrm.copy;
    };
}

@end

@implementation NSArray (YPJoin)

- (NSString *(^)(NSString *))join {
    return ^(NSString *separator) {
        return  [self componentsJoinedByString:separator ?: @""];
    };
}

/*
 
 'NSArray *(^)(NSString *__strong)' 
 'NSString *(^)(NSString *__strong)'
 */

@end


@implementation NSMutableArray (YPArray)
- (void)appendObject:(id)anObject {
    [self addObject:anObject];
}

- (void)prependObject:(id)anObject {
    [self insertObject:anObject atIndex:0];
}

- (void)appendObjects:(NSArray *)objects {
    if (!objects) return;
    [self addObjectsFromArray:objects];
}

- (void)prependObjects:(NSArray *)objects {
    if (!objects) return;
    NSUInteger i = 0;
    for (id obj in objects) {
        [self insertObject:obj atIndex:i++];
    }
}

- (void)insertObjects:(NSArray *)objects atIndex:(NSUInteger)index {
    NSUInteger i = index;
    for (id obj in objects) {
        [self insertObject:obj atIndex:i++];
    }
}

- (id)pop {
    if (self.count) {
        NSUInteger lastIndex = self.count - 1;
        id objc = self[lastIndex];
        [self removeObjectAtIndex:lastIndex];
        return objc;
    } else {
        return nil;
    }
}

- (instancetype (^)(id))push {
    return ^(id objc){
        if (objc) [self addObject:objc];
        return self;
    };
}

@end
