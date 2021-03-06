//
//  UIImage+RdUtils.m
//  iBeauty
//
//  Created by Rondo_dada on 2018/7/20.
//  Copyright © 2018年 Rondo. All rights reserved.
//

#import "UIImage+RdUtils.h"

@implementation UIImage (RdUtils)

+ (UIImage *_Nonnull)rd_ImageStretched:(NSString *_Nonnull)imgName;{
    UIImage *image = [UIImage imageNamed:imgName];
    CGFloat top = image.size.height * 0.5;
    CGFloat left = image.size.width * 0.5;
    CGFloat bottom = image.size.height * 0.5;
    CGFloat right = image.size.width * 0.5;
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(top, left, bottom, right);
    UIImageResizingMode mode = UIImageResizingModeStretch;
    UIImage *newImage = [image resizableImageWithCapInsets:edgeInsets resizingMode:mode];
    return newImage;
}

@end
