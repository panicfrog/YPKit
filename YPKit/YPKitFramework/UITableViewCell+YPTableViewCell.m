//
//  UITableViewCell+YPTableViewCell.m
//  YPKit
//
//  Created by  yeyongping on 15/2/16.
//  Copyright © 2015年  yeyongping. All rights reserved.
//

#import "UITableViewCell+YPTableViewCell.h"

@implementation UITableViewCell (YPTableViewCell)

+ (UINib *)nib{
    return [UINib nibWithNibName:[NSString stringWithUTF8String:object_getClassName(self)] bundle:nil];
}
+ (Class)class_yp {
    return [self class];
}

@end
