//
//  UIView+Layout.h
//  BSHomeDemo
//
//  Created by 邹超 on 2019/9/12.
//  Copyright © 2019 邹超. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Layout)

@property (nonatomic ,assign)CGFloat x;
@property (nonatomic ,assign)CGFloat y;
@property (nonatomic ,assign)CGFloat width;
@property (nonatomic ,assign)CGFloat height;
@property (nonatomic ,assign)CGFloat bs_centerX;
@property (nonatomic ,assign)CGFloat bs_centerY;

@end

NS_ASSUME_NONNULL_END
