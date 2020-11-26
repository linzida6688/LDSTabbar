//
//  LoginMainView.m
//  HG_ShoppingMall
//
//  Created by Lindashuai on 2019/11/25.
//  Copyright © 2019 Lindashuai. All rights reserved.
//

#import "LoginMainView.h"

@interface LoginMainView ()
{
    UITextField *_accountText;
    UITextField *_pwdText;
}
@end

@implementation LoginMainView

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        //顶部背景图片
        UIImageView *backImageView = [[UIImageView alloc]init];
        backImageView.backgroundColor = [UIColor grayColor];
        backImageView.image = [UIImage imageNamed:@"Login_Bg"];
        backImageView.contentMode = UIViewContentModeScaleAspectFill;
        backImageView.clipsToBounds = YES;
        [self addSubview:backImageView];
        [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).mas_offset(0);
            make.bottom.equalTo(self.mas_bottom).mas_offset(0);
            make.right.equalTo(self.mas_right).mas_offset(0);
            make.left.equalTo(self.mas_left).mas_offset(0);
        }];
        
        _accountText = [[UITextField alloc]initWithFrame:CGRectMake(LYWidth(49), IS_IPHONE_X ? LYWidth(370):LYWidth(300), SCREEN_WIDTH-LYWidth(49+36), LYWidth(50))];
        _accountText.placeholder = @"请输入账号";
        _accountText.font = [UIFont systemFontOfSize:LYWidth(17)];
        [self addSubview:_accountText];
        
        //第一条灰色线
        UILabel *line1 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(_accountText.frame), CGRectGetMaxY(_accountText.frame)+1, CGRectGetWidth(_accountText.frame), 1)];
        line1.backgroundColor = [UIColor whiteColor];
        [self addSubview:line1];
        
        //第二条灰色线
        UILabel *line2 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(_accountText.frame), CGRectGetMaxY(line1.frame)+LYWidth(50)+2, CGRectGetWidth(_accountText.frame), 1)];
        line2.backgroundColor = [UIColor whiteColor];
        [self addSubview:line2];
        
        //密码
        _pwdText = [[UITextField alloc]initWithFrame:CGRectMake(LYWidth(49), CGRectGetMaxY(line1.frame), SCREEN_WIDTH-LYWidth(49+36), LYWidth(50))];
        _pwdText.placeholder = @"请输入密码";
        _pwdText.secureTextEntry = YES;//设置文本显示密码隐藏成为点
        _pwdText.font = [UIFont systemFontOfSize:LYWidth(17)];
        [self addSubview:_pwdText];
        
        //登录
        UIButton * loGinBtn=[[UIButton alloc]initWithFrame:CGRectMake(LYWidth(49), CGRectGetMaxY(line2.frame)+LYWidth(57), SCREEN_WIDTH-LYWidth(49+36), LYWidth(30))];
        [loGinBtn setBackgroundColor:MAIN_COLOR];
        [loGinBtn.titleLabel setFont:[UIFont systemFontOfSize:LYWidth(17)]];
        loGinBtn.layer.masksToBounds = YES;
        loGinBtn.layer.cornerRadius = 13.0f;
        [loGinBtn setTitle:@"登录" forState:UIControlStateNormal];
        [loGinBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [loGinBtn addTarget:self action:@selector(btnLoginAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:loGinBtn];
        
        //忘记密码？
        UIButton *forGiveBtn=[[UIButton alloc]initWithFrame:CGRectMake(LYWidth(150+8), CGRectGetMaxY(loGinBtn.frame)+LYWidth(5), SCREEN_WIDTH - 2*LYWidth(150), LYWidth(15))];
        [forGiveBtn.titleLabel setFont:[UIFont systemFontOfSize:LYWidth(12)]];
        forGiveBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [forGiveBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
        [forGiveBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [forGiveBtn addTarget:self action:@selector(btnForgiveAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:forGiveBtn];
    }
    return self;
}

#pragma mark - btnLoginActionOfDelegate

- (void)btnLoginAction:(UIButton *)sender
{
    if(_delegate && [_delegate respondsToSelector:@selector(btnLoginActionAccountText:passWordText:)]) {
        [_delegate btnLoginActionAccountText:_accountText.text passWordText:_pwdText.text];
    }
}

#pragma mark - btnForgiveActionOfDelegate

- (void)btnForgiveAction:(UIButton *)sender
{
    if(_delegate && [_delegate respondsToSelector:@selector(btnFogiveActionOfDelegate)]) {
        [_delegate btnFogiveActionOfDelegate];
    }
}

@end

