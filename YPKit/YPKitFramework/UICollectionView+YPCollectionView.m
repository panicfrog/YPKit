//
//  UICollectionView+YPCollectionView.m
//  YPKit
//
//  Created by  yeyongping on 15/2/16.
//  Copyright © 2015年  yeyongping. All rights reserved.
//

#import "UICollectionView+YPCollectionView.h"

@implementation UICollectionView (YPCollectionView)

//创建
+ (UICollectionView *(^)(CGRect frame, UICollectionViewFlowLayout *))creatWithFrameAndLayout_yp{
    return ^(CGRect frame, UICollectionViewFlowLayout *layout){
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
        return collectionView;
    };
}


//Delegate
- (UICollectionView *(^)(id<UICollectionViewDelegate>))delegate_yp {
    return ^(id <UICollectionViewDelegate>deledate) {
        self.delegate = deledate;
        return self;
    };
}

- (UICollectionView *(^)(id<UICollectionViewDataSource>))dataSource_yp {
    return ^(id<UICollectionViewDataSource>dataSource) {
        self.dataSource = dataSource;
        return self;
    };
}


//Register
- (UICollectionView *(^)(Class,NSString *))registerClassAndIdentifier_yp {
    return ^(Class class, NSString * identifier) {
        [self registerClass:class forCellWithReuseIdentifier:identifier];
        return self;
    };
}

- (UICollectionView *(^)(Class,NSString *,NSString *))registerClassAndViewKindAndIdentifier_yp {
    return ^(Class class, NSString *viewKind, NSString *identifier) {
        [self registerClass:class forSupplementaryViewOfKind:viewKind withReuseIdentifier:identifier];
        return self;
    };
}

- (UICollectionView *(^)(UINib *,NSString *))registerNibAndIdentifier_yp {
    return ^(UINib *nib, NSString *identifier) {
        [self registerNib:nib forCellWithReuseIdentifier:identifier];
        return self;
    };
}

- (UICollectionView *(^)(UINib *,NSString *,NSString *))registerNibAndViewKindAndIdentifier_yp {
    return ^(UINib *nib, NSString *viewKind, NSString *identifier) {
        [self registerNib:nib forSupplementaryViewOfKind:viewKind withReuseIdentifier:identifier];
        return self;
    };
}


//Cell At IndexPath
- (UICollectionView *(^)())cellForItemAtIndexPath_yp {
    return ^(NSIndexPath *indexPath) {
        [self cellForItemAtIndexPath:indexPath];
        return self;
    };
}
@end
