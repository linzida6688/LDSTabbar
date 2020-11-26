//
//  BaseTabbarView.m
//  HG_ShoppingMall
//
//  Created by Lindashuai on 2020/11/26.
//  Copyright © 2020 Lindashuai. All rights reserved.
//

#import "BaseTabbarView.h"

@interface BaseTabbarView ()

@property(nonatomic, strong) NSArray *selectList;
@property(nonatomic, strong) NSArray *normalList;
@property(nonatomic, strong) UIButton *lastItem; //上一个item

@property(nonatomic, strong) UIButton *firstBtn;
@property(nonatomic, strong) UIButton *centerBtn;
@property(nonatomic, strong) UIButton *endBtn;

@property(nonatomic, strong) UIView *hasMessageView;

@end

@implementation BaseTabbarView

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self addSubview:self.centerBtn];
        [self addSubview:self.firstBtn];
        [self addSubview:self.endBtn];
        [self selectInitindex];
        [self addSubview:self.hasMessageView];
        
    }
    return self;
}

- (void)selectInitindex { //设置初始化的index
    [[self btnArr] enumerateObjectsUsingBlock:^(UIButton *button, NSUInteger idx, BOOL *stop) {
        if(button.tag == kInitIndex) {
            button.selected = YES;
            self.lastItem = button;
            [self animationed:button];
        }
    }];
}

- (NSArray<UIButton *> *)btnArr {
    return @[self.firstBtn, self.centerBtn, self.endBtn];
}

- (NSArray *)selectList {
    if(_selectList == nil) {
        _selectList = @[@"Popular_select_icon",@"Match_select_icon",@"Message_select_icon"];
    }
    return _selectList;
}

- (NSArray *)normalList {
    if(_normalList == nil) {
        _normalList = @[@"Popular_normal_icon",@"Match_normal_icon",@"Message_normal_icon"];
    }
    return _normalList;
}

- (UIButton *)firstBtn {
    if(_firstBtn == nil) {
        _firstBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.centerBtn.frame) - [self centerOffset] - 50, CGRectGetMidY(self.centerBtn.frame) - 25, 50, 50)];
        _firstBtn.backgroundColor = LY_Color_HexAlpha(#CDD4DE, 0.5);
        _firstBtn.layer.cornerRadius = self.firstBtn.frame.size.height / 2;
        _firstBtn.layer.masksToBounds = YES;
        _firstBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        _firstBtn.layer.borderWidth = 3;
        [_firstBtn setImage:[UIImage imageNamed:self.normalList[0]] forState:UIControlStateNormal];
        [_firstBtn setImage:[UIImage imageNamed:self.selectList[0]] forState:UIControlStateSelected];
        [_firstBtn addTarget:self action:@selector(clickButtonItem:) forControlEvents:UIControlEventTouchUpInside];
        _firstBtn.backgroundColor = [UIColor yellowColor];
    }
    return _firstBtn;
}

- (UIButton *)centerBtn {
    if(_centerBtn == nil) {
        _centerBtn = [[UIButton alloc]initWithFrame:CGRectMake(- 34 + SCREEN_WIDTH / 2.0, - 34, 68, 68)];
        _centerBtn.backgroundColor = LY_Color_HexAlpha(#CDD4DE, 0.5);
        _centerBtn.layer.cornerRadius = self.centerBtn.frame.size.height / 2;
        _centerBtn.layer.masksToBounds = YES;
        _centerBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        _centerBtn.layer.borderWidth = 3;
        [_centerBtn setImage:[UIImage imageNamed:self.normalList[1]] forState:UIControlStateNormal];
        [_centerBtn setImage:[UIImage imageNamed:self.selectList[1]] forState:UIControlStateSelected];
        [_centerBtn addTarget:self action:@selector(clickButtonItem:) forControlEvents:UIControlEventTouchUpInside];
        _centerBtn.tag = BaseTabbarBtnType_Center;
        _centerBtn.backgroundColor = [UIColor orangeColor];
    }
    return _centerBtn;
}

- (UIButton *)endBtn {
    if(_endBtn == nil) {
        _endBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.centerBtn.frame) + [self centerOffset], CGRectGetMidY(self.centerBtn.frame) - 25, 50, 50)];
        _endBtn.backgroundColor = LY_Color_HexAlpha(#CDD4DE, 0.5);
        _endBtn.layer.cornerRadius = self.endBtn.frame.size.height / 2;
        _endBtn.layer.masksToBounds = YES;
        _endBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        _endBtn.layer.borderWidth = 3;
        [_endBtn setImage:[UIImage imageNamed:self.normalList[2]] forState:UIControlStateNormal];
        [_endBtn setImage:[UIImage imageNamed:self.selectList[2]] forState:UIControlStateSelected];
        [_endBtn addTarget:self action:@selector(clickButtonItem:) forControlEvents:UIControlEventTouchUpInside];
        _endBtn.backgroundColor = [UIColor grayColor];
    }
    return _endBtn;
}

- (UIView *)hasMessageView {
    if(_hasMessageView == nil) {
        _hasMessageView = [[UIView alloc]initWithFrame:CGRectZero];
        _hasMessageView.backgroundColor = [UIColor redColor];
        _hasMessageView.layer.masksToBounds = YES;
        _hasMessageView.layer.cornerRadius = 5;
        _hasMessageView.hidden = YES;
    }
    return _hasMessageView;
}

- (void)grantViewAnimation:(UIScrollView *)scrollView toPage:(int)page { //动态改变
    
    // 0 <~> 1
    // 1 <~> 2
    CGFloat scaleR = scrollView.contentOffset.x / SCREEN_WIDTH;
    CGFloat scaleL = fabs(1 - scaleR); //取正值
    
    self.firstBtn.frame = CGRectMake(CGRectGetMinX(self.centerBtn.frame) - [self centerOffset] - 50 - 50 * scaleL, self.firstBtn.frame.origin.y, self.firstBtn.bounds.size.width, self.firstBtn.bounds.size.height);
    
    self.endBtn.frame = CGRectMake(CGRectGetMaxX(self.centerBtn.frame) + [self centerOffset] + 50 * scaleL, self.endBtn.frame.origin.y, self.endBtn.bounds.size.width, self.endBtn.bounds.size.height);
    
    if(!self.hasMessageView.hidden) {
        self.hasMessageView.frame = CGRectMake(CGRectGetMaxX(self.centerBtn.frame) + self.frame.size.width / 6 + [self hasMessageOffset] + 50 * scaleL, CGRectGetMidY(self.centerBtn.frame) - (self.frame.size.height / 2) + 5 + BOTTOM_HEIGHT, 10, 10);
        
    }
    
    //底部变化
    [self setBaseTabbarIndex:page animation:NO];
}

- (void)setBaseTabbarIndex:(NSInteger)index animation:(BOOL)animation {
    if(self.lastItem.tag == index) { //当前vc到当前vc一般不变
        return;
    } else {
        if(index == 0) {
            self.lastItem.selected = NO;
            self.firstBtn.selected = YES;

            //先动画 再设置值 lastItem
            if(animation) {
                [self animationed:self.firstBtn];
            }
            self.lastItem = self.firstBtn;
        } else if (index == 1) {
            self.lastItem.selected = NO;
            self.centerBtn.selected = YES;
            //先动画 再设置值 lastItem
            if(animation) {
                [self animationed:self.centerBtn];
            }
            self.lastItem = self.centerBtn;
        } else {
            self.lastItem.selected = NO;
            self.endBtn.selected = YES;

            //先动画 再设置值 lastItem
            if(animation) {
                [self animationed:self.endBtn];
            }
            self.lastItem = self.endBtn;
        }
    }
}

- (void)clickButtonItem:(UIButton *)sender {
    if(sender == self.lastItem) { //如果当前按钮是最新按钮不进行动画
        if(_delegate && [_delegate respondsToSelector:@selector(clickThisBaseTabbarIndex:)]) {
            [_delegate clickThisBaseTabbarIndex:sender.tag];
        }
        return;
    }
    
    if (_delegate && [_delegate respondsToSelector:@selector(baseTabbar:clickIndex:)]) {
        [_delegate baseTabbar:self clickIndex:sender.tag];
    }
    
    //先动画 再设置值 lastItem
    [self animationed:sender];
    
    //替换最新按钮(上一个按钮)
    self.lastItem.selected = NO;
    sender.selected = YES;
    self.lastItem = sender;
}

- (void)animationed:(UIButton *)sender {
    if(self.lastItem.tag == BaseTabbarBtnType_First && sender.tag == BaseTabbarBtnType_End) { //0 -> 2
        return;
    }
    if(self.lastItem.tag == BaseTabbarBtnType_End && sender.tag == BaseTabbarBtnType_First) { //2 -> 0
        return;
    }
    if(sender.tag != BaseTabbarBtnType_Center) { // 1 -> 0  1 -> 2
        [UIView animateWithDuration:0.25 animations:^{
            self.firstBtn.frame = CGRectMake(CGRectGetMinX(self.centerBtn.frame) - [self centerOffset] - 50 - 50, self.firstBtn.frame.origin.y, self.firstBtn.bounds.size.width, self.firstBtn.bounds.size.height);
            
            self.endBtn.frame = CGRectMake(CGRectGetMaxX(self.centerBtn.frame) + [self centerOffset] + 50, self.endBtn.frame.origin.y, self.endBtn.bounds.size.width, self.endBtn.bounds.size.height);
            
            if(!self.hasMessageView.hidden) {
                self.hasMessageView.frame = CGRectMake(CGRectGetMaxX(self.centerBtn.frame) + self.frame.size.width / 6 + [self hasMessageOffset] + 50, CGRectGetMidY(self.centerBtn.frame) - (self.frame.size.height / 2) + 5 + BOTTOM_HEIGHT, 10, 10);
            }
        }];
    } else { // 0 -> 1  2 -> 1
        [UIView animateWithDuration:0.25 animations:^{
            self.firstBtn.frame = CGRectMake(CGRectGetMinX(self.centerBtn.frame) - [self centerOffset] - 50, self.firstBtn.frame.origin.y, self.firstBtn.bounds.size.width, self.firstBtn.bounds.size.height);
            
            self.endBtn.frame = CGRectMake(CGRectGetMaxX(self.centerBtn.frame) + [self centerOffset], self.endBtn.frame.origin.y, self.endBtn.bounds.size.width, self.endBtn.bounds.size.height);

            if(!self.hasMessageView.hidden) {
                self.hasMessageView.frame = CGRectMake(CGRectGetMaxX(self.centerBtn.frame) + self.frame.size.width / 6 + [self hasMessageOffset], CGRectGetMidY(self.centerBtn.frame) - (self.frame.size.height / 2) + 5 + BOTTOM_HEIGHT, 10, 10);
            }
        }];
    }
}

- (void)hasMessageTagPonitView:(BOOL)hasMessage { //有没有消息的小红点
    self.hasMessageView.hidden = !hasMessage;
    if(!self.hasMessageView.isHidden) {
        if(self.lastItem.tag == BaseTabbarBtnType_Center) { //中间
            self.hasMessageView.frame = CGRectMake(CGRectGetMaxX(self.centerBtn.frame) + self.frame.size.width / 6 + [self hasMessageOffset], CGRectGetMidY(self.centerBtn.frame) - (self.frame.size.height / 2) + 5 + BOTTOM_HEIGHT, 10, 10);
            
        } else {
            self.hasMessageView.frame = CGRectMake(CGRectGetMaxX(self.centerBtn.frame) + self.frame.size.width / 6 + [self hasMessageOffset] + 50, CGRectGetMidY(self.centerBtn.frame) - (self.frame.size.height / 2) + 5 + BOTTOM_HEIGHT, 10, 10);
        }

    }
}

- (void)setTabbarHeartBeatAnimation { //心跳的动画
    if(self.lastItem.tag == BaseTabbarBtnType_Center) {
        CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        anim.duration = 0.75f;
        anim.fromValue = @0.8;
        anim.toValue = @1;
        anim.fillMode = kCAFillModeForwards;
        anim.autoreverses = YES;
        anim.repeatCount = NSIntegerMax;
        [self.centerBtn.imageView.layer addAnimation:anim forKey:nil];
    }
}

- (void)removeTabbarHeartBeatAnimation { //移除心跳动画
    [self.centerBtn.imageView.layer performSelector:@selector(removeAllAnimations) withObject:nil];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    //UIView *view = [super hitTest:point withEvent:event];
    if (!self.isHidden) {
        //转换坐标到中间按钮,生成一个新的点
        CGPoint pointInCenterBtn = [self convertPoint:point toView:self.centerBtn];
        //判断  如果该点是在中间按钮,那么处理事件最合适的View,就是这个button
        if ([self.centerBtn pointInside:pointInCenterBtn withEvent:event]) {
            return self.centerBtn;
        }
        CGPoint pointInFirstBtn = [self convertPoint:point toView:self.firstBtn];
        if ([self.firstBtn pointInside:pointInFirstBtn withEvent:event]) {
            return self.firstBtn;
        }
        CGPoint pointInEndBtn = [self convertPoint:point toView:self.endBtn];
        if ([self.endBtn pointInside:pointInEndBtn withEvent:event]) {
            return self.endBtn;
        }
        return nil;
    }
    return nil;
}

- (CGFloat)centerOffset {
    if(IS_IPHONE_X) {
        return 37;
    } else {
        return 50;
    }
}

- (CGFloat)hasMessageOffset {
    if(IS_IPHONE_XSM) {
        return 2;
    } else if (IS_IPHONE_X) {
        return 19;
    } else {
        return 15;
    }
}

@end



