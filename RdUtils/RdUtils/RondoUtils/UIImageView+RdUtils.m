//
//  UIImageView+RdUtils.m
//  Library
//
//  Created by Rondo_dada on 2018/4/11.
//  Copyright © 2018年 Rondo. All rights reserved.
//

#import "UIImageView+RdUtils.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"

@implementation UIImageView (RdUtils)

+ (instancetype _Nonnull)rd_ImageView:(UIColor *)bgColor for:(UIView *_Nonnull)superView{
    UIImageView *view = [[UIImageView alloc] init];
    view.backgroundColor = bgColor ? bgColor : UIColor.clearColor;
    view.contentMode = UIViewContentModeScaleAspectFill;
    view.clipsToBounds = YES;
    view.userInteractionEnabled = YES;
    [superView addSubview:view];
    
    [view mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(view.image.size.width));
        make.height.equalTo(@(view.image.size.height));
    }];
    
    return view;
}

+ (instancetype _Nonnull)rd_ImageViewImage:(NSString *_Nullable)imageName for:(UIView *_Nonnull)superView{
    UIImageView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:(imageName ? imageName : @"")]];
    view.contentMode = UIViewContentModeScaleAspectFill;
    view.clipsToBounds = YES;
    view.userInteractionEnabled = YES;
    [superView addSubview:view];
    
    [view mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(view.image.size.width));
        make.height.equalTo(@(view.image.size.height));
    }];
    
//    view.rd_widthValue(view.image.size.width).rd_heightValue(view.image.size.width);
    
    return view;
}

+ (instancetype _Nonnull)rd_ImageViewPlaceholder:(NSString *_Nonnull)phName url:(NSString *_Nonnull)url for:(UIView *_Nonnull)superView{
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:phName]];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    imageView.userInteractionEnabled = YES;
    [superView addSubview:imageView];
    return imageView;
}

- (void)rd_setImagePlaceholder:(NSString *_Nonnull)phName url:(NSString *_Nonnull)url{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:phName]];
}

- (void)rd_setImagePlaceholder:(NSString *)phName url:(NSString *)url width:(CGFloat)width{
    self.image = [UIImage imageNamed:phName];
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(width/self.image.size.width * self.image.size.height));
    }];
    
    [[SDWebImageManager sharedManager] loadImageWithURL:[NSURL URLWithString:url] options:SDWebImageRetryFailed progress:NULL completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
        if (image) {
            self.image = image;
            [self mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(@(width/self.image.size.width * self.image.size.height));
            }];
        }
    }];
}

@end
