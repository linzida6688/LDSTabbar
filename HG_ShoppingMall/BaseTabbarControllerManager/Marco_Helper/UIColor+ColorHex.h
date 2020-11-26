//
//  UIColor+ColorHex.h
//  YM_Installment
//
//  Created by Lindashuai on 2019/10/26.
//  Copyright © 2019 Lindashuai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UIColor(ColorHex)

/**
 *  颜色值 转换  #ffffff ->  uicolor
 *
 *  @param hexString <#hexString description#>
 *
 *  @return <#return value description#>
 */
+ (UIColor *)ly_colorWithHexString:(NSString *)hexString;
+ (UIColor *)ly_colorWithHexString:(NSString *)hexString withAlpha:(float)alp;

@end
