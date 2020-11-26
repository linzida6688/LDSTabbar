//
//  BaseTabbarView.h
//  HG_ShoppingMall
//
//  Created by Lindashuai on 2020/11/26.
//  Copyright © 2020 Lindashuai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {
    BaseTabbarBtnType_First  = 0,
    BaseTabbarBtnType_Center = 1,
    BaseTabbarBtnType_End    = 2,
} BaseTabbarBtnType;
@class BaseTabbarView;
@protocol BaseTabbarDelegate <NSObject>
@optional
- (void)baseTabbar:(BaseTabbarView *)tabbar clickIndex:(NSInteger)index; //点击
- (void)clickThisBaseTabbarIndex:(NSInteger)index; //点击当前底部barItem按钮 主要用于弹出面具

@end
@interface BaseTabbarView : UIView

@property(nonatomic, weak) id<BaseTabbarDelegate> delegate;
- (void)setBaseTabbarIndex:(NSInteger)index animation:(BOOL)animation;
- (void)grantViewAnimation:(UIScrollView *)scrollView toPage:(int)page; //动态改变

- (void)hasMessageTagPonitView:(BOOL)hasMessage;

- (void)setTabbarHeartBeatAnimation;
- (void)removeTabbarHeartBeatAnimation;

@end
NS_ASSUME_NONNULL_END

