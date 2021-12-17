//
//  QYUtils.h
//  CommonSetting_Example
//
//  Created by insect on 2021/12/16.
//  Copyright © 2021 insect. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QYSettingType.h"
@class QYSettings;

@interface QYUtils : NSObject

+ (QYSettings * _Nonnull)decodeSettings;

+ (UIImage * _Nullable)getIcon:(NSString * _Nonnull)name;

+ (NSString * _Nonnull)getTitleWithSettingType:(QYSettingType)type;

+ (NSBundle * _Nonnull)getBundle;

@end
