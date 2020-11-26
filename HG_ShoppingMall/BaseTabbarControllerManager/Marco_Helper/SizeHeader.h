//
//  SizeHeader.h
//  YM_Installment
//
//  Created by Lindashuai on 2019/10/26.
//  Copyright © 2019 Lindashuai. All rights reserved.
//

//#ifdef _OBJC_
#ifndef SizeHeader_h
#define SizeHeader_h

#import "NSObject+LYLayout.h"
#import "UIColor+ColorHex.h"
#import <Masonry/Masonry.h>

#define SCREEN_MAX (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#pragma mark - 判断iPhone型号
#define IS_IPHONE   ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)// 设备型号
#define IS_IPAD     ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

#define IS_BEGORE_IPHONE_5  ((SCREEN_MAX < 568.0f) && IS_IPHONE)    //320 * 480
#define IS_IPHONE_5         ((SCREEN_MAX == 568.0f) && IS_IPHONE)   //320 * 568
#define IS_BEGORE_IPHONE_6  ((SCREEN_MAX < 667.0f) && IS_IPHONE)
#define IS_IPHONE_6         ((SCREEN_MAX == 667.0f) && IS_IPHONE)   //375 * 667
#define IS_BEGORE_IPHONE_6P ((SCREEN_MAX < 736.0f) && IS_IPHONE)
#define IS_IPHONE_6P        ((SCREEN_MAX == 736.0f) && IS_IPHONE)   //414 * 736
#define IS_IPHONE_X         ((SCREEN_MAX >= 812.0f) && IS_IPHONE)   //泛指X、XS、XSM、XR等刘海屏
#define IS_IPHONE_XS        ((SCREEN_MAX == 812.0f) && IS_IPHONE)   //375 * 812
#define IS_IPHONE_XR        ((SCREEN_MAX == 896.0f && [UIScreen mainScreen].scale == 2.0) && IS_IPHONE) //414 * 896
#define IS_IPHONE_XSM       ((SCREEN_MAX == 896.0f && [UIScreen mainScreen].scale == 3.0) && IS_IPHONE) //414 * 896

#define LYWidth(width)              ([self bbp_getWidth:(width)])//屏幕缩放因子
#define LYScaleSpace(width)         ([self bbp_getSpaceWidth:(width)])
#define LYFrame(x,y,width,height)   CGRectMake(LYWidth(x), LYWidth(y), LYWidth(width), LYWidth(height))
#define LYSize(width, height)       CGSizeMake(LYWidth(width), LYWidth(height))
#define LYPoint(width, height)      CGPointMake(LYWidth(width), LYWidth(height))
#define LYEdgeInsets(top, left, bottom, right) UIEdgeInsetsMake(LYWidth(top), LYScaleSpace(left), LYWidth(bottom), LYScaleSpace(right))
#define LY_SCALE (IS_IPHONE ? (SCREEN_MIN/375.0) : (SCREEN_MAX/1024.0))

#define SCREEN_HEIGHT  [[UIScreen mainScreen] bounds].size.height// 设备全屏高
#define SCREEN_WIDTH   [[UIScreen mainScreen] bounds].size.width// 设备全屏宽

#pragma mark - color 颜色取值

#define MAIN_COLOR           LY_Color(254, 209, 50)          //主要颜色橙色
#define MAIN_HOME_COLOR      LY_Color(41, 41, 41)            //首页颜色黑色
#define MAIN_BGCOLOR         LY_Color_Alpha(255, 255, 255, 1)//背景颜色白色

#define LY_Color(r, g, b)               [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define LY_Color_Alpha(r, g, b, a)      [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/1.0]
#define LY_Color_Hex(hex)               [UIColor ly_colorWithHexString:((__bridge NSString *)CFSTR(#hex))]
#define LY_Color_HexAlpha(hex,alp)      [UIColor ly_colorWithHexString:((__bridge NSString *)CFSTR(#hex)) withAlpha:alp]

#pragma mark - 导航栏和tabbar高度

#define TOP_AND_SYSTEM_HEIGHT   (SCREEN_HEIGHT == 812.0 ? LYWidth(88) : LYWidth(64))//导航栏高度
#define IOS7_AND_ABLVE          ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0)
#define TOP_BAR_HEIGHT          (IOS7_AND_ABLVE ? LYWidth(64):LYWidth(44))
#define SYSTEM_TOPY             (IOS7_AND_ABLVE ? LYWidth(20):0)
#define SYSTEM_TOP_HEIGHT       (IS_IPHONE_X ? LYWidth(44):LYWidth(20))     //状态栏和iphonexX刘海高度
#define SYSTEM_HEIGHT           (IOS7_AND_ABLVE ? 0:LYWidth(20))
#define BOTTOM_HEIGHT           (SCREEN_HEIGHT == 812.0 ? LYWidth(48) : 0)//48
#define STATE_BAR_HEIGHT        [[UIApplication sharedApplication] statusBarFrame].size.height//电源条

//iPhone X的宽高适配   以iPhone8 高度667.0 为例     iPhone X（1125 * 2436）
#define SafeAreaBottomHeight    (SCREEN_HEIGHT == 812.0 ? LYWidth(53) : 0)//底部高度

#pragma mark - Log 打印日志

#if DEBUG
#define LYLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif
//Debug模式下打印日志,当前行,函数名 并弹出一个警告
#ifdef DEBUG
#   define  WLYLog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; }
#else
#   define NSLog(...)
#endif



#pragma mark - 互斥锁

#define SemaphoreBegin \
static dispatch_semaphore_t semaphore; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
semaphore = dispatch_semaphore_create(1); \
}); \
dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);

#define SemaphoreEnd \
dispatch_semaphore_signal(semaphore);\
dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);



// 弱引用
#define LYWeakSelf __weak typeof(self) weakSelf = self;

#pragma mark - 业务方法
#define NSUSER_Def [NSUserDefaults standardUserDefaults]
#define kPushMesKey @"kPushMesKey"

#pragma mark - Tabbar开启的selectIndex
static NSUInteger const kInitIndex = 1;
static NSUInteger const kTabbarItemNums = 3;//总的根控制器

#define TABBAR_HEIGHT           (CGFloat)(IS_IPHONE_X?(49.0 + 34.0):(49.0))
#define SYSTEM_TOPY_IPHONEX     (IS_IPHONE_X ? 24 : 0)
#define SYSTEM_TOPY_IPHONEX     (IS_IPHONE_X ? 24 : 0)

//#endif
#endif /* SizeHeader_h */
