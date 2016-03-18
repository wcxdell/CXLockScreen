//
//  ViewController.m
//  CXLockScreenDemo
//
//  Created by 王长旭 on 16/3/17.
//  Copyright © 2016年 王长旭. All rights reserved.
//

#import "ViewController.h"
#import "CXLockViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton * setPassBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [setPassBtn setTitle:@"设置密码" forState:UIControlStateNormal];
    setPassBtn.frame = CGRectMake(200, 100, 100, 100);
    [setPassBtn addTarget:self action:@selector(touch1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:setPassBtn];
    
    UIButton * UnlockBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [UnlockBtn setTitle:@"解锁" forState:UIControlStateNormal];
    UnlockBtn.frame = CGRectMake(200, 300, 100, 100);
    [UnlockBtn addTarget:self action:@selector(touch2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:UnlockBtn];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) touch1{
    CXLockViewController *vc = [[CXLockViewController alloc] init];
    vc.mode = LockModeSet;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void) touch2{
    CXLockViewController *vc = [[CXLockViewController alloc] init];
    vc.mode = LockModeUnlock;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
