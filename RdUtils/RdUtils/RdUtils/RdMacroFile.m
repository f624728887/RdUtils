//
//  RdMacroFile.m
//  RdUtils
//
//  Created by Rondo on 2021/9/4.
//

#import "RdMacroFile.h"

@implementation RdMacroFile

+ (void)impactFeedback:(UIImpactFeedbackStyle)style{
    UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle: style];
    [generator prepare];
    [generator impactOccurred];
}

//#define Rd_TapticEngine_Light
//
//
//#define Rd_TapticEngine_Medium           UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle: UIImpactFeedbackStyleMedium];\
//[generator prepare];\
//[generator impactOccurred];
//
//
//#define Rd_TapticEngine_Heavy           UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle: UIImpactFeedbackStyleHeavy];\
//[generator prepare];\
//[generator impactOccurred];
//
//
//#define Rd_Tapic        if (@available(iOS 10.0, *)) {\
//    UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle: UIImpactFeedbackStyleMedium];\
//    [generator prepare];\
//    [generator impactOccurred];\
//}

@end
