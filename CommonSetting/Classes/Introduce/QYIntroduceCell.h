//
//  QYIntroduceCell.h
//  demo
//
//  Created by insect on 2021/12/16.
//

#import <UIKit/UIKit.h>
@class QYIntroduce;

NS_ASSUME_NONNULL_BEGIN

@interface QYIntroduceCell : UICollectionViewCell

@property(nonatomic, copy) void (^buttonClick)(void);
@property (nonatomic, strong) QYIntroduce *item;
@property (nonatomic, assign) BOOL isLast;

@end

NS_ASSUME_NONNULL_END
