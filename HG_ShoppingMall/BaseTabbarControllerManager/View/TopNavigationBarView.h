//
//  TopNavigationBarView.h
//  YM_Installment
//
//  Created by Lindashuai on 2019/10/26.
//  Copyright © 2019 Lindashuai. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BackBtnDelegate<NSObject>
@optional
-(void)backActionOfDelegate;
-(void)rightEditButtonAction;

@end

@interface TopNavigationBarView : UIView<BackBtnDelegate>
{
    UIButton *_backBtn;
    UILabel *_titleLabel;
    UIButton *_rightButton;
}
@property(nonatomic,strong)id<BackBtnDelegate> _Nullable delegate;

- (void)setTopTitle:(NSString *_Nullable)title;
- (void)setTopTitleColor:(UIColor *_Nullable)color;
- (void)setTopBgColor:(UIColor *_Nullable)backgroundColor;
- (void)setBackBtnHide:(BOOL)hide;
- (void)setBackBtnImage:(UIImage *_Nullable)image;
- (void)setBackBtnTitle:(NSString *_Nullable)title;
- (void)setBackBtnFont:(UIFont *_Nullable)font;
- (void)setBackBtnColor:(UIColor *_Nullable)color;

- (void)setRightBtnTitle:(NSString *_Nullable)title;
- (void)setRightBtnTitleColor:(UIColor *_Nullable)color;
- (void)setRightBtnImage:(UIImage * _Nullable)image;
- (void)setRightBtnFont:(UIFont *_Nullable)font;
- (void)setRightBtnColor:(UIColor *_Nullable)color;

@end
