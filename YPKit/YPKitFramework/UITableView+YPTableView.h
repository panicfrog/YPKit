//
//  UITableView+YPTableView.h
//  YPKit
//
//  Created by  yeyongping on 15/2/16.
//  Copyright © 2015年  yeyongping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (YPTableView)

+ (UITableView *(^)(CGRect,UITableViewStyle))creatWithFrameAndStype_yp;
- (UITableView *(^)(id<UITableViewDelegate>))deledate_yp;
- (UITableView *(^)(id<UITableViewDataSource>))dataSource_yp;
- (UITableView *(^)(Class,NSString *))registerClass_yp;
- (UITableView *(^)(UINib *,NSString *))registerNib_yp;
- (UITableView *(^)(Class,NSString *))registerHeaderFooterClass_yp;
- (UITableView *(^)(UINib *,NSString *))registerHeaderFooterNib_yp;
- (UITableViewCell *(^)(NSIndexPath *))cellForRowAtIndexPath_yp;
@end
