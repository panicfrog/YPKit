//
//  YPSandBox.m
//  Rippton
//
//  Created by yeyongping on 2017/6/6.
//  Copyright © 2017年 Rippton. All rights reserved.
//

#import "YPSandBox.h"

@implementation YPSandBox

+ (NSString *)homeDirectory {
    return NSHomeDirectory();
}


+ (NSString *)documentsDirectory {
    return  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
}
+ (NSString *)libraryDirectory {
    return NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).firstObject;
}
+ (NSString *)catchesDirectory {
    return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
}


+ (NSString *)temDirectory {
    return NSTemporaryDirectory();
}


+ (NSData *)readFileFromDocumentPath:(NSString *)suffixPath {
    return [NSData dataWithContentsOfFile:[self documentsDirectory].concatSep(@"/")(suffixPath)];
}
+ (BOOL)writeFile:(NSData *)data documentSuffixPath:(NSString *)suffixPath {
    return [data writeToFile:[self documentsDirectory].concatSep(@"/")(suffixPath) atomically:YES];
}


+ (void)removeDocumentFile:(NSString *)suffixPath error:(NSError *)error{
    [[NSFileManager defaultManager] removeItemAtPath:[self documentsDirectory].concatSep(@"/")(suffixPath) error:&error];
}

@end

