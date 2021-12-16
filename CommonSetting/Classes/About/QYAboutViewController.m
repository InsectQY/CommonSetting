//
//  QYAboutViewController.m
//  demo
//
//  Created by insect on 2021/12/16.
//

#import <SafariServices/SafariServices.h>
#import "QYAboutViewController.h"
#import "UIApplication+QYCategory.h"
#import "QYSettings.h"
#import "QYUtils.h"

@interface QYAboutViewController ()

@property(weak, nonatomic) IBOutlet UIImageView *iconImage;
@property(weak, nonatomic) IBOutlet UILabel *nameLabel;
@property(weak, nonatomic) IBOutlet UILabel *versionLabel;
@property(weak, nonatomic) IBOutlet UIButton *privacyButton;
@property(weak, nonatomic) IBOutlet UIButton *userAgreementButton;
@property(weak, nonatomic) IBOutlet UILabel *copyrightLabel;

@end

@implementation QYAboutViewController

- (void)makeUI {
    [super makeUI];
    self.navigationItem.title = @"关于";
    _nameLabel.text = UIApplication.displayName;
    _versionLabel.text = [NSString stringWithFormat:@"v%@", UIApplication.version];
    _iconImage.image = [QYUtils getIcon:super.settings.aboutIcon];
    if (super.settings.copyright.length) {
        _copyrightLabel.text = super.settings.copyright;
    }
}

- (IBAction)userAgreementButtonDidClick {

    if (!super.settings.userAgreement.length) {
        NSAssert(false, @"userAgreement 未正确配置");
    }
    NSURL *url = [NSURL URLWithString:super.settings
                                           .userAgreement];
    SFSafariViewController *controller = [[SFSafariViewController alloc] initWithURL:url];
    [self presentViewController:controller
                       animated:YES
                     completion:nil];
}

- (IBAction)privacyButtonDidClick {
    
    if (!super.settings.privacyPolicy.length) {
        NSAssert(false, @"privacyPolicy 未正确配置");
    }

    NSURL *url = [NSURL URLWithString:super.settings
                                           .privacyPolicy];
    SFSafariViewController *controller = [[SFSafariViewController alloc] initWithURL:url];
    [self presentViewController:controller
                       animated:YES
                     completion:nil];
}

@end
