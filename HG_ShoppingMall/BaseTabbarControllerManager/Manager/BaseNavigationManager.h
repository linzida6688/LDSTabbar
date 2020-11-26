//
//  BaseNavigationManager.h
//  YM_Installment
//
//  Created by Lindashuai on 2019/10/26.
//  Copyright © 2019 Lindashuai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseNavigationViewController.h"
@interface BaseNavigationManager : NSObject
{
@private
    BaseNavigationViewController *_navigationController;
}
@property (nonatomic, readonly) BaseNavigationViewController *NavigationController;

+ (BaseNavigationManager *)shareInstance;

@end
