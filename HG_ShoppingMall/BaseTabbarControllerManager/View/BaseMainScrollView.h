//
//  BaseMainScrollView.h
//  HG_ShoppingMall
//
//  Created by Lindashuai on 2020/11/26.
//  Copyright © 2020 Lindashuai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseMainScrollView : UIScrollView <UIGestureRecognizerDelegate>

@property(nonatomic, assign) BOOL isOpen;

@end

NS_ASSUME_NONNULL_END
