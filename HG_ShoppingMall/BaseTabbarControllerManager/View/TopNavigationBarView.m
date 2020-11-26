//
//  TopNavigationBarView.m
//  YM_Installment
//
//  Created by Lindashuai on 2019/10/26.
//  Copyright © 2019 Lindashuai. All rights reserved.
//

#import "TopNavigationBarView.h"
#import "SizeHeader.h"

@implementation TopNavigationBarView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(LYWidth(50),TOP_AND_SYSTEM_HEIGHT-LYWidth(32), SCREEN_WIDTH-LYWidth(100), LYWidth(20))];
        _titleLabel.text = @"登录";
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font = [UIFont systemFontOfSize:LYWidth(17)];
        [self addSubview:_titleLabel];
        
        _backBtn = [[UIButton alloc]initWithFrame:CGRectMake(LYWidth(0), TOP_AND_SYSTEM_HEIGHT-LYWidth(39), LYWidth(62), LYWidth(34))];
        [_backBtn setTitle:@"" forState:UIControlStateNormal];
        [_backBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [_backBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_backBtn];
        
        _rightButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - LYWidth(70), TOP_AND_SYSTEM_HEIGHT-LYWidth(37), LYWidth(70), LYWidth(30))];
        [_rightButton setTitle:@"" forState:UIControlStateNormal];
        [_rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _rightButton.titleLabel.font = [UIFont systemFontOfSize:LYWidth(13)];
        [_rightButton addTarget:self action:@selector(rightBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_rightButton];
        _rightButton.hidden = YES;
    }
    
    return self;
}

- (void)setTopTitle:(NSString *)title {
    _titleLabel.text = title;
}

- (void)setTopTitleColor:(UIColor *)color {
    _titleLabel.textColor = color;
}

- (void)setTopBgColor:(UIColor *)backgroundColor {
    self.backgroundColor = backgroundColor;
}

- (void)setBackBtnHide:(BOOL)hide {
    _backBtn.hidden = hide;
}

- (void)setBackBtnImage:(UIImage *)image {
    [_backBtn setImage:image forState:UIControlStateNormal];
}

- (void)setBackBtnTitle:(NSString *)title {
    [_backBtn setTitle:title forState:UIControlStateNormal];
}

- (void)setBackBtnFont:(UIFont *)font {
    _backBtn.titleLabel.font = font;
}

- (void)setBackBtnColor:(UIColor *)color {
    [_backBtn setTitleColor:color forState:UIControlStateNormal];
}

- (void)setRightBtnTitle:(NSString *)title {
    if(title) {
        [_rightButton setTitle:title forState:UIControlStateNormal];
        _rightButton.hidden = NO;
    }
}

- (void)setRightBtnTitleColor:(UIColor *)color {
    [_rightButton setTitleColor:color forState:UIControlStateNormal];
}

- (void)setRightBtnImage:(UIImage * _Nullable)image {
    [_rightButton setImage:image forState:UIControlStateNormal];
    _rightButton.hidden = NO;
}

- (void)setRightBtnFont:(UIFont *)font {
    _rightButton.titleLabel.font = font;
}
- (void)setRightBtnColor:(UIColor *)color {
    [_rightButton setTitleColor:color forState:UIControlStateNormal];
}

#pragma mark - backAtion

- (void)btnAction:(id)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(backActionOfDelegate)]) {
        [_delegate backActionOfDelegate];
    }
}

#pragma mark - rightAtion

- (void)rightBtnAction:(id)sender {
    if(_delegate && [_delegate respondsToSelector:@selector(rightEditButtonAction)]) {
        [_delegate rightEditButtonAction];
    }
}

@end
