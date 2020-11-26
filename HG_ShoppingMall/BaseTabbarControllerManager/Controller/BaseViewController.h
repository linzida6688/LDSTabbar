//
//  BaseViewController.h
//  YM_Installment
//
//  Created by Lindashuai on 2019/10/26.
//  Copyright © 2019 Lindashuai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopNavigationBarView.h"

@interface BaseViewController : UIViewController
{
@protected
    TopNavigationBarView *topBar;
}
/**
 　　* @brief set topViewTitleText
 　　*
 　　* @param title *_Nullable
 */
- (void)setTopTitle:(NSString *_Nullable)title;
- (void)setTopTitleColor:(UIColor *_Nullable)color;
- (void)setTopBgColor:(UIColor *_Nullable)backgroundColor;
/**
 　　* @brief set backBtnHide
 */
- (void)setBackBtnHide:(BOOL)hide;
- (void)setBackBtnImage:(UIImage *_Nullable)image;
- (void)setBackBtnTitle:(NSString *_Nullable)title;
- (void)setBackBtnFont:(UIFont *_Nullable)font color:(UIColor *_Nullable)color;
/**
 　　* @brief set rightBtnTitle
 　　*
 　　* @param title * _Nonnull
 */
- (void)setRightBtnTitle:(NSString * _Nonnull)title;
- (void)setRightBtnTitleColor:(UIColor * _Nullable)color;
- (void)setRightBtnImage:(UIImage * _Nullable)image;
- (void)setRightBtnFont:(UIFont *_Nullable)font color:(UIColor *_Nullable)color;

- (void)setNavigationBGColor:(UIColor * _Nullable)color;
- (void)setNavigationHidden:(BOOL)hidden;
/**
 source,ButtonAction ReWrite For Use
 */
- (void)rightEditButtonAction;
- (void)clickBackAction;

/**
 setBgImgae ReWrite For Use
 */
- (void)setBgImgae:(UIImage *_Nullable)image;

- (void)backActionOfDelegate;
@end
