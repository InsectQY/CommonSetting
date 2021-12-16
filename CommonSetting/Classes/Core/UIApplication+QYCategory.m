//
//  UIApplication+QYCategory.m
//  demo
//
//  Created by insect on 2021/12/16.
//

#import "UIApplication+QYCategory.h"

@implementation UIApplication (QYCategory)

+ (NSString *)displayName {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
}

+ (NSString *)version {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

@end
