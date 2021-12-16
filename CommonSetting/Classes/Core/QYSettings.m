//
//  QYSettings.m
//  CommonSetting_Example
//
//  Created by insect on 2021/12/16.
//  Copyright © 2021 insect. All rights reserved.
//

#import "QYSettings.h"
#import "QYIntroduce.h"

@implementation QYSettings

- (instancetype)initWithAppId:(NSString *)appId
                privacyPolicy:(NSString *)privacyPolicy
                userAgreement:(NSString *)userAgreement
                feedbackEmail:(NSString *)feedbackEmail
                    shareIcon:(NSString *)shareIcon
                    aboutIcon:(NSString *)aboutIcon
                    copyright:(NSString *)copyright
                    introduce:(NSArray<QYIntroduce *> *)introduce {
    self = [super init];
    if (self) {
        self.appId = appId;
        self.privacyPolicy = privacyPolicy;
        self.userAgreement = userAgreement;
        self.feedbackEmail = feedbackEmail;
        self.shareIcon = shareIcon;
        self.aboutIcon = aboutIcon;
        self.copyright = copyright;
        self.introduce = introduce;
    }

    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {

    self = [super init];
    if (self) {
        self.appId = [dictionary[@"appId"] class] == NSNull.class ? @"" : dictionary[@"appId"];
        self.privacyPolicy = [dictionary[@"privacyPolicy"] class] == NSNull.class ? @"" : dictionary[@"privacyPolicy"];
        self.userAgreement = [dictionary[@"userAgreement"] class] == NSNull.class ? @"" : dictionary[@"userAgreement"];
        self.feedbackEmail = [dictionary[@"feedbackEmail"] class] == NSNull.class ? @"" : dictionary[@"feedbackEmail"];
        self.shareIcon = [dictionary[@"shareIcon"] class] == NSNull.class ? @"" : dictionary[@"shareIcon"];
        self.aboutIcon = [dictionary[@"aboutIcon"] class] == NSNull.class ? @"" : dictionary[@"aboutIcon"];
        self.copyright = [dictionary[@"copyright"] class] == NSNull.class ? @"" : dictionary[@"copyright"];

        NSArray<NSDictionary *> *array = [dictionary[@"introduce"] class] == NSNull.class ? @[] :
                dictionary[@"introduce"];
        NSMutableArray<QYIntroduce *> *items = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dic in array) {
            [items addObject:[[QYIntroduce alloc] initWithDictionary:dic]];
        }
        self.introduce = items;
    }

    return self;
}

@end
