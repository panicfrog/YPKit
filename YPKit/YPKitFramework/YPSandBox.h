//
//  YPSandBox.h
//  Rippton
//
//  Created by yeyongping on 2017/6/6.
//  Copyright © 2017年 Rippton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YPSandBox : NSObject

#pragma mark -
+ (NSString *)homeDirectory;

+ (NSString *)documentsDirectory;
+ (NSString *)libraryDirectory;
+ (NSString *)catchesDirectory;

+ (NSString *)temDirectory;

#pragma mark -
#pragma mark 在Document文件夹中读取数据
+ (NSData *)readFileFromDocumentPath:(NSString *)suffixPath;
#pragma mark 在Document文件夹中写入数据
+ (void)writeFile:(NSData *)data documentSuffixPath:(NSString *)suffixPath;

@end
