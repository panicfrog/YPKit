//
//  UICollectionView+YPCollectionView.h
//  YPKit
//
//  Created by  yeyongping on 15/2/16.
//  Copyright © 2015年  yeyongping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (YPCollectionView)

+ (instancetype)collectionViewWithFlowlayout:(UICollectionViewFlowLayout *)l2FlowLayout
                                       frame:(CGRect)frame
                                    delegate:(NSObject <UICollectionViewDelegate>*)delegate
                                  dataSource:(NSObject <UICollectionViewDataSource>*)dataSource;

@end
