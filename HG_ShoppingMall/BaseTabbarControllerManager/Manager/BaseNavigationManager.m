//
//  BaseNavigationManager.m
//  YM_Installment
//
//  Created by Lindashuai on 2019/10/26.
//  Copyright © 2019 Lindashuai. All rights reserved.
//

#import "BaseNavigationManager.h"
#import "LoginViewController.h"

static BaseNavigationManager *kInstance;

@implementation BaseNavigationManager

@synthesize NavigationController = _navigationController;

+ (BaseNavigationManager *)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (kInstance == nil) {
            kInstance = [[BaseNavigationManager alloc]init];
        }
    });
    return kInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        LoginViewController *login = [LoginViewController new];
        _navigationController = [[BaseNavigationViewController alloc] initWithRootViewController:login];
    }
    _navigationController.navigationBar.hidden = YES;
    _navigationController.interactivePopGestureRecognizer.enabled = YES;
    
    return self;
}
@end
