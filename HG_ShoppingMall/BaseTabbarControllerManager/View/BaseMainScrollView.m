//
//  BaseMainScrollView.m
//  HG_ShoppingMall
//
//  Created by Lindashuai on 2020/11/26.
//  Copyright © 2020 Lindashuai. All rights reserved.
//

#import "BaseMainScrollView.h"

@implementation BaseMainScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        self.panGestureRecognizer.delegate = self;
    }
    return self;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer { //根据返回值，判断是否识别或响应手势
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        UIPanGestureRecognizer *gesture = (UIPanGestureRecognizer *)gestureRecognizer;
        CGFloat transitionX = [gesture translationInView:self].x;
        
        if (transitionX < 0 && !_isOpen) {  //往左滑动 !_isOpen最后一页 transitionX < 0往左滑动
            return NO;
        }
    }
    return YES;
}

@end
