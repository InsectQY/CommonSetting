//
//  QYUtils.m
//  CommonSetting_Example
//
//  Created by insect on 2021/12/16.
//  Copyright © 2021 insect. All rights reserved.
//

#import "QYUtils.h"
#import "QYSettings.h"

@implementation QYUtils

+ (QYSettings *_Nonnull)decodeSettings {
    
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"MySetting" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL fileURLWithPath:jsonPath]];
    if (!jsonData) {
        NSAssert(false, @"请在主工程中配置一个 MySetting.json 文件，具体结构参考文档");
    }
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:jsonData
                                                               options:NSJSONReadingMutableContainers
                                                                 error:nil];
    if (!dictionary) {
        NSAssert(false, @"MySetting.json 格式不正确，具体结构参考文档");
    }
    return [[QYSettings alloc] initWithDictionary:dictionary];
}

+ (UIImage *_Nullable)getIcon:(NSString *_Nonnull)name {
    NSString *iconName = name.length ? name : @"AppIcon";
    return [UIImage imageNamed:iconName
                      inBundle:NSBundle.mainBundle
 compatibleWithTraitCollection:nil];
}

+ (NSString *)getTitleWithSettingType:(QYSettingType)type {
    switch (type) {
        case QYSettingTypeAbout:
            return @"关于";
        case QYSettingTypeShare:
            return @"分享";
        case QYSettingTypeComment:
            return @"为我们打分";
        case QYSettingTypeFeedback:
            return @"联系我们";
        case QYSettingTypeCleanCache:
            return @"清理缓存";
        case QYSettingTypeIntroduce:
            return @"功能介绍";
    }
}

@end
