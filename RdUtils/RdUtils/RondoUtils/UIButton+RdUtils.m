//
//  UIButton+RdUtils.m
//  MasonryPackagingTest
//
//  Created by Rondo_dada on 2018/3/16.
//  Copyright © 2018年 Rondo. All rights reserved.
//

#import "UIButton+RdUtils.h"
#import "RdMacroFile.h"
#import <objc/runtime.h>

static char rdButtonActionBlockKey;

@interface UIButton ()

@property (nonatomic, copy) void (^rdActionBlock)(UIButton *sender);

@end

@implementation UIButton (RdUtils)

#pragma mark - 初始化
+ (instancetype _Nonnull)rd_BtnImage:(NSString *)imgName forView:(UIView *)superView{
    return [UIButton rd_BtnImage:imgName forView:superView responder:nil];
}

+ (instancetype _Nonnull)rd_BtnImage:(NSString *)imgName forView:(UIView *)superView responder:(void (^)(UIButton *sender))block{
    UIButton *button = [UIButton ButtonImg:imgName forView:superView];
    [button rd_setButtonAction:block];
    
    return button;
}


+ (instancetype _Nonnull)rd_BtnTitle:(NSString *)title forView:(UIView *)superView{
    return [UIButton rd_BtnTitle:title forView:superView responder:nil];
}

+ (instancetype _Nonnull)rd_BtnTitle:(NSString *)title forView:(UIView *)superView responder:(void (^)(UIButton *sender))block{
    UIButton *button = [UIButton ButtonTitle:title forView:superView];
    [button rd_setButtonAction:block];
    return button;
}


+ (instancetype _Nonnull)rd_BtnTitle:(NSString *)title image:(NSString *)imgName forView:(UIView *)superView{
    return [UIButton rd_BtnTitle:title image:imgName forView:superView responder:nil];
}

+ (instancetype _Nonnull)rd_BtnTitle:(NSString *)title image:(NSString *)imgName forView:(UIView *)superView responder:(void (^)(UIButton *sender))block{
    UIButton *button = [UIButton ButtonTitle:title img:imgName forView:superView];
    [button rd_setButtonAction:block];
    return button;
}


+ (instancetype _Nonnull)rd_BtnBgColor:(UIColor *_Nonnull)color forView:(UIView *_Nonnull)superView{
    UIButton *button = [UIButton ButtonforView:superView];
    button.rd_setBgColorWithState(color, UIControlStateNormal);
    return button;
}

+ (instancetype _Nonnull)rd_BtnBgColor:(UIColor *_Nonnull)color forView:(UIView *_Nonnull)superView responder:(void (^_Nullable)(UIButton *_Nonnull sender))block{
    UIButton *button = [UIButton ButtonforView:superView];
    button.rd_setBgColorWithState(color, UIControlStateNormal);
    [button rd_setButtonAction:block];
    return button;
}


+ (instancetype _Nonnull)rd_BtnBgImg:(NSString *_Nonnull)imgName forView:(UIView *_Nonnull)superView{
    UIButton *button = [UIButton ButtonforView:superView];
    button.rd_setBgImageWithState(imgName, UIControlStateNormal);
    return button;
}

+ (instancetype _Nonnull)rd_BtnBgImg:(NSString *_Nonnull)imgName forView:(UIView *_Nonnull)superView responder:(void (^_Nullable)(UIButton *_Nonnull sender))block{
    UIButton *button = [UIButton ButtonforView:superView];
    button.rd_setBgImageWithState(imgName, UIControlStateNormal);
    [button rd_setButtonAction:block];
    return button;
}

#pragma mark - 方法
- (void)rd_setButtonAction:(void (^)(UIButton *sender))block{
    if (block) {
        [self addTarget:self action:@selector(rdbuttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self setRdActionBlock:block];
    }
}

- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nonnull title, UIControlState state))rd_setTitleWithState{
    return ^(NSString *title, UIControlState state) {
        [self setTitle:title forState:state];
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(CGFloat fontSize))rd_setTitleFontSize{
    return ^(CGFloat fontSize) {
        if ([RdUtilsManager getManager].fontNameDefault.length == 0) {
            self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        }
        else {
            self.titleLabel.font = [UIFont fontWithName:[RdUtilsManager getManager].fontNameDefault size:fontSize];
        }
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nullable fontName, CGFloat fontSize))rd_setTitleFont{
    return ^(NSString *fontName, CGFloat fontSize) {
        if (fontName == nil) {
            if ([RdUtilsManager getManager].fontNameDefault.length == 0) {
                self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
            }
            else {
                self.titleLabel.font = [UIFont fontWithName:[RdUtilsManager getManager].fontNameDefault size:fontSize];
            }
        }
        else {
            self.titleLabel.font = [UIFont fontWithName:fontName size:fontSize];
        }
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(UIColor * _Nonnull color, UIControlState state))rd_setTitleColorWithState{
    return ^(UIColor *color, UIControlState state) {
        [self setTitleColor:color forState:state];
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nonnull imageName, UIControlState state))rd_setImageWithState{
    return ^(NSString *imageName, UIControlState state) {
        [self setImage:nil forState:state];
        [self setImage:[UIImage imageNamed:imageName] forState:state];
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(UIColor * _Nonnull color, UIControlState state))rd_setBgColorWithState{
    return ^(UIColor *color, UIControlState state) {
        CGRect frame = self.frame;
        CGFloat width = frame.size.width > 1 ? frame.size.width : 1;
        CGFloat height = frame.size.height > 1 ? frame.size.height : 1;
        
        UIImage *image = [self getImageWith:color width:width height:height];
        
        [self setBackgroundImage:image forState:state];
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nonnull imageName, UIControlState state))rd_setBgImageWithState{
    return ^(NSString *imageName, UIControlState state) {
        [self setBackgroundImage:[UIImage imageNamed:imageName] forState:state];
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(RdButtonImageType type))rd_setButtonImageType{
    return ^(RdButtonImageType type) {
        if (type == RdButtonImageLeft) {
            return self;
        }
        else if (type == RdButtonImageRight) {
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -CGRectGetWidth(self.imageView.frame), 0, CGRectGetWidth(self.imageView.frame));
            self.imageEdgeInsets = UIEdgeInsetsMake(0, CGRectGetWidth(self.titleLabel.frame), 0, -CGRectGetWidth(self.titleLabel.frame));
        }
        else if (type == RdButtonImageBottom) {
            self.titleEdgeInsets = UIEdgeInsetsMake(CGRectGetHeight(self.imageView.frame)/2.0, -CGRectGetWidth(self.imageView.frame)/2.0, -CGRectGetHeight(self.imageView.frame)/2.0, CGRectGetWidth(self.imageView.frame)/2.0);
            self.imageEdgeInsets = UIEdgeInsetsMake(-CGRectGetHeight(self.titleLabel.frame)/2.0, CGRectGetWidth(self.titleLabel.frame)/2.0, CGRectGetHeight(self.titleLabel.frame)/2.0, -CGRectGetWidth(self.titleLabel.frame)/2.0);
        }
        return self;
    };
}

#pragma mark - 私有初始化方法
+ (instancetype _Nonnull)ButtonImg:(NSString *)imgName forView:(UIView *_Nullable)superView{
    UIButton *button = [[UIButton alloc] init];
    if (superView) {
        [superView addSubview:button];
    }
    [button setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    if ([RdUtilsManager getManager].fontNameDefault.length != 0) {
        button.titleLabel.font = [UIFont fontWithName:[RdUtilsManager getManager].fontNameDefault size:button.titleLabel.font.pointSize];
    }
    button.clipsToBounds = YES;
    return button;
}

+ (instancetype _Nonnull)ButtonTitle:(NSString *)title forView:(UIView *_Nullable)superView{
    UIButton *button = [[UIButton alloc] init];
    if (superView) {
        [superView addSubview:button];
    }
    [button setTitle:title forState:UIControlStateNormal];
    if ([RdUtilsManager getManager].fontNameDefault.length != 0) {
        button.titleLabel.font = [UIFont fontWithName:[RdUtilsManager getManager].fontNameDefault size:button.titleLabel.font.pointSize];
    }
    button.clipsToBounds = YES;
    return button;
}

+ (instancetype _Nonnull)ButtonforView:(UIView *_Nullable)superView{
    UIButton *button = [[UIButton alloc] init];
    if (superView) {
        [superView addSubview:button];
    }
    if ([RdUtilsManager getManager].fontNameDefault.length != 0) {
        button.titleLabel.font = [UIFont fontWithName:[RdUtilsManager getManager].fontNameDefault size:button.titleLabel.font.pointSize];
    }
    button.clipsToBounds = YES;
    return button;
}





















#pragma mark - 废弃
+ (instancetype _Nonnull)rd_BtnImage:(NSString *)imgName{
    return [UIButton rd_BtnImage:imgName responder:nil];
}

+ (instancetype _Nonnull)rd_BtnImage:(NSString *)imgName responder:(void (^)(UIButton *sender))block{
    UIButton *button = [UIButton ButtonImg:imgName forView:nil];
    [button rd_setButtonAction:block];
    
    return button;
}

+ (instancetype _Nonnull)rd_BtnTitle:(NSString *)title{
    return [UIButton rd_BtnTitle:title responder:nil];
}

+ (instancetype _Nonnull)rd_BtnTitle:(NSString *)title responder:(void (^)(UIButton *sender))block{
    UIButton *button = [UIButton ButtonTitle:title forView:nil];
    [button rd_setButtonAction:block];
    return button;
}

+ (instancetype _Nonnull)rd_BtnTitle:(NSString *)title image:(NSString *)imgName{
    return [UIButton rd_BtnTitle:title image:imgName responder:nil];
}

+ (instancetype _Nonnull)rd_BtnTitle:(NSString *)title image:(NSString *)imgName responder:(void (^)(UIButton *sender))block{
    UIButton *button = [UIButton ButtonTitle:title img:imgName forView:nil];
    [button rd_setButtonAction:block];
    return button;
}

+ (instancetype _Nonnull)rd_BtnBGColor:(UIColor *_Nullable)bgColor superView:(UIView *_Nonnull)superView{
    UIButton *button = [[UIButton alloc] init];
    button.backgroundColor = (bgColor == nil ? [UIColor clearColor] : bgColor);
    if ([RdUtilsManager getManager].fontNameDefault.length != 0) {
        button.titleLabel.font = [UIFont fontWithName:[RdUtilsManager getManager].fontNameDefault size:button.titleLabel.font.pointSize];
    }
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.clipsToBounds = YES;
    [superView addSubview:button];
    return button;
}

+ (instancetype _Nonnull)rd_BtnBGColor:(UIColor *_Nullable)bgColor superView:(UIView *_Nonnull)superView responder:(void (^)(UIButton *sender))block{
    UIButton *button = [[UIButton alloc] init];
    button.backgroundColor = (bgColor == nil ? [UIColor clearColor] : bgColor);
    if ([RdUtilsManager getManager].fontNameDefault.length != 0) {
        button.titleLabel.font = [UIFont fontWithName:[RdUtilsManager getManager].fontNameDefault size:button.titleLabel.font.pointSize];
    }
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.clipsToBounds = YES;
    [superView addSubview:button];
    
    [button rd_setButtonAction:block];
    return button;
}

+ (instancetype _Nonnull)ButtonTitle:(NSString *)title img:(NSString *)imgName  forView:(UIView *_Nullable)superView{
    UIButton *button = [[UIButton alloc] init];
    if (superView) {
        [superView addSubview:button];
    }
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    if ([RdUtilsManager getManager].fontNameDefault.length != 0) {
        button.titleLabel.font = [UIFont fontWithName:[RdUtilsManager getManager].fontNameDefault size:button.titleLabel.font.pointSize];
    }
    button.clipsToBounds = YES;
    return button;
}

- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nonnull title))rd_setButtonTitle{
    return ^(NSString *title) {
        [self setTitle:title forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(NSString *_Nonnull title))rd_setButtonTitleSelected{
    return ^(NSString *title) {
        [self setTitle:title forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(CGFloat fontSize))rd_setButtonTitleFontSize{
    return ^(CGFloat fontSize) {
        if ([RdUtilsManager getManager].fontNameDefault.length == 0) {
            self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        }
        else {
            self.titleLabel.font = [UIFont fontWithName:[RdUtilsManager getManager].fontNameDefault size:fontSize];
        }
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nullable fontName, CGFloat fontSize))rd_setButtonTitleFont{
    return ^(NSString *fontName, CGFloat fontSize) {
        if (fontName == nil) {
            if ([RdUtilsManager getManager].fontNameDefault.length == 0) {
                self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
            }
            else {
                self.titleLabel.font = [UIFont fontWithName:[RdUtilsManager getManager].fontNameDefault size:fontSize];
            }
        }
        else {
            self.titleLabel.font = [UIFont fontWithName:fontName size:fontSize];
        }
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(UIColor * _Nonnull color))rd_setButtonTitleColorNormal{
    return ^(UIColor *color) {
        [self setTitleColor:color forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(UIColor * _Nonnull color))rd_setButtonTitleColorSelected{
    return ^(UIColor *color) {
        [self setTitleColor:color forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton * _Nonnull (^)(UIColor * _Nonnull))rd_setButtonTitleColorDisabled{
    return ^(UIColor *color) {
        [self setTitleColor:color forState:UIControlStateDisabled];
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(UIColor * _Nonnull color))rd_setButtonTitleColorHightlighted{
    return ^(UIColor *color) {
        [self setTitleColor:color forState:UIControlStateHighlighted];
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(UIColor * _Nonnull color))rd_setButtonBgColorNormal{
    return ^(UIColor *color) {
        CGRect frame = self.frame;
        CGFloat width = frame.size.width > 1 ? frame.size.width : 1;
        CGFloat height = frame.size.height > 1 ? frame.size.height : 1;
        
        UIImage *image = [self getImageWith:color width:width height:height];
        
        [self setBackgroundImage:image forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(UIColor * _Nonnull color))rd_setButtonBgColorSelected{
    return ^(UIColor *color) {
        CGRect frame = self.frame;
        CGFloat width = frame.size.width > 1 ? frame.size.width : 1;
        CGFloat height = frame.size.height > 1 ? frame.size.height : 1;
        
        UIImage *image = [self getImageWith:color width:width height:height];
        
        [self setBackgroundImage:image forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(UIColor * _Nonnull color))rd_setButtonBgColorHightlighted{
    return ^(UIColor *color) {
        CGRect frame = self.frame;
        CGFloat width = frame.size.width > 1 ? frame.size.width : 1;
        CGFloat height = frame.size.height > 1 ? frame.size.height : 1;
        
        UIImage *image = [self getImageWith:color width:width height:height];
        
        [self setBackgroundImage:image forState:UIControlStateHighlighted];
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nonnull imageName))rd_setButtonBgImageNormal{
    return ^(NSString *imageName) {
        [self setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton * _Nonnull (^)(NSString * _Nonnull))rd_setButtonBgImageSelected{
    return ^(NSString *imageName) {
        [self setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nonnull imageName))rd_setButtonBgImageHightlighted{
    return ^(NSString *imageName) {
        [self setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nonnull imageName))rd_setButtonImageNormal{
    return ^(NSString *imageName) {
        [self setImage:nil forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nonnull imageName))rd_setButtonImageSelected{
    return ^(NSString *imageName) {
        [self setImage:nil forState:UIControlStateSelected];
        [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton *_Nonnull(^_Nonnull)(NSString * _Nonnull imageName))rd_setButtonImageDisabled{
    return ^(NSString *imageName) {
        [self setImage:nil forState:UIControlStateDisabled];
        [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateDisabled];
        return self;
    };
}



#pragma mark - 辅助方法
- (UIImage *)getImageWith:(UIColor *)color width:(CGFloat)width height:(CGFloat)height{
    CGRect rect = CGRectMake(0.0f, 0.0f, width, height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)rdbuttonClick:(UIButton *)sender{
    if (self.rdActionBlock) {
        self.rdActionBlock(sender);
    }
}

- (void)setRdActionBlock:(void (^)(UIButton *))rdActionBlock{
    objc_setAssociatedObject(self, &rdButtonActionBlockKey, rdActionBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void (^)(UIButton *))rdActionBlock{
    return objc_getAssociatedObject(self, &rdButtonActionBlockKey);
}

@end

