//
//  QYIntroduce.h
//  CommonSetting_Example
//
//  Created by insect on 2021/12/16.
//  Copyright © 2021 insect. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QYIntroduce : NSObject

/// 标题
@property (nonatomic, copy) NSString *title;
/// 子标题
@property (nonatomic, copy) NSString *subTitle;
/// 图片名称
@property (nonatomic, copy) NSString *imageName;

- (instancetype)initWithTitle:(NSString *)title
                     subTitle:(NSString *)subTitle
                    imageName:(NSString *)imageName;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
