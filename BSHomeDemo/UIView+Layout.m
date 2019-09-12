//
//  UIView+Layout.m
//  BSHomeDemo
//
//  Created by 邹超 on 2019/9/12.
//  Copyright © 2019 邹超. All rights reserved.
//

#import "UIView+Layout.h"

@implementation UIView (Layout)

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (void)setBs_centerX:(CGFloat)bs_centerX {
    CGPoint center = self.center;
    center.x = bs_centerX;
    self.center = center;
}
- (void)setBs_centerY:(CGFloat)bs_centerY {
    CGPoint center = self.center;
    center.y =  bs_centerY;
    self.center = center;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (CGFloat)width {
    return self.bounds.size.width;
}

- (CGFloat)height {
    return self.bounds.size.height;
}

- (CGFloat)bs_centerX {
    return self.center.x;
}

- (CGFloat)bs_centerY {
    return self.center.y;
}

@end
