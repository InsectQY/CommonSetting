# CommonSetting

[![CI Status](https://img.shields.io/travis/insect/CommonSetting.svg?style=flat)](https://travis-ci.org/insect/CommonSetting)
[![Version](https://img.shields.io/cocoapods/v/CommonSetting.svg?style=flat)](https://cocoapods.org/pods/CommonSetting)
[![License](https://img.shields.io/cocoapods/l/CommonSetting.svg?style=flat)](https://cocoapods.org/pods/CommonSetting)
[![Platform](https://img.shields.io/cocoapods/p/CommonSetting.svg?style=flat)](https://cocoapods.org/pods/CommonSetting)

一行代码集成通用设置页面，支持配置文件和代码两种方式初始化

[Swift 版本](https://github.com/InsectQY/CommonSettingSwift)

## Use

最少你只需要一行代码就能集成 `CommonSetting`，以下两种方式选择其中一种即可。

### 使用配置文件初始化（推荐）

1. 导入头文件

```objective-c
#import <CommonSetting/QYCommonSetting.h>
```

2. 在主工程中创建一个 `MySetting.json` 文件，配置需要自定义的参数

```json
{
    "appId": "上架到 App Store 时的 appId",
    "privacyPolicy": "隐私政策地址",
    "userAgreement": "用户协议地址",
    "feedbackEmail": "用于联系我们时显示的 email",
    "shareIcon": "分享用的 Icon 名称，若不配置则默认使用 AppIcon",
    "aboutIcon": "关于界面用的 Icon 名称，若不配置则默认使用 AppIcon",
    "copyright": "版权信息",
    "introduce": [
        {
            "title" : "标题",
            "subTitle" : "副标题",
            "imageName": "图片名称"
        
        },
        {
            "title" : "标题",
            "subTitle" : "副标题",
            "imageName": "图片名称"
        }
    ]
}
```

3. 初始化控制器

```objective-c
QYCommonSettingViewController *vc = [[QYCommonSettingViewController alloc]init];
```

4. 将其加入导航控制器中

```objective-c
[self.navigationController pushViewController:vc animated:YES];
```

或者

```objective-c
[[UINavigationController alloc]initWithRootViewController:vc];
```

### 使用代码初始化

1. 导入头文件

2. 初始化 `QYSettings` 对象

```objective-c
- (instancetype)initWithAppId:(NSString *)appId
                privacyPolicy:(NSString *)privacyPolicy
                userAgreement:(NSString *)userAgreement
                feedbackEmail:(NSString *)feedbackEmail
                    shareIcon:(NSString *)shareIcon
                    aboutIcon:(NSString *)aboutIcon
                    copyright:(NSString *)copyright
                    introduce:(NSArray<QYIntroduce *> *)introduce;
```

3. 初始化控制器

```objective-c
QYCommonSettingViewController *vc = [[QYCommonSettingViewController alloc]init];
```

4. 将其加入导航控制器中

```objective-c
[self.navigationController pushViewController:vc animated:YES];
```

或者

```objective-c
[[UINavigationController alloc]initWithRootViewController:vc];
```

## Requirements

iOS 9.0+

## Installation

CommonSetting is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CommonSetting'
```

## License

CommonSetting is available under the MIT license. See the LICENSE file for more info.
