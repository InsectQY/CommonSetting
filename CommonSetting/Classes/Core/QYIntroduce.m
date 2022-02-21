//
//  QYIntroduce.m
//  CommonSetting_Example
//
//  Created by insect on 2021/12/16.
//  Copyright © 2021 insect. All rights reserved.
//

#import "QYIntroduce.h"

@implementation QYIntroduce
- (instancetype)initWithTitle:(NSString *)title
                     subTitle:(NSString *)subTitle
                    imageName:(NSString *)imageName {
    self = [super init];
    if (self) {
        self.title = title;
        self.subTitle = subTitle;
        self.imageName = imageName;
    }

    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {

    self = [super init];
    if (self) {
        self.title = [dictionary[@"title"] class] == NSNull.class ? @"" : dictionary[@"title"];
        self.subTitle = [dictionary[@"subTitle"] class] == NSNull.class ? @"" : dictionary[@"subTitle"];
        self.imageName = [dictionary[@"imageName"] class] == NSNull.class ? @"" : dictionary[@"imageName"];
    }

    return self;
}

@end
