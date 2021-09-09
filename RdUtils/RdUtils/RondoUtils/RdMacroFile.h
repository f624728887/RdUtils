//
//  RdMacroFile.h
//  MasonryPackagingTest
//
//  Created by Rondo_dada on 2018/3/19.
//  Copyright © 2018年 Rondo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UILabel+RdUtils.h"
#import "RdUtilsManager.h"

NS_ASSUME_NONNULL_BEGIN

#define Rd_AnimationDuration    0.26f
#define Rd_BarButtonTitleFontSize  16
#define Rd_IGNORE               (CGFloat)CGFLOAT_MAX

#define Rd_WeakSelf(type)        __weak typeof(type) weak##type = type;
#define Rd_StrongSelf(type)      __strong typeof(type) type = weak##type;

//#define Rd_SafeAreaTop          safeAreaTop()
//#define Rd_SafeAreaSides        safeAreaSide()
//#define Rd_SafeAreaBottom       safeAreaBottom()
//
//#define Rd_isiPhoneX            isIPhoneXSeries()
//
//#define Rd_isLandscape          ((Rd_ScreenWidth > Rd_ScreenHeight) ? true : false)


@interface RdMacroFile : NSObject

+ (void)impactFeedback:(UIImpactFeedbackStyle)style;

@end

NS_ASSUME_NONNULL_END

static inline BOOL isIPhoneXSeries() {
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        if (mainWindow.safeAreaInsets.bottom > 0.0) {
            return true;
        }
        return false;
    }
    return false;
}

static inline CGFloat safeAreaTop() {
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        return mainWindow.safeAreaInsets.top;
    }
    return 0;
}

static inline CGFloat safeAreaSide() {
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        return mainWindow.safeAreaInsets.left;
    }
    return 0;
}

static inline CGFloat safeAreaBottom() {
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        return mainWindow.safeAreaInsets.bottom;
    }
    return 0;
}

static inline CGFloat statusbarHeight() {
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        return mainWindow.safeAreaInsets.top;
    }
    return 20;
}

static inline CGFloat screenWidth() {
    return (CGFloat)[[UIScreen mainScreen] bounds].size.width;
}

static inline CGFloat screenHeight() {
    return (CGFloat)[[UIScreen mainScreen] bounds].size.height;
}

static inline CGFloat screenScale() {
    return (CGFloat)[UIScreen mainScreen].scale;
}

static inline BOOL isLandscapeLeftOrRight() {
    return ((screenWidth() > screenHeight()) ? true : false);
}

static inline CGFloat navigationBarHeight() {
    return (CGFloat)(isIPhoneXSeries() ? 44 + safeAreaTop() : 64);
}

static inline CGFloat tabBarHeight() {
    return (CGFloat)(49 + safeAreaBottom());
}

static inline NSString * _Nonnull getJsonWithDic(NSDictionary * _Nonnull dic) {
    if (dic.count == 0) {
        return @"{}";
    }
    NSData *jsonData =[NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    NSString *text =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return text;
}

static inline NSString * _Nonnull getJsonWithArr(NSArray * _Nonnull arr) {
    if (arr.count == 0) {
        return @"[]";
    }
    NSData *jsonData =[NSJSONSerialization dataWithJSONObject:arr options:NSJSONWritingPrettyPrinted error:nil];
    NSString *text =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return text;
}

static inline UIImage * _Nonnull fixImageOrientation(UIImage * _Nonnull aImage) {
    
    // No-op if the orientation is already correct
    if (aImage.imageOrientation == UIImageOrientationUp)
        return aImage;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

//
//// rgb颜色转换（16进制->10进制）
//#define Rd_Color_16(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//#define Rd_Color_RGB_A(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
//
//DEPRECATED_MSG_ATTRIBUTE("请使用JSONModel等工具转换")
//static inline NSArray * getArrWithJson(NSString *string) {
//    NSData *jsonData = [string dataUsingEncoding:NSASCIIStringEncoding];
//
//    NSArray *arr = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
//
//    return arr;
//}
//
//DEPRECATED_MSG_ATTRIBUTE("请使用JSONModel等工具转换")
//static inline NSDictionary * getDicWithJson(NSString *string) {
//    NSData *jsonData = [string dataUsingEncoding:NSASCIIStringEncoding];
//
//    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
//
//    return dic;
//}
//

//#ifndef RdMacroFile_h
//#define RdMacroFile_h
//
//
//#endif /* RdMacroFile_h */

