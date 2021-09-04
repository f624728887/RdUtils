//
//  UIControl+RdUtils.h
//  RdUtilsProject
//
//  Created by Rondo_dada on 2018/12/28.
//  Copyright © 2018 Rondo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIControl (RdUtils)

+ (instancetype _Nonnull)rd_ControlBgColor:(UIColor *_Nullable)bgColor forView:(UIView *)superView setTapResponder:(void (^)(UIControl *sender))block;

+ (instancetype _Nonnull)rd_ControlBgColor:(UIColor *_Nullable)bgColor forView:(UIView *)superView;

- (void)rd_setTapResponder:(void (^)(UIControl * sender))block;

@end

NS_ASSUME_NONNULL_END
