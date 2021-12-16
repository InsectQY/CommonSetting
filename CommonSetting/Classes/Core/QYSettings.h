//
//  QYSettings.h
//  CommonSetting_Example
//
//  Created by insect on 2021/12/16.
//  Copyright © 2021 insect. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QYIntroduce;

NS_ASSUME_NONNULL_BEGIN

@interface QYSettings : NSObject

/// app Id
@property(nonatomic, copy) NSString *appId;
/// 隐私政策
@property(nonatomic, copy) NSString *privacyPolicy;
/// 用户协议
@property(nonatomic, copy) NSString *userAgreement;
/// 联系我们显示的邮箱
@property(nonatomic, copy) NSString *feedbackEmail;
/// 分享时显示的 icon (若不配置，则默认获取 appIcon)
@property(nonatomic, copy) NSString *shareIcon;
/// 关于界面现实的 icon (若不配置，则默认获取 appIcon)
@property(nonatomic, copy) NSString *aboutIcon;
/// 版权信息
@property(nonatomic, copy) NSString *copyright;
/// 功能介绍界面的数据
@property(nonatomic, strong) NSArray<QYIntroduce *> *introduce;

- (instancetype)initWithAppId:(NSString *)appId
                privacyPolicy:(NSString *)privacyPolicy
                userAgreement:(NSString *)userAgreement
                feedbackEmail:(NSString *)feedbackEmail
                    shareIcon:(NSString *)shareIcon
                    aboutIcon:(NSString *)aboutIcon
                    copyright:(NSString *)copyright
                    introduce:(NSArray<QYIntroduce *> *)introduce;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
