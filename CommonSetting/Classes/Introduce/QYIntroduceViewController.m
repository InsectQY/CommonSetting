//
//  QYIntroduceViewController.m
//  demo
//
//  Created by insect on 2021/12/16.
//

#import "QYIntroduceViewController.h"
#import "QYIntroduceCell.h"
#import "QYIntroduce.h"
#import "QYSettings.h"
#import "QYUtils.h"

static NSString *const kReuseIdentifier = @"reuseIdentifier";

@interface QYIntroduceViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property(nonatomic, weak) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property(nonatomic, weak) IBOutlet UIPageControl *pageControl;

@end

@implementation QYIntroduceViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)makeUI {
    [super makeUI];
    if (super.settings.introduce.count == 0) {
        NSAssert(false, @"[Introduce] 属性未正确配置");
    }
    
    UINib *nib = [UINib nibWithNibName:@"QYIntroduceCell"
                                bundle:[QYUtils getBundle]];
    [_collectionView registerNib:nib
      forCellWithReuseIdentifier:kReuseIdentifier];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _flowLayout.minimumInteritemSpacing = 0;
    _flowLayout.minimumLineSpacing = 0;
    _pageControl.numberOfPages = super.settings.introduce.count;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return super.settings.introduce.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    QYIntroduceCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kReuseIdentifier
                                                                      forIndexPath:indexPath];
    cell.item = super.settings.introduce[indexPath.row];
    BOOL isLast = indexPath.row == super.settings.introduce.count - 1;
    cell.isLast = isLast;
    __weak __typeof(self) weakSelf = self;
    cell.buttonClick = ^{
        [weakSelf buttonClickWithIsLast:isLast row:indexPath.row];
    };
    return cell;
}

- (void)buttonClickWithIsLast:(BOOL)isLast
                          row:(NSInteger)row {
    if (isLast) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        CGFloat offset = (row + 1) * self.view.bounds.size.width;
        [_collectionView setContentOffset:CGPointMake(offset, _collectionView.contentOffset.y) animated:YES];
    }
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    return CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height);
}

#pragma mark - UICollectionViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    _pageControl.currentPage = (NSInteger) (scrollView.contentOffset.x / self.view.bounds.size.width);
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    _pageControl.currentPage = (NSInteger) (scrollView.contentOffset.x / self.view.bounds.size.width);
}

@end
