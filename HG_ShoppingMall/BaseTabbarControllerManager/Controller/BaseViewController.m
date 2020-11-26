//
//  BaseViewController.m
//  YM_Installment
//
//  Created by Lindashuai on 2019/10/26.
//  Copyright © 2019 Lindashuai. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseNavigationManager.h"
#import "SizeHeader.h"

@interface BaseViewController () <BackBtnDelegate>

@property(nonatomic, strong) UIImageView *imageBgView;

@end

@implementation BaseViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setBgImgae:[UIImage imageNamed:@""]];
    [self initUI];
}

- (void)setBgImgae:(UIImage *_Nullable)image {
    
}

- (UIImageView *)imageBgView {
    if(_imageBgView == nil) {
        _imageBgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _imageBgView.contentMode = UIViewContentModeScaleAspectFill;
        _imageBgView.clipsToBounds = YES;
    }
    return _imageBgView;
}

- (void)initUI {
    
    topBar = [[TopNavigationBarView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, TOP_AND_SYSTEM_HEIGHT)];
    topBar.delegate = self;
    topBar.backgroundColor = MAIN_COLOR;
    [self.view addSubview:topBar];
}

- (void)setNavigationBGColor:(UIColor * _Nullable)color {
    if(color) {
        topBar.backgroundColor = color;
    }
}

- (void)setTopTitle:(NSString *_Nullable)title {
    [topBar setTopTitle:title];
}

- (void)setTopTitleColor:(UIColor *_Nullable)color {
    [topBar setTopTitleColor:color];
}

- (void)setTopBgColor:(UIColor *_Nullable)backgroundColor {
    [topBar setTopBgColor:backgroundColor];
}

- (void)setBackBtnHide:(BOOL)hide {
    [topBar setBackBtnHide:hide];
}

- (void)setBackBtnImage:(UIImage *_Nullable)image {
    [topBar setBackBtnImage:image];
}

- (void)setBackBtnTitle:(NSString *_Nullable)title {
    if(title) {
        [topBar setBackBtnTitle:title];
    }
}

- (void)setBackBtnFont:(UIFont *_Nullable)font color:(UIColor *_Nullable)color {
    if(font) {
        [topBar setBackBtnFont:font];
    }
    if(color) {
        [topBar setBackBtnColor:color];
    }
}

- (void)setRightBtnTitle:(NSString *_Nonnull)title {
    [topBar setRightBtnTitle:title];
}

- (void)setRightBtnTitleColor:(UIColor * _Nullable)color {
    [topBar setRightBtnTitleColor:color];
}

- (void)setRightBtnImage:(UIImage * _Nullable)image {
    if(image) {
        [topBar setRightBtnImage:image];
    }
}

- (void)setRightBtnFont:(UIFont *_Nullable)font color:(UIColor *_Nullable)color {
    if(font) {
        [topBar setRightBtnFont:font];
    }
    if(color) {
        [topBar setRightBtnColor:color];
    }
}

- (void)setNavigationHidden:(BOOL)hidden {
    topBar.hidden = hidden;
}

//- (void)setBackgroundImgae:(UIImage *_Nullable)image {
//    self.imageBgView.image = image;
//}


#pragma mark - backButtonAction

- (void)backActionOfDelegate {
    //如果是模态跳转
    if (self.presentingViewController) {
        [[BaseNavigationManager shareInstance].NavigationController dismissViewControllerAnimated:YES
                                                                                       completion:nil];
    } else {
        [[BaseNavigationManager shareInstance].NavigationController popViewControllerAnimated:YES];
    }
}

- (void)clickBackAction {
    [self performSelector:@selector(backActionOfDelegate)];
}

#pragma mark - rightButtonAction reWrite For Use

- (void)rightEditButtonAction {
    
}

@end

