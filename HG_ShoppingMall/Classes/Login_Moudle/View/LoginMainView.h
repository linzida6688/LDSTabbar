//
//  LoginMainView.h
//  HG_ShoppingMall
//
//  Created by Lindashuai on 2019/11/25.
//  Copyright © 2019 Lindashuai. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoginMainViewDelegate <NSObject>
@optional
- (void)btnLoginActionAccountText:(NSString *)accountText passWordText:(NSString *)passWordText;
- (void)btnFogiveActionOfDelegate;

@end

@interface LoginMainView : UIView<LoginMainViewDelegate>
@property(nonatomic, strong) id<LoginMainViewDelegate> delegate;


@end
