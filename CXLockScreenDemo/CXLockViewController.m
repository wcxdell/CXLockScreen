//
//  CXLockViewController.m
//  CXLockScreenDemo
//
//  Created by 王长旭 on 16/3/17.
//  Copyright © 2016年 王长旭. All rights reserved.
//

#import "CXLockViewController.h"

#define deviceWidth [UIScreen mainScreen].bounds.size.width
#define deviceHeight [UIScreen mainScreen].bounds.size.height
@interface CXLockViewController()<CXLockViewDelegate>
@end
@implementation CXLockViewController

-(void)viewDidLoad{
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    CXLockView *lockView = [[CXLockView alloc] initWithFrame:CGRectMake(0, 0, deviceWidth, deviceWidth)];
    lockView.center = self.view.center;
    lockView.delegate = self;
    lockView.mode = self.mode;
    [self.view addSubview:lockView];
}

- (void) setPasswordFinished{
    NSLog(@"设置密码成功");
    [self.navigationController popViewControllerAnimated:YES];
}
- (void) isPasswordMatch:(BOOL) flag{
    if (!flag) return;
    NSLog(@"解锁成功");
    [self.navigationController popViewControllerAnimated:YES];
}





@end
