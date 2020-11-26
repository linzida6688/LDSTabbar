//
//  BaseMainViewController.h
//  HG_ShoppingMall
//
//  Created by Lindashuai on 2020/11/26.
//  Copyright © 2020 Lindashuai. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseMainViewController : BaseViewController

+ (instancetype)shareInstance;
- (void)showMessageBadge:(BOOL)show; //展示badge
- (void)showTabbarHeartBeatAnimation:(BOOL)show; //心跳的动画
@property(nonatomic, assign) NSInteger currentIndex; //当前的index

@end

NS_ASSUME_NONNULL_END
