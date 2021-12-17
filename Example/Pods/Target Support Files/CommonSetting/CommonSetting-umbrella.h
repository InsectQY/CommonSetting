#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "QYCommonSetting.h"
#import "QYAboutViewController.h"
#import "QYBaseSettingViewController.h"
#import "QYIntroduce.h"
#import "QYSettings.h"
#import "QYSettingType.h"
#import "QYUtils.h"
#import "UIApplication+QYCategory.h"
#import "QYIntroduceCell.h"
#import "QYIntroduceViewController.h"
#import "QYCommonSettingViewController.h"
#import "QYSettingCell.h"

FOUNDATION_EXPORT double CommonSettingVersionNumber;
FOUNDATION_EXPORT const unsigned char CommonSettingVersionString[];

