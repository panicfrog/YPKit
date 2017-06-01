//
//  ViewController.m
//  LinkedinWebViewDemo
//
//  Created by  fireFrog on 2017/6/1.
//  Copyright © 2017年 D8Ge_yeyongping. All rights reserved.
//

#import "ViewController.h"
#import "LinkedinLoginViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

- (IBAction)pushButton:(id)sender {
    [self presentViewController:[[LinkedinLoginViewController alloc] init]animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
