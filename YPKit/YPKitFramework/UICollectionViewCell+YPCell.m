//
//  UICollectionViewCell+YPCell.m
//  YPKit
//
//  Created by  yeyongping on 15/2/16.
//  Copyright © 2015年  yeyongping. All rights reserved.
//
#import "UICollectionViewCell+YPCell.h"

@implementation UICollectionViewCell (YPCell)

+ (UINib *)nib{
    return  [UINib nibWithNibName:[NSString stringWithUTF8String:object_getClassName(self) ] bundle:nil];
}


@end
