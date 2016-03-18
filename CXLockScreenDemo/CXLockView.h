//
//  CXLockView.h
//  CXLockScreenDemo
//
//  Created by 王长旭 on 16/3/17.
//  Copyright © 2016年 王长旭. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,LockMode){
    LockModeSet,
    LockModeUnlock
};

@protocol CXLockViewDelegate <NSObject>
- (void) setPasswordFinished;
- (BOOL) isPasswordMatch:(BOOL)flag;
@end

@interface CXLockView : UIView
@property (assign, nonatomic) LockMode mode;
@property (nonatomic, weak) id<CXLockViewDelegate> delegate;
@end



