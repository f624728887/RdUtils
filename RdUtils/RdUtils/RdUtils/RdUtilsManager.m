//
//  RdUtilsManager.m
//  RdUtilsProject
//
//  Created by Rondo on 2020/4/1.
//  Copyright © 2020 Rondo. All rights reserved.
//

#import "RdUtilsManager.h"
#import "RdUtilsHeader.h"

static RdUtilsManager *manager = nil;

@interface RdUtilsManager ()

@end

@implementation RdUtilsManager

+ (RdUtilsManager *)getManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[RdUtilsManager alloc] init];
        manager.fontNameDefault = [UILabel rd_getLabelDefaulFontName];
        manager.defaultBackButtonImage = @"";
    });
    
    return manager;
}


@end
