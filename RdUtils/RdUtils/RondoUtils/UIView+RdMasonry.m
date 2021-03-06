//
//  UIView+RdMasonry.m
//  MasonryPackagingTest
//
//  Created by Rondo_dada on 2018/3/12.
//  Copyright © 2018年 Rondo. All rights reserved.
//

#import "UIView+RdMasonry.h"
#import "Masonry.h"
#import "UIView+RdUtils.h"

@implementation UIView (RdMasonry)

/**
 *等于
 */
- (UIView *_Nonnull(^_Nonnull)(CGFloat width, CGFloat height))rd_sizeValue{
    return ^(CGFloat width, CGFloat height) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(width));
            make.height.equalTo(@(height));
        }];
        return self;
    };
}

/**
 *等于
 */
- (UIView *_Nonnull(^_Nonnull)(CGFloat width))rd_widthValue{
    return ^(CGFloat width) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(width));
        }];
        return self;
    };
}
- (UIView *_Nonnull(^_Nonnull)(CGFloat height))rd_heightValue{
    return ^(CGFloat height) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(height));
        }];
        return self;
    };
}

/**
 *小于等于
 */
- (UIView *_Nonnull(^_Nonnull)(CGFloat width))rd_widthMaxValue{
    return ^(CGFloat width) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.lessThanOrEqualTo(@(width));
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(CGFloat height))rd_heightMaxValue{
    return ^(CGFloat height) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.lessThanOrEqualTo(@(height));
        }];
        return self;
    };
}

/**
 *大于等于
 */
- (UIView *_Nonnull(^_Nonnull)(CGFloat width))rd_widthMinValue{
    return ^(CGFloat width) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.greaterThanOrEqualTo(@(width));
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(CGFloat height))rd_heightMinValue{
    return ^(CGFloat height) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.greaterThanOrEqualTo(@(height));
        }];
        return self;
    };
}

/**
 *优先级
 */
/// 数值越大优先级越高.最高1000. high = 750, medium = 250~750, Low = 250.
- (UIView *_Nonnull(^_Nonnull)(CGFloat width, CGFloat priority))rd_widthValuePriority{
    return ^(CGFloat width, CGFloat priority) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(width)).priority(priority);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(CGFloat height, CGFloat priority))rd_heightValuePriority{
    return ^(CGFloat height, CGFloat priority) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(height)).priority(priority);
        }];
        return self;
    };
}

/**
 *等于
 */
- (UIView *_Nonnull(^_Nonnull)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right))rd_edgeEqualTo{
    return ^(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right) {
        if (top != CGFLOAT_MAX) {
            self.rd_topEqualTo(nil, top);
        }
        if (left != CGFLOAT_MAX) {
            self.rd_leftEqualTo(nil, left);
        }
        if (bottom != CGFLOAT_MAX) {
            self.rd_bottomEqualTo(nil, bottom);
        }
        if (right != CGFLOAT_MAX) {
            self.rd_rightEqualTo(nil, right);
        }
        return self;
    };
}

/**
 *小于等于
 */
- (UIView *_Nonnull(^_Nonnull)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right))rd_edgeLessOrEqualTo{
    return ^(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right) {
        if (top != CGFLOAT_MAX) {
            self.rd_topLessOrEqualTo(nil, top);
        }
        if (left != CGFLOAT_MAX) {
            self.rd_leftLessOrEqualTo(nil, left);
        }
        if (bottom != CGFLOAT_MAX) {
            self.rd_bottomLessOrEqualTo(nil, bottom);
        }
        if (right != CGFLOAT_MAX) {
            self.rd_rightLessOrEqualTo(nil, right);
        }
        return self;
    };
}

/**
 *等于
 */

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_topEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_bottomEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_leftEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_rightEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

/**
 *小于等于
 */
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_topLessOrEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.lessThanOrEqualTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_bottomLessOrEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.lessThanOrEqualTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_leftLessOrEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.lessThanOrEqualTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_rightLessOrEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.lessThanOrEqualTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

/**
 *大于等于
 */
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_topGreaterOrEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.greaterThanOrEqualTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_bottomGreaterOrEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.greaterThanOrEqualTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_leftGreaterOrEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.greaterThanOrEqualTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_rightGreaterOrEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.greaterThanOrEqualTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

/**
 *优先级
 */
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset, CGFloat priority))rd_topEqualPriorityTo{
    return ^(UIView *otherView, CGFloat offset, CGFloat priority) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo((otherView == nil ? self.superview : otherView)).offset(offset).priority(priority);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset, CGFloat priority))rd_bottomEqualPriorityTo{
    return ^(UIView *otherView, CGFloat offset, CGFloat priority) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo((otherView == nil ? self.superview : otherView)).offset(offset).priority(priority);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset, CGFloat priority))rd_leftEqualPriorityTo{
    return ^(UIView *otherView, CGFloat offset, CGFloat priority) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo((otherView == nil ? self.superview : otherView)).offset(offset).priority(priority);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset, CGFloat priority))rd_rightEqualPriorityTo{
    return ^(UIView *otherView, CGFloat offset, CGFloat priority) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo((otherView == nil ? self.superview : otherView)).offset(offset).priority(priority);
        }];
        return self;
    };
}

/**
 *等于
 */
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_centerXEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_centerYEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView))rd_centerEqualTo{
    return ^(UIView *otherView) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo((otherView == nil ? self.superview : otherView));
        }];
        return self;
    };
}

/**
 *小于等于
 */
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_centerXLessOrEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.lessThanOrEqualTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_centerYLessOrEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerY.lessThanOrEqualTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

/**
 *大于等于
 */
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_centerXGreaterOrEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.greaterThanOrEqualTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_centerYGreaterOrEqualTo{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerY.greaterThanOrEqualTo((otherView == nil ? self.superview : otherView)).offset(offset);
        }];
        return self;
    };
}

/**
 *优先级
 */
/// 数值越大优先级越高.最高1000. high = 750, medium = 250~750, Low = 250.
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset, CGFloat priority))rd_centerXEqualPriorityTo{
    return ^(UIView *otherView, CGFloat offset, CGFloat priority) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo((otherView == nil ? self.superview : otherView)).offset(offset).priority(priority);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset, CGFloat priority))rd_centerYEqualPriorityTo{
    return ^(UIView *otherView, CGFloat offset, CGFloat priority) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo((otherView == nil ? self.superview : otherView)).offset(offset).priority(priority);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat priority))rd_centerEqualPriorityTo{
    return ^(UIView *otherView, CGFloat priority) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo((otherView == nil ? self.superview : otherView)).priority(priority);
        }];
        return self;
    };
}


/**
 *等于
 */
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat multiple))rd_widthMultipliedBy{
    return ^(UIView *otherView, CGFloat multiple) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo((otherView == nil ? self.superview : otherView)).multipliedBy(multiple);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat multiple))rd_heightMultipliedBy{
    return ^(UIView *otherView, CGFloat multiple) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo((otherView == nil ? self.superview : otherView)).multipliedBy(multiple);
        }];
        return self;
    };
}

/**
 *小于等于
 */
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat multiple))rd_widthLessOrEqualMultipliedBy{
    return ^(UIView *otherView, CGFloat multiple) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.lessThanOrEqualTo((otherView == nil ? self.superview : otherView)).multipliedBy(multiple);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat multiple))rd_heightLessOrEqualMultipliedBy{
    return ^(UIView *otherView, CGFloat multiple) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.lessThanOrEqualTo((otherView == nil ? self.superview : otherView)).multipliedBy(multiple);
        }];
        return self;
    };
}

/**
 *大于等于
 */
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat multiple))rd_widthGreaterOrEqualMultipliedBy{
    return ^(UIView *otherView, CGFloat multiple) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.greaterThanOrEqualTo((otherView == nil ? self.superview : otherView)).multipliedBy(multiple);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat multiple))rd_heightGreaterOrEqualMultipliedBy{
    return ^(UIView *otherView, CGFloat multiple) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.greaterThanOrEqualTo((otherView == nil ? self.superview : otherView)).multipliedBy(multiple);
        }];
        return self;
    };
}

/**
 *优先级
 */
/// 数值越大优先级越高.最高1000. high = 750, medium = 250~750, Low = 250.
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat multiple, CGFloat priority))rd_widthMultipliedPriorityBy{
    return ^(UIView *otherView, CGFloat multiple, CGFloat priority) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo((otherView == nil ? self.superview : otherView)).multipliedBy(multiple).priority(priority);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat multiple, CGFloat priority))rd_heightMultipliedPriorityBy{
    return ^(UIView *otherView, CGFloat multiple, CGFloat priority) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo((otherView == nil ? self.superview : otherView)).multipliedBy(multiple).priority(priority);
        }];
        return self;
    };
}

/**
 *等于
 */
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_topToBottmOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo((otherView == nil ? self.superview : otherView).mas_bottom).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_bottomToTopOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo((otherView == nil ? self.superview : otherView).mas_top).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_leftToRightOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo((otherView == nil ? self.superview : otherView).mas_right).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_rightToLeftOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo((otherView == nil ? self.superview : otherView).mas_left).offset(offset);
        }];
        return self;
    };
}

/**
 *小于等于
 */
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_topLessOrEqualToBottmOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.lessThanOrEqualTo((otherView == nil ? self.superview : otherView).mas_bottom).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_bottomLessOrEqualToTopOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.lessThanOrEqualTo((otherView == nil ? self.superview : otherView).mas_top).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_leftLessOrEqualToRightOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.lessThanOrEqualTo((otherView == nil ? self.superview : otherView).mas_right).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_rightLessOrEqualToLeftOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.lessThanOrEqualTo((otherView == nil ? self.superview : otherView).mas_left).offset(offset);
        }];
        return self;
    };
}

/**
 *大于等于
 */
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_topGreaterOrEqualToBottmOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.greaterThanOrEqualTo((otherView == nil ? self.superview : otherView).mas_bottom).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_bottomGreaterOrEqualToTopOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.greaterThanOrEqualTo((otherView == nil ? self.superview : otherView).mas_top).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_leftGreaterOrEqualToRightOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.greaterThanOrEqualTo((otherView == nil ? self.superview : otherView).mas_right).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_rightGreaterOrEqualToLeftOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.greaterThanOrEqualTo((otherView == nil ? self.superview : otherView).mas_left).offset(offset);
        }];
        return self;
    };
}

/**
 *优先级
 */
/// 数值越大优先级越高.最高1000. high = 750, medium = 250~750, Low = 250.
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset, CGFloat priority))rd_topToBottmPriorityOf{
    return ^(UIView *otherView, CGFloat offset, CGFloat priority) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo((otherView == nil ? self.superview : otherView).mas_bottom).offset(offset).priority(priority);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset, CGFloat priority))rd_bottomToTopPriorityOf{
    return ^(UIView *otherView, CGFloat offset, CGFloat priority) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo((otherView == nil ? self.superview : otherView).mas_top).offset(offset).priority(priority);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset, CGFloat priority))rd_leftToRightPriorityOf{
    return ^(UIView *otherView, CGFloat offset, CGFloat priority) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo((otherView == nil ? self.superview : otherView).mas_right).offset(offset).priority(priority);
        }];
        return self;
    };
}
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset, CGFloat priority))rd_rightToLeftPriorityOf{
    return ^(UIView *otherView, CGFloat offset, CGFloat priority) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo((otherView == nil ? self.superview : otherView).mas_right).offset(offset).priority(priority);
        }];
        return self;
    };
}

/**
 *等于
 */
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_topToCenterYOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo((otherView == nil ? self.superview : otherView).mas_centerY).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_bottomToCenterYOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo((otherView == nil ? self.superview : otherView).mas_centerY).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_leftToCenterXOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo((otherView == nil ? self.superview : otherView).mas_centerX).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_rightToCenterXOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo((otherView == nil ? self.superview : otherView).mas_centerX).offset(offset);
        }];
        return self;
    };
}

/**
 *小于等于
 */
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_topLessOrEqualToCenterYOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.lessThanOrEqualTo((otherView == nil ? self.superview : otherView).mas_centerY).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_bottomLessOrEqualToCenterYOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.lessThanOrEqualTo((otherView == nil ? self.superview : otherView).mas_centerY).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_leftLessOrEqualToCenterXOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.lessThanOrEqualTo((otherView == nil ? self.superview : otherView).mas_centerX).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_rightLessOrEqualToCenterXOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.lessThanOrEqualTo((otherView == nil ? self.superview : otherView).mas_centerX).offset(offset);
        }];
        return self;
    };
}

/**
 *大于等于
 */
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_topGreaterOrEqualToCenterYOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.greaterThanOrEqualTo((otherView == nil ? self.superview : otherView).mas_centerY).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_bottomGreaterOrEqualToCenterYOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.greaterThanOrEqualTo((otherView == nil ? self.superview : otherView).mas_centerY).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_leftGreaterOrEqualToCenterXOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.greaterThanOrEqualTo((otherView == nil ? self.superview : otherView).mas_centerX).offset(offset);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset))rd_rightGreaterOrEqualToCenterXOf{
    return ^(UIView *otherView, CGFloat offset) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.greaterThanOrEqualTo((otherView == nil ? self.superview : otherView).mas_centerX).offset(offset);
        }];
        return self;
    };
}

/**
 *优先级
 */
/// 数值越大优先级越高.最高1000. high = 750, medium = 250~750, Low = 250.
- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset, CGFloat priority))rd_topToCenterYPriorityOf{
    return ^(UIView *otherView, CGFloat offset, CGFloat priority) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo((otherView == nil ? self.superview : otherView).mas_centerY).offset(offset).priority(priority);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset, CGFloat priority))rd_bottomToCenterYPriorityOf{
    return ^(UIView *otherView, CGFloat offset, CGFloat priority) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo((otherView == nil ? self.superview : otherView).mas_centerY).offset(offset).priority(priority);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset, CGFloat priority))rd_leftToCenterXPriorityOf{
    return ^(UIView *otherView, CGFloat offset, CGFloat priority) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo((otherView == nil ? self.superview : otherView).mas_centerX).offset(offset).priority(priority);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView * _Nullable otherView, CGFloat offset, CGFloat priority))rd_rightToCenterXPriorityOf{
    return ^(UIView *otherView, CGFloat offset, CGFloat priority) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo((otherView == nil ? self.superview : otherView).mas_centerX).offset(offset).priority(priority);
        }];
        return self;
    };
}

- (UIView *_Nonnull(^_Nonnull)(UIView *_Nonnull chileView, CGFloat interval))rd_addHorizontalSubview{
    return ^(UIView *chileView, CGFloat interval) {
        if (self.subviews.count == 0) {
            [self addSubview:chileView];
            chileView.rd_leftEqualTo(nil, 0);
            [chileView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.right.lessThanOrEqualTo(self);
            }];
        }
        else {
            if (self.subviews.lastObject != chileView) {
                UIView *before = self.subviews.lastObject;
                [self addSubview:chileView];
                chileView.rd_leftToRightOf(before, interval);
                [chileView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.right.lessThanOrEqualTo(self);
                }];
            }
            else {
                if (self.subviews.count == 1) {
                    chileView.rd_leftEqualTo(nil, 0);
                    [chileView mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.right.lessThanOrEqualTo(self);
                    }];
                }
                else {
                    UIView *before = [self.subviews objectAtIndex:(self.subviews.count - 2)];
                    chileView.rd_leftToRightOf(before, interval);
                    [chileView mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.right.lessThanOrEqualTo(self);
                    }];
                }
            }
        }
        return self;
    };
}

- (void)rdAddHorizontalView:(UIView * _Nonnull)chileView interval:(CGFloat)interval{
    self.rd_addHorizontalSubview(chileView, interval);
}

- (UIView *_Nonnull(^_Nonnull)(UIView *_Nonnull chileView, CGFloat interval))rd_addVerticalSubview{
    return ^(UIView *chileView, CGFloat interval) {
        if (self.subviews.count == 0) {
            [self addSubview:chileView];
            chileView.rd_topEqualTo(nil, 0);
            [chileView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.bottom.lessThanOrEqualTo(self);
            }];
        }
        else {
            if (self.subviews.lastObject != chileView) {
                UIView *before = self.subviews.lastObject;
                [self addSubview:chileView];
                chileView.rd_topToBottmOf(before, interval);
                [chileView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.bottom.lessThanOrEqualTo(self);
                }];
            }
            else {
                if (self.subviews.count == 1) {
                    chileView.rd_topEqualTo(nil, 0);
                    [chileView mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.bottom.lessThanOrEqualTo(self);
                    }];
                }
                else {
                    UIView *before = [self.subviews objectAtIndex:(self.subviews.count - 2)];
                    chileView.rd_topToBottmOf(before, interval);
                    [chileView mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.bottom.lessThanOrEqualTo(self);
                    }];
                }
            }
        }
        return self;
    };
}

- (void)rdAddVerticalView:(UIView * _Nonnull)chileView interval:(CGFloat)interval{
    self.rd_addVerticalSubview(chileView, interval);
}

- (UIView *_Nonnull(^_Nonnull)(UIView *_Nonnull chileView, CGFloat chileWidth))rd_addCollectionView{
    return ^(UIView *chileView, CGFloat chileWidth) {
        // 当缩放因子为2倍时，布局值最小值为0.5，布局取值会取最接近整数或0.5，（eg. 12.4 会变成 12.5）;所以小于0.5的直接取整，大于0.5的直接取0.5，防止值变大。
        if ([UIScreen mainScreen].scale == 2) {
            chileWidth = (int)(chileWidth/0.5)*0.5;
        }
        // 当缩放因子为3倍时，布局之最小值为0.33333，布局值会去最接近0.333、0.6667、整数。（eg. 12.30 会变成12.3333）；所以为了防止值变大，小数小于0.4取整。大于等于0.4且小于0.7取0.3，大于等于0.7取0.6。
        else {
            int integerNumber = (int)(chileWidth/1);
            CGFloat remainderNumber = chileWidth - integerNumber;

            if (remainderNumber < 0.4) {
                chileWidth = integerNumber;
            }
            else if (remainderNumber >= 0.4 && remainderNumber < 0.7) {
                chileWidth = integerNumber + 0.3;
            }
            else {
                chileWidth = integerNumber + 0.6;
            }
        }
        chileView.rd_widthValue(chileWidth);
        [chileView layoutIfNeeded];
        
        if (self.subviews.count == 0) {
            [self addSubview:chileView];
            chileView.rd_leftEqualTo(nil, 0).rd_topEqualTo(nil, 0);
        }
        else{
            if (self.subviews.lastObject != chileView) {
                UIView *before = self.subviews.lastObject;
                [self addSubview:chileView];
                if (before.rd_MaxX + chileView.rd_Width <= self.rd_Width) {
                    // 不换行
                    chileView.rd_leftEqualTo(nil, before.rd_MaxX).rd_topEqualTo(nil, before.rd_MinY);
                }
                else {
                    // 换行
                    chileView.rd_leftEqualTo(nil, 0).rd_topEqualTo(nil, before.rd_MaxY);
                }
            }
            else {
                if (self.subviews.count == 1) {
                    chileView.rd_leftEqualTo(nil, 0).rd_topEqualTo(nil, 0);
                }
                else {
                    UIView *before = [self.subviews objectAtIndex:(self.subviews.count - 2)];
                    [self addSubview:chileView];
                    if (before.rd_MaxX + chileView.rd_Width <= self.rd_Width) {
                        // 不换行
                        chileView.rd_leftEqualTo(nil, before.rd_MaxX).rd_topEqualTo(nil, before.rd_MinY);
                    }
                    else {
                        // 换行
                        chileView.rd_leftEqualTo(nil, 0).rd_topEqualTo(nil, before.rd_MaxY);
                    }
                }
            }
        }
        chileView.rd_bottomLessOrEqualTo(nil, 0);
        [chileView layoutIfNeeded];
        return self;
    };
}

- (void)rdAddCollectionView:(UIView *_Nonnull)chileView width:(CGFloat)chileWidth{
    self.rd_addCollectionView(chileView, chileWidth);
}

- (void)rd_removeConstraint{
    [self mas_remakeConstraints:^(MASConstraintMaker *make) {
        
    }];
}


@end


