//
//  BaseMainViewController.m
//  HG_ShoppingMall
//
//  Created by Lindashuai on 2020/11/26.
//  Copyright © 2020 Lindashuai. All rights reserved.
//

#import "BaseMainViewController.h"
#import "BaseMainScrollView.h" //主页面
#import "BaseTabbarView.h" //底部视图

#import "PopularViewController.h"
#import "MatchViewController.h"
#import "MessageListViewController.h"

@interface BaseMainViewController () <UIScrollViewDelegate,BaseTabbarDelegate>

@property(nonatomic, strong) BaseMainScrollView *contentScrollView;
@property(nonatomic, strong) BaseTabbarView *bottomView;

@end

static BaseMainViewController *kBaseMainViewController = nil;
@implementation BaseMainViewController

static dispatch_once_t onceToken;
+ (instancetype)shareInstance {
    dispatch_once(&onceToken, ^{
        kBaseMainViewController = [[self alloc] init];
    });
    return kBaseMainViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBaseMainViewUI];
    [self addChildViewControllers];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

#pragma mark - BaseTabbarDelegate

- (void)baseTabbar:(BaseTabbarView *)tabbar clickIndex:(NSInteger)index { //点击
    _currentIndex = index;
    [self _setupOneViewController:index];
    
    //2.内容滚动视图滚动到对应的位置
    CGFloat x = index * SCREEN_WIDTH;
    [UIView animateWithDuration:0.25 animations:^{
        self.contentScrollView.contentOffset = CGPointMake(x, - SYSTEM_TOPY - SYSTEM_TOPY_IPHONEX);
    }];
    [self _bottomViewAnimation:index];
}

- (void)clickThisBaseTabbarIndex:(NSInteger)index { //点击当前底部barItem按钮
    if(index == BaseTabbarBtnType_Center) {
        
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    [self.bottomView grantViewAnimation:scrollView toPage:page];
    _currentIndex = page;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger i = scrollView.contentOffset.x / SCREEN_WIDTH; //1.获取当前角标
    //[self.bottomView setBaseTabbarIndex:i]; //2.选中按钮
    [self _bottomViewAnimation:i];
    
    //最后一页的消息列表页 有tableView系统手势 所以这里禁用mian手势
    self.contentScrollView.isOpen = !(i == kTabbarItemNums - 1);
    
    [self _setupOneViewController:i]; //3.把对应子控制器的View添加上去
    
}

- (void)_setupOneViewController:(NSInteger)i { //添加一个子控制器的View
    UIViewController *vc = self.childViewControllers[i];
    if(vc.view.superview) { //看看有没有加载,如果加载了，就不加了
        return;
    }
    
    CGFloat x = i * SCREEN_WIDTH;
    vc.view.frame = CGRectMake(x, 0, SCREEN_WIDTH, self.contentScrollView.bounds.size.height);
    
    [self.contentScrollView addSubview:vc.view];
}

#pragma mark - addChildViewControllers

- (void)addChildViewControllers {
    for (UIViewController *vc in self.childViewControllers) {
        [vc removeFromParentViewController];
    }
    PopularViewController *vc0 = [[PopularViewController alloc]init];
    [self addChildViewController:vc0];
    
    MatchViewController *vc1 = [[MatchViewController alloc]init];
    [self addChildViewController:vc1];
    
    MessageListViewController *vc2 = [[MessageListViewController alloc]init];
    [self addChildViewController:vc2];
    
    NSInteger index = 0;
    index = kInitIndex;
    [self _setupOneViewController:index];
}

#pragma mark - setBaseMainViewUI

- (void)setBaseMainViewUI {
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavigationHidden:YES];
    [self.view addSubview:self.contentScrollView];
    [self.view addSubview:self.bottomView];
}

- (BaseTabbarView *)bottomView {
    if(_bottomView == nil) {
        _bottomView = [[BaseTabbarView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - TABBAR_HEIGHT, SCREEN_WIDTH, TABBAR_HEIGHT)];
        _bottomView.delegate = self;
    }
    return _bottomView;
}

- (BaseMainScrollView *)contentScrollView {
    if(_contentScrollView == nil) {
        _contentScrollView = [[BaseMainScrollView alloc]initWithFrame:CGRectMake(0, - SYSTEM_TOPY - SYSTEM_TOPY_IPHONEX, SCREEN_WIDTH, SCREEN_HEIGHT + SYSTEM_TOPY + SYSTEM_TOPY_IPHONEX)];
        _contentScrollView.scrollEnabled = YES;
        _contentScrollView.delegate = self;
        _contentScrollView.pagingEnabled = YES;
        _contentScrollView.bounces = NO; //弹簧
        _contentScrollView.showsHorizontalScrollIndicator = NO;
        //设置选中的内容
        _contentScrollView.contentSize = CGSizeMake(kTabbarItemNums * SCREEN_WIDTH, 0);
        //self.automaticallyAdjustsScrollViewInsets = NO;
        NSInteger index = 0;
        index = kInitIndex;
        _contentScrollView.contentOffset = CGPointMake(index * SCREEN_WIDTH, 0);
    }
    return _contentScrollView;
}

- (void)_bottomViewAnimation:(NSInteger)index { //中间面具的心跳变化
    if(index == BaseTabbarBtnType_Center) {
        [self.bottomView setTabbarHeartBeatAnimation];
    } else {
        [self.bottomView removeTabbarHeartBeatAnimation];
    }
}

#pragma mark - public method

- (void)showMessageBadge:(BOOL)show { //展示badge
    [self.bottomView hasMessageTagPonitView:show];
}

- (void)showTabbarHeartBeatAnimation:(BOOL)show { //心跳的动画
    if(show) { //展示 并且在中间
        [self.bottomView setTabbarHeartBeatAnimation];
    } else {
        [self.bottomView removeTabbarHeartBeatAnimation];
    }
}

@end


