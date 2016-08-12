//
//  MYHotController.m
//  BigBirdie
//
//  Created by 郭龙飞 on 16/7/26.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYHotController.h"
#import "MYHotHeaderView.h"
#import "MYHotCollectCell.h"
#import "MYHotChartsView.h"

@interface MYHotController ()<UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) NSMutableArray * dataArr;
@property (nonatomic, strong) MYHotHeaderView * headerView;

@end

@implementation MYHotController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self createCollectionView];
    [self createChartsView];
}

- (void)createChartsView {
    
    MYHotChartsView * chartView = [[MYHotChartsView alloc] initWithFrame:CGRectMake(- SCREEN_WIDTH + 20, 100, SCREEN_WIDTH, 250)];
    chartView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:chartView];
}

- (void)createCollectionView {
 
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH / 2.f, (564 / 3) * kWidth_Scale);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64- 49) collectionViewLayout:flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
    [self.view addSubview:_collectionView];
    
    //注册
    [_collectionView registerNib:[UINib nibWithNibName:@"MYHotCollectCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"MYHotCollectCellId"];
    [_collectionView registerClass:[MYHotHeaderView  class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MYHotHeaderViewId"];
}

#pragma mark UICollectionViewDataSource代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MYHotCollectCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MYHotCollectCellId" forIndexPath:indexPath];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
           
            MYHotHeaderView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MYHotHeaderViewId" forIndexPath:indexPath];
            self.headerView = headerView;
            return headerView;
        }
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return CGSizeMake(SCREEN_WIDTH, 200 * kWidth_Scale);
    }
    return CGSizeMake(0, 0);
}


#pragma mark - getter 

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
