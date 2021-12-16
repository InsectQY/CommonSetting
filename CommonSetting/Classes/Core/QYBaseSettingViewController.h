//
//  QYBaseSettingViewController.h
//  demo
//
//  Created by insect on 2021/12/16.
//

#import <UIKit/UIKit.h>

@class QYSettings;

NS_ASSUME_NONNULL_BEGIN

@interface QYBaseSettingViewController : UIViewController

@property(nonatomic, strong) QYSettings *settings;

- (instancetype)initWithSettings:(QYSettings *)settings;


- (void)makeUI;
@end

NS_ASSUME_NONNULL_END
