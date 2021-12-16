//
//  QYIntroduceCell.m
//  demo
//
//  Created by insect on 2021/12/16.
//

#import "QYIntroduceCell.h"
#import "QYIntroduce.h"

@interface QYIntroduceCell()

@property (nonatomic, weak) IBOutlet UIButton *button;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *subTitleLabel;
@property (nonatomic, weak) IBOutlet UIImageView *imageName;

@end

@implementation QYIntroduceCell

- (void)setItem:(QYIntroduce *)item {
    _item = item;
    _titleLabel.text = item.title;
    _subTitleLabel.text = item.subTitle;
    _imageName.image = [UIImage imageNamed:item.imageName
                                  inBundle:NSBundle.mainBundle
             compatibleWithTraitCollection:nil];
}

- (void)setIsLast:(BOOL)isLast {
    _isLast = isLast;
    [_button setTitle:isLast ? @"完成" : @"继续" forState:UIControlStateNormal];
}

- (IBAction)buttonDidClick {
    !_buttonClick ? : _buttonClick();
}

@end
