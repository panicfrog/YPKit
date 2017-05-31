//
//  UICollectionView+YPCollectionView.h
//  YPKit
//
//  Created by  yeyongping on 15/2/16.
//  Copyright © 2015年  yeyongping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (YPCollectionView)

#pragma mark -
+ (UICollectionView *(^)(CGRect frame, UICollectionViewFlowLayout *))creatWithFrameAndLayout_yp;

#pragma mark -
- (UICollectionView *(^)(id<UICollectionViewDelegate>))delegate_yp;
- (UICollectionView *(^)(id<UICollectionViewDataSource>))dataSource_yp;

#pragma mark -
- (UICollectionView *(^)(Class,NSString *))registerClassAndIdentifier_yp;
- (UICollectionView *(^)(UINib *,NSString *))registerNibAndIdentifier_yp;
- (UICollectionView *(^)(Class,NSString *,NSString *))registerClassAndViewKindAndIdentifier_yp;
- (UICollectionView *(^)(UINib *,NSString *,NSString *))registerNibAndViewKindAndIdentifier_yp;

#pragma mark -
- (UICollectionView *(^)())cellForItemAtIndexPath_yp;


@end
