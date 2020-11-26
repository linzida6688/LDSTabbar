//
//  NSObject+LYLayout.h
//  YM_Installment
//
//  Created by Lindashuai on 2019/10/26.
//  Copyright © 2019 Lindashuai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSObject (LYLayout)

//是否按垂直方向作为布局基准, default is YES for iPad,  is NO for iPhone
- (BOOL)bbp_isBaseVertical;

//垂直布局基准方案
- (CGSize)bbp_baseSize;
- (CGSize)bbp_actualSize;

//水平所有内容宽度
- (CGFloat)bbp_baseAllContent;

+ (CGSize)bbp_baseSize;
+ (CGSize)bbp_actualSize;

- (CGFloat)bbp_getWidth:(CGFloat)originWidth;
+ (CGFloat)bbp_getWidth:(CGFloat)originWidth;
- (CGFloat)bbp_getSpaceWidth:(CGFloat)originSpace;

@end

NS_ASSUME_NONNULL_END
