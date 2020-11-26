//
//  BaseNavigationController.m
//  YM_Installment
//
//  Created by Lindashuai on 2019/10/26.
//  Copyright © 2019 Lindashuai. All rights reserved.
//

#import "BaseNavigationViewController.h"

@interface BaseNavigationViewController () <UIGestureRecognizerDelegate>

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate = self;
}


- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if(self.childViewControllers.count == 1) {
        return NO;
    } else {
        if([self.topViewController isKindOfClass:[UITabBarController class]]) {
            return NO;
        } else {
            return YES;
        }
    }
}

@end
