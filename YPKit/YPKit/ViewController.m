//
//  ViewController.m
//  YPKit
//
//  Created by  fireFrog on 2017/5/29.
//  Copyright © 2017年 D8Ge_yeyongping. All rights reserved.
//

#import "ViewController.h"
#import "YPKit.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = UITableView.creatWithFrameAndStype_yp(CGRectMake(0,100,100,100),UITableViewStylePlain)
    .deledate_yp(self)
    .dataSource_yp(self)
    .registerClass_yp(UITableViewCell.class_yp,@"identifier");
    
    UIButton *button = UIButton.creatWithFrame_yp(CGRectMake(20, 50, 200, 40))
    .nomalBackgroundColor_yp(UIColor.redColor)
    .highlightBackgroundColor_yp(UIColor.blueColor)
    .nomalTitle_yp(@"NomalTitle")
    .highlightTitle_yp(@"HighlightedTitle");
    [self.view addSubview:button];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = tableView.cellForRowAtIndexPath_yp(indexPath);
    return cell;
}


@end
