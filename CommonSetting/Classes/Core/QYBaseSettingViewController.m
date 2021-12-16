//
//  QYBaseSettingViewController.m
//  demo
//
//  Created by insect on 2021/12/16.
//

#import "QYBaseSettingViewController.h"
#import "QYSettings.h"
#import "QYUtils.h"

@implementation QYBaseSettingViewController

- (instancetype)initWithSettings:(QYSettings *)settings {
    self = [super initWithNibName:nil bundle:[NSBundle bundleForClass:[QYBaseSettingViewController class]]];
    if (self) {
        self.settings = settings;
    }

    return self;
}

- (instancetype)init {
    self = [super initWithNibName:nil bundle:[NSBundle bundleForClass:[QYBaseSettingViewController class]]];
    if (self) {
        self.settings = [QYUtils decodeSettings];
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeUI];
}

- (void)makeUI {
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
