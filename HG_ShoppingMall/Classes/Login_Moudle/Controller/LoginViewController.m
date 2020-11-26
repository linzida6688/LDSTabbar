//
//  LoginViewController.m
//  HG_ShoppingMall
//
//  Created by Lindashuai on 2019/11/25.
//  Copyright © 2019 Lindashuai. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginMainView.h"

#import "BaseMainViewController.h"
#import "BaseTabbarController.h"//tabbar

@interface LoginViewController () <UIGestureRecognizerDelegate,LoginMainViewDelegate>

@end

@implementation LoginViewController

#pragma mark - 禁止右滑返回

- (void)viewDidAppear:(BOOL)animated{
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setTopTitle:@"首页"];
    
    //setUI
    [self setUI];
    [self createTabbar];
}

- (void)setUI
{
    LoginMainView *loginMainView = [[LoginMainView alloc]initWithFrame:CGRectZero];
    loginMainView.delegate = self;
    [self.view addSubview:loginMainView];
}


#pragma mark - delegate跳转忘记密码界面

- (void)btnFogiveActionOfDelegate {
//    ForgiveViewController *forgiveVC = [[ForgiveViewController alloc]init];
//    forgiveVC.mainTitleInView = @"修改密码";
//    forgiveVC.rightTitleInView = @"确认修改";
//    forgiveVC.type = ForgiveViewControllerType_ForgivePassW;
//    [[BaseNavigationManager shareInstance].NavigationController pushViewController:forgiveVC animated:YES];
}

#pragma mark - delegate跳转主界面

- (void)btnLoginActionAccountText:(NSString *)accountText passWordText:(NSString *)passWordText
{
    //    if([accountText isEqualToString:@"123"] && [passWordText isEqualToString:@"123"]) {
    //
    //    } else {
    //        DSToast *toast = [[DSToast alloc]initWithText:@"请输入正确账号和密码"];
    //        [toast showInView:self.view];
    //    }
    [self createTabbar];
}

#pragma mark - 创建标签栏视图

- (void)createTabbar {
    BaseMainViewController *vc = [[BaseMainViewController alloc]init];
    UINavigationController *nav0 = [[UINavigationController alloc] initWithRootViewController:vc];
    nav0.navigationBar.hidden = YES;
    
    BaseTabbarController *tabbar = [[BaseTabbarController alloc] init];
    tabbar.viewControllers = [NSArray arrayWithObjects:nav0, nil];
    [[BaseNavigationManager shareInstance].NavigationController pushViewController:tabbar animated:NO];
}

@end

