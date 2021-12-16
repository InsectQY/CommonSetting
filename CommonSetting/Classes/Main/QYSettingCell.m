//
//  QYSettingCell.m
//  demo
//
//  Created by insect on 2021/12/16.
//

#import "QYSettingCell.h"

@interface QYSettingCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation QYSettingCell

+ (CGFloat)height {
    return 55;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    _titleLabel.text = title;
}


@end
