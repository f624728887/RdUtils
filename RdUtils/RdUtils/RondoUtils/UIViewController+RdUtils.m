//
//  UIViewController+RdUtils.m
//  iBeauty
//
//  Created by Rondo_dada on 2018/7/19.
//  Copyright © 2018年 Rondo. All rights reserved.
//

#import "UIViewController+RdUtils.h"
#import "UIButton+RdUtils.h"
#import "UILabel+RdUtils.h"
#import "RdMacroFile.h"

@implementation UIViewController (RdUtils)

typedef NS_ENUM(NSUInteger, RdBarButtonType) {
    RdBarButtonTypeLeft,
    RdBarButtonTypeRight,
    
    RdBarButtonTypeJustTitle,
    RdBarButtonTypeJustImg,
    RdBarButtonTypeTitleImg,
};

- (void)rd_ClearBarRightBtn{
    self.navigationItem.rightBarButtonItems = nil;
}

- (void)rd_ClearBarLeftBtn{
    self.navigationItem.leftBarButtonItems = nil;
}

- (void)rd_SetTitle:(NSString *)title textColor:(UIColor *)textColor fontName:(NSString *)fontName fontSize:(float)fontSize{
    title = title == nil ? @"" : title;
    textColor = textColor == nil ? [UIColor clearColor] : textColor;
    fontName = (fontName == nil) ? [RdUtilsManager getManager].fontNameDefault : fontName;
    float width = [UILabel rd_getLabelWidth:title fontName:fontName fontSize:fontSize];
    UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 44)];
    titleView.text = title;
    titleView.textColor = textColor;
    titleView.textAlignment = NSTextAlignmentCenter;
    titleView.font = [UIFont fontWithName:fontName size:fontSize];
    self.navigationItem.titleView = titleView;
}

- (UIButton *_Nonnull)rd_SetDefaultTitleBackBtn{
    [self rd_ClearBarLeftBtn];
    
    Rd_WeakSelf(self);
    return [self rd_SetBtnPos:RdBarButtonTypeLeft type:RdBarButtonTypeJustTitle content:@"返回" responder:^(UIButton *sender) {
        Rd_StrongSelf(self);
        [self.navigationController popViewControllerAnimated:YES];
    }];
}

- (UIButton *_Nonnull)rd_SetDefaultImgBackBtn{
    [self rd_ClearBarLeftBtn];
    Rd_WeakSelf(self);
    return [self rd_SetBtnPos:RdBarButtonTypeLeft type:RdBarButtonTypeJustImg content:[RdUtilsManager getManager].defaultBackButtonImage responder:^(UIButton *sender) {
        Rd_StrongSelf(self);
        [self.navigationController popViewControllerAnimated:YES];
    }];
}

- (UIButton *_Nonnull)rd_SetLeftBtnJustTitle:(NSString *_Nonnull)title responder:(void (^)(UIButton *sender))block{
    return [self rd_SetBtnPos:RdBarButtonTypeLeft type:RdBarButtonTypeJustTitle content:title responder:block];
}

- (UIButton *_Nonnull)rd_SetLeftBtnJustImg:(NSString *_Nonnull)imgName responder:(void (^)(UIButton *sender))block{
    return [self rd_SetBtnPos:RdBarButtonTypeLeft type:RdBarButtonTypeJustImg content:imgName responder:block];
}

- (UIButton *_Nonnull)rd_SetLeftBtnTitle:(NSString *_Nonnull)title img:(NSString *_Nonnull)imgName responder:(void (^)(UIButton *sender))block{
    return [self rd_SetBtnPos:RdBarButtonTypeLeft title:title imgName:imgName responder:block];
}

- (UIButton *_Nonnull)rd_SetRightBtnJustTitle:(NSString *_Nonnull)title responder:(void (^)(UIButton *sender))block{
    return [self rd_SetBtnPos:RdBarButtonTypeRight type:RdBarButtonTypeJustTitle content:title responder:block];
}

- (UIButton *_Nonnull)rd_SetRightBtnJustImg:(NSString *_Nonnull)imgName responder:(void (^)(UIButton *sender))block{
    return [self rd_SetBtnPos:RdBarButtonTypeRight type:RdBarButtonTypeJustImg content:imgName responder:block];
    
}

- (UIButton *_Nonnull)rd_SetRightBtnTitle:(NSString *_Nonnull)title img:(NSString *_Nonnull)imgName responder:(void (^)(UIButton *sender))block{
    return [self rd_SetBtnPos:RdBarButtonTypeRight title:title imgName:imgName responder:block];
}

// 私有方法
- (UIButton *)rd_SetBtnPos:(RdBarButtonType)pos type:(RdBarButtonType)type content:(NSString *)content responder:(void (^)(UIButton *sender))block{
    UIButton *btn;
    CGFloat width = 0.0;
    btn = [[UIButton alloc] init];
    [btn rd_setButtonAction:block];
    if (type == RdBarButtonTypeJustTitle) {
        btn.rd_setTitleWithState(content, UIControlStateNormal).rd_setTitleColorWithState(UIColor.blackColor, UIControlStateNormal);
        width = [self rd_getBtnWidth:[btn.titleLabel rd_getLabelStringWidth]];
    }
    else if (type == RdBarButtonTypeJustImg) {
        btn.rd_setImageWithState(content, UIControlStateNormal);
        width = [self rd_getBtnWidth:btn.imageView.image.size.width];
    }
    btn.frame = CGRectMake(0, 0, width, 44);
    if (pos == RdBarButtonTypeLeft && type == RdBarButtonTypeJustImg) {
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, -(btn.frame.size.width - btn.imageView.image.size.width)/2.0, 0, (btn.frame.size.width - btn.imageView.image.size.width)/2.0);
    }
    else if (pos == RdBarButtonTypeRight && type == RdBarButtonTypeJustImg) {
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, (btn.frame.size.width - btn.imageView.image.size.width)/2.0, 0, -(btn.frame.size.width - btn.imageView.image.size.width)/2.0);
    }
    
    if (pos == RdBarButtonTypeLeft) {
        [self rd_BarBtnItemsAddLeftBtn:btn];
    }
    else {
        [self rd_BarBtnItemsAddRightBtn:btn];
    }
    return btn;
}

- (UIButton *)rd_SetBtnPos:(RdBarButtonType)pos title:(NSString *)title imgName:(NSString *)imageName responder:(void (^)(UIButton *sender))block{
    UIButton *btn = [[UIButton alloc] init];
    [btn rd_setButtonAction:block];
    btn.rd_setTitleWithState(title, UIControlStateNormal).rd_setTitleColorWithState(UIColor.blackColor, UIControlStateNormal).rd_setImageWithState(imageName, UIControlStateNormal);
    CGFloat width = [self rd_getBtnWidth:(btn.imageView.image.size.width + [btn.titleLabel rd_getLabelStringWidth])];
    btn.frame = CGRectMake(0, 0, width, 44);
    
    if (pos == RdBarButtonTypeLeft) {
        [self rd_BarBtnItemsAddLeftBtn:btn];
    }
    else {
        [self rd_BarBtnItemsAddRightBtn:btn];
    }
    return btn;
}

- (void)rd_BarBtnItemsAddLeftBtn:(UIButton *_Nonnull)btn{
    UIBarButtonItem *tmp = [[UIBarButtonItem alloc] initWithCustomView:btn];
    NSMutableArray *array = [self.navigationItem.leftBarButtonItems mutableCopy];
    if (!array) {
        array = [NSMutableArray arrayWithCapacity:0];
    }
    [array addObject:tmp];
    self.navigationItem.leftBarButtonItems = array;
}

- (void)rd_BarBtnItemsAddRightBtn:(UIButton *_Nonnull)btn{
    UIBarButtonItem *tmp = [[UIBarButtonItem alloc] initWithCustomView:btn];
    NSMutableArray *array = [self.navigationItem.rightBarButtonItems mutableCopy];
    if (!array) {
        array = [NSMutableArray arrayWithCapacity:0];
    }
    [array addObject:tmp];
    self.navigationItem.rightBarButtonItems = array;
}

- (CGFloat)rd_getBtnWidth:(CGFloat)width{
    if (width < 44) {
        width = 44;
    }
    return width;
}

- (void)rd_backqweClick{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
