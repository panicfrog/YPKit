//
//  UITableView+YPTableView.m
//  YPKit
//
//  Created by  yeyongping on 15/2/16.
//  Copyright © 2015年  yeyongping. All rights reserved.
//

#import "UITableView+YPTableView.h"

@implementation UITableView (YPTableView)

- (UITableView *(^)(id<UITableViewDelegate>))deledate_yp {
    return ^(id <UITableViewDelegate> deledate) {
        self.delegate = deledate;
        return self;
    };
}

- (UITableView *(^)(id<UITableViewDataSource>))dataSource_yp {
    return ^(id <UITableViewDataSource> dataSource) {
        self.dataSource = dataSource;
        return self;
    };
}

+ (UITableView *(^)(CGRect,UITableViewStyle))creatWithFrameAndStype_yp{
    return ^(CGRect frame, UITableViewStyle style) {
        return [[self alloc] initWithFrame:frame style:style];
    };
}

- (UITableView *(^)(Class,NSString *))registerClass_yp {
    return ^(Class class, NSString * identifier) {
        [self registerClass:class forCellReuseIdentifier:identifier];
        return self;
    };
}

- (UITableView *(^)(Class,NSString *))registerHeaderFooterClass_yp {
    return ^(Class class, NSString *identifier) {
        [self registerClass:class forHeaderFooterViewReuseIdentifier:identifier];
        return self;
    };
}

- (UITableView *(^)(UINib *,NSString *))registerNib_yp {
    return ^(UINib *nib, NSString *identifier) {
        [self registerNib:nib forCellReuseIdentifier:identifier];
        return self;
    };
}

- (UITableView *(^)(UINib *,NSString *))registerHeaderFooterNib_yp {
    return ^(UINib *nib, NSString *identifier) {
        [self registerNib:nib forHeaderFooterViewReuseIdentifier:identifier];
        return self;
    };
}

- (UITableViewCell *(^)(NSIndexPath *))cellForRowAtIndexPath_yp {
    return ^(NSIndexPath *indexPath) {
        return [self cellForRowAtIndexPath:indexPath];
    };
}

@end
