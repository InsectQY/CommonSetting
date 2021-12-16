//
// Created by insect on 2021/12/16.
//

#import "QYCommonSettingViewController.h"
#import "QYSettingType.h"
#import "QYSettings.h"
#import "QYSettingCell.h"
#import "QYUtils.h"
#import "UIApplication+QYCategory.h"
#import "QYAboutViewController.h"
#import "QYIntroduceViewController.h"

static NSString *const kReuseIdentifier = @"reuseIdentifier";

@interface QYCommonSettingViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSArray *items;

@end

@implementation QYCommonSettingViewController

- (void)makeUI {
    [super makeUI];
    [self.view addSubview:self.tableView];
    _items = @[@(QYSettingTypeIntroduce),
               @(QYSettingTypeCleanCache),
               @(QYSettingTypeFeedback),
               @(QYSettingTypeShare),
               @(QYSettingTypeComment),
               @(QYSettingTypeAbout)];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QYSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:kReuseIdentifier];
    QYSettingType type = [_items[indexPath.row] integerValue];
    cell.title = [QYUtils getTitleWithSettingType:type];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)      tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    QYSettingType type = [_items[indexPath.row] integerValue];
    switch (type) {
        case QYSettingTypeAbout:
            [self about];
            break;
        case QYSettingTypeShare:
            [self share];
            break;
        case QYSettingTypeComment:
            [self comment];
            break;
        case QYSettingTypeFeedback:
            [self feedback];
            break;
        case QYSettingTypeCleanCache:
            [self cleanCache];
            break;
        case QYSettingTypeIntroduce:
            [self introduce];
            break;
    }
}

#pragma mark - cell 点击事件

- (void)about {
    QYAboutViewController *vc = [[QYAboutViewController alloc]initWithSettings:super.settings];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)share {

    if (!super.settings.appId.length) {
        NSAssert(false, @"appId 未正确配置");
    }

    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://itunes.apple.com/us/app/id%@", super.settings
                                                                                                              .appId]];
    NSArray *activityItems = @[UIApplication.displayName,
                               [QYUtils getIcon:super.settings.shareIcon],
                               url];
    UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:activityItems
                                                                             applicationActivities:nil];
    [self presentViewController:controller animated:YES
                     completion:nil];
}

- (void)comment {

    if (!super.settings.appId.length) {
        NSAssert(false, @"appId 未正确配置");
    }

    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/us/app/itunes-u/id%@?action=write-review&mt=8",
                                                                 super.settings
                                                                      .appId]];
    if (@available(iOS 10.0, *)) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
    } else {
        [[UIApplication sharedApplication] openURL:url];
    }
}

- (void)feedback {

    NSString *message = [NSString
            stringWithFormat:@"如果有问题需要反馈，或寻求帮助，可以通过以下方式联系我们：\n\n Email: %@",super.settings.feedbackEmail];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"意见反馈"
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定"
                                                        style:UIAlertActionStyleCancel
                                                      handler:nil]];
    [self presentViewController:alertController
                       animated:YES
                     completion:nil];
}

- (void)cleanCache {

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"将清空所有缓存，是否继续？"
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    __weak __typeof(self)weakSelf = self;
    [alertController addAction:[UIAlertAction actionWithTitle:@"立即清空"
                                                        style:UIAlertActionStyleDestructive
                                                      handler:^(UIAlertAction *action) {
                                                          [weakSelf clearCache];
                                                      }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消"
                                                        style:UIAlertActionStyleCancel
                                                      handler:nil]];
    [self presentViewController:alertController
                       animated:YES
                     completion:nil];
}

- (void)clearCache {
    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    NSArray<NSString *> *files = [NSFileManager.defaultManager subpathsAtPath:cachePath];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{

        for (NSString *file in files) {
            if ([NSFileManager.defaultManager fileExistsAtPath:file]) {
                [NSFileManager.defaultManager removeItemAtPath:file error:nil];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{

            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"缓存清除成功"
                                                                                     message:nil
                                                                              preferredStyle:UIAlertControllerStyleAlert];
            [alertController addAction:[UIAlertAction actionWithTitle:@"确定"
                                                                style:UIAlertActionStyleCancel
                                                              handler:nil]];
            [self presentViewController:alertController
                               animated:YES
                             completion:nil];
        });
    });
}

- (void)introduce {
    
    QYIntroduceViewController *vc = [[QYIntroduceViewController alloc]initWithSettings:super.settings];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Lazyload

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = [QYSettingCell height];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        UINib *nib = [UINib nibWithNibName:@"QYSettingCell"
                                    bundle:[NSBundle bundleForClass:[QYCommonSettingViewController class]]];
        [_tableView registerNib:nib
         forCellReuseIdentifier:kReuseIdentifier];
    }
    return _tableView;
}

@end
