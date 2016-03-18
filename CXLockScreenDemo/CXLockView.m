//
//  CXLockView.m
//  CXLockScreenDemo
//
//  Created by 王长旭 on 16/3/17.
//  Copyright © 2016年 王长旭. All rights reserved.
//

#import "CXLockView.h"
@interface CXLockView()
@property (strong, nonatomic) NSMutableArray *buttonArray;
@property (strong, nonatomic) NSMutableString *password;
@end


@implementation CXLockView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

- (void) setup{
    self.backgroundColor = [UIColor clearColor];
    self.buttonArray = [NSMutableArray array];
    [self setupButton];
}

- (void) setupButton{
    
    for (int i = 0; i < 9 ; i ++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [button setBackgroundImage:[UIImage imageNamed:@"circle_grey"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"circle_yellow"] forState:UIControlStateSelected];
        
        button.tag = i;
        button.adjustsImageWhenHighlighted = NO;
        button.userInteractionEnabled = NO;
        
        [self addSubview:button];
        
    }
}

-(void)layoutSubviews{
    int const col = 3;
    int const row = 3;
    
    float width = 80.f;
    float height = 80.f;
    
    float margin = (self.frame.size.width - (col * width)) / (col + 1);
    
    for (int jRow = 0; jRow < row; jRow++) {
        for (int iCol = 0; iCol < col; iCol++) {
            UIButton * button = [self.subviews objectAtIndex:(iCol + jRow * col)];
            button.frame = CGRectMake(margin + iCol * (margin + width), margin + jRow * (margin + height), width, height);
        }
    }
}

- (UIButton *) getButtonFromPoint:(CGPoint) point{
    for (UIButton *button in self.subviews) {
        if (CGRectContainsPoint(button.frame, point)) {
            return button;
        }
    }
    return nil;
}

- (void) reset{
    for (UIButton *button in self.subviews) {
        button.selected = NO;
    }
    [self.buttonArray removeAllObjects];
    
    [self setNeedsDisplay];
    
    if (self.mode == LockModeSet) {
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [user setObject:self.password forKey:@"password"];
        if ([self.delegate respondsToSelector:@selector(setPasswordFinished)]) {
            [self.delegate setPasswordFinished];
        }
    }else if(self.mode == LockModeUnlock){
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        NSString * password = [user objectForKey:@"password"];
        if ([password isEqualToString:self.password]) {
            if ([self.delegate respondsToSelector:@selector(isPasswordMatch:)]) {
                [self.delegate isPasswordMatch:YES];
            }
        }else{
            NSLog(@"密码不匹配");
        }
    }
}

- (void)getPassword{
    self.password = [NSMutableString string];
    for (UIButton *button in self.buttonArray) {
        [self.password appendString:[NSString stringWithFormat:@"%d",(int)button.tag]];
    }
    NSLog(@"%@",self.password);
}

#pragma mark - touch
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    
    CGPoint point = [touch locationInView:self];
    
    UIButton *button = [self getButtonFromPoint:point];
    
    if (button) {
        button.selected = YES;
        [self.buttonArray addObject:button];
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    
    CGPoint point = [touch locationInView:self];
    
    UIButton *button = [self getButtonFromPoint:point];
    
    if (button && button.selected != YES) {
        button.selected = YES;
        [self.buttonArray addObject:button];
    }
    
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self getPassword];
    [self reset];
}


-(void)drawRect:(CGRect)rect{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    path.lineWidth = 5.f;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    
    if (self.buttonArray.count) {
        
        
        for (int i = 0;  i < self.buttonArray.count; i++) {
            UIButton *button = self.buttonArray[i];
            if (0 == i) {
                [path moveToPoint:button.center];
            }else{
                [path addLineToPoint:button.center];
            }
        }
        [[UIColor redColor] set];
        [path stroke];
        
    }
}


@end
