//
//  NSObject+LYLayout.m
//  YM_Installment
//
//  Created by Lindashuai on 2019/10/26.
//  Copyright © 2019 Lindashuai. All rights reserved.
//

#import "NSObject+LYLayout.h"
#import "SizeHeader.h"

@implementation NSObject (LYLayout)

- (CGSize)inner_baseSize {
    
    CGSize baseSize;
    if ([self respondsToSelector:@selector(bbp_baseSize)]
        || [self.class respondsToSelector:@selector(bbp_baseSize)]) {
        if ([self respondsToSelector:@selector(bbp_baseSize)]) {
            baseSize = [self bbp_baseSize];
        }else {
            baseSize = [self.class bbp_baseSize];
        }
    }else {
        if (IS_IPAD) {
            baseSize = CGSizeMake(1024, 768);
        }else {
            baseSize = CGSizeMake(375, 667);
        }
    }
    
    return baseSize;
}

- (CGSize)inner_actualSize {
    
    CGSize actualSize;
    if ([self respondsToSelector:@selector(bbp_actualSize)]
        || [self.class respondsToSelector:@selector(bbp_actualSize)]) {
        
        if ([self respondsToSelector:@selector(bbp_actualSize)]) {
            actualSize = [self bbp_actualSize];
        }else {
            actualSize = [self.class bbp_actualSize];
        }
    }
    else if ([self isKindOfClass:UIView.class]) {
        
        UIView *tempView = (UIView *)self;
        actualSize = tempView.frame.size;
    }
    else {
        actualSize = [[UIScreen mainScreen] bounds].size;
    }
    
    return actualSize;
}

- (CGFloat)bbp_spaceScale {
    
    CGSize baseSize = self.inner_baseSize;
    CGSize actualSize = self.inner_actualSize;
    
    CGFloat realContentWidth = LYWidth(self.bbp_baseAllContent);
    CGFloat actualAllSpace = actualSize.width - realContentWidth;
    CGFloat baseAllSpace = baseSize.width - self.bbp_baseAllContent;
    CGFloat spaceScale = actualAllSpace / baseAllSpace;
    
    return spaceScale;
}

- (CGFloat)bbp_getSpaceWidth:(CGFloat)originSpace {
    
    if ([self respondsToSelector:@selector(bbp_baseAllContent)]) {
        return originSpace * self.bbp_spaceScale;
    }else {
        return LYWidth(originSpace);
    }
}

+ (CGFloat)bbp_getSpaceWidth:(CGFloat)originSpace {
    
    return originSpace * LY_SCALE;
}

//是否按垂直方向作为布局基准
- (BOOL)bbp_isBaseVertical {
    
    if (IS_IPAD) {
        return YES;
    }else {
        return NO;
    }
}

- (CGFloat)inner_currentScale {
    
    if ([self respondsToSelector:@selector(bbp_baseSize)]==NO
        && [self.class respondsToSelector:@selector(bbp_baseSize)]==NO) {
        return LY_SCALE;
    }
    
    CGFloat tempBaseWidth = 0;
    if ([self respondsToSelector:@selector(bbp_baseSize)]) {
        tempBaseWidth = [self bbp_baseSize].height;
    }else {
        tempBaseWidth = [self.class bbp_baseSize].height;
    }
    if (tempBaseWidth == 0) {
        return LY_SCALE;
    }
    
    if ([self respondsToSelector:@selector(bbp_actualSize)]) {
        CGFloat width = [self bbp_actualSize].height;
        return width/tempBaseWidth;
    }
    else if ([self isKindOfClass:UIView.class]) {
        
        UIView *tempView = (UIView *)self;
        CGSize viewSize = tempView.frame.size;
        CGFloat tempFloat = self.bbp_isBaseVertical ? viewSize.height:viewSize.width;
        
        if (tempFloat == 0) {
            return LY_SCALE;
        }else {
            return tempFloat/tempBaseWidth;
        }
        
    }else {
        return LY_SCALE;
    }
}


- (CGFloat)bbp_getWidth:(CGFloat)originWidth {
    
    return originWidth * self.inner_currentScale;
}

+ (CGFloat)bbp_getWidth:(CGFloat)originWidth {
    
    CGFloat result = 0;
    if ([self respondsToSelector:@selector(bbp_baseSize)]) {
        
        CGFloat tempBaseWidth = [self bbp_baseSize].height;
        if ([self respondsToSelector:@selector(bbp_actualSize)]) {
            CGFloat width = [self bbp_actualSize].height;
            result = (width/tempBaseWidth) * originWidth;
        }else {
            result = LY_SCALE * originWidth;
        }
        
    }else {
        result = LY_SCALE * originWidth;
    }
    
    return result;
}

@end
