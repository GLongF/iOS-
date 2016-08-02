//
//  MYHotController.m
//  BigBirdie
//
//  Created by 郭龙飞 on 16/7/26.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYHotController.h"
#import "MYHotHeaderView.h"
#import "MYHotViewCell.h"
#import "SDCycleScrollView.h"
#import "PopView2.h"

#import "AFNetworking.h"

@interface MYHotController ()<UICollectionViewDelegate,UICollectionViewDataSource,SDCycleScrollViewDelegate>

@property (nonatomic,strong) UICollectionView *collectionView;
// 轮播图数据
@property (nonatomic, strong) NSMutableArray *imageDataArray;
// Collection 数据
@property (nonatomic, strong) NSMutableArray *listArray;
// headerView
@property (nonatomic, strong) MYHotHeaderView *headerView;


@property (nonatomic, strong) PopView2 * pop;


@end

@implementation MYHotController
-(NSArray *)imageDataArray{
    
    if (!_imageDataArray) {
        _imageDataArray =  @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg"].mutableCopy;
    }
    return _imageDataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addCollectionView];
    //[self post];
    
    
    
    
    self.listArray = @[@"唐僧",@"悟空",@"八戒",@"沙僧",@"如来",@"观音"].mutableCopy;


}

#pragma mark - collectionView
- (void)addCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumInteritemSpacing = 5;
    layout.minimumLineSpacing = 5;
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    layout.itemSize = CGSizeMake((SCREEN_WIDTH - 30) / 2, (SCREEN_WIDTH - 30) / 2 + 45);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64) collectionViewLayout:layout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_collectionView];
    // 注册单元
    [self.collectionView registerClass:[MYHotViewCell class] forCellWithReuseIdentifier:@"MYHotViewCell"];
    self.headerView = [[MYHotHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
    
    // 注册headerView
    [self.collectionView registerClass:[MYHotHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.listArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MYHotViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MYHotViewCell" forIndexPath:indexPath];
    
    cell.nameLabel.text = self.listArray[indexPath.row];
    return cell;
}


#pragma mark -- headerView
//这个方法是返回 Header的大小 size
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size={SCREEN_WIDTH,310};
    return size;
}

//这个也是最重要的方法 获取Header的 方法。
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        self.headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        // 轮播图
        [self addCarouselView];
        // popView
        [self createPopView];
        return self.headerView;
    }
    return nil;
}

#pragma mark - popView
- (void)createPopView {
    
    _pop = [[PopView2 alloc] initWithCenter:self.headerView.backImage.center viewRadius:50 subViewRadius:30 length:100 titles:@[@"第一", @"第二", @"第三", @"更多"] addView:self.view];
    _pop.clickWithIndex = ^(NSInteger index) {
        
        NSLog(@"点击了第%ld", index);
    };
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
//    CGRect rect = _pop.frame;
}

#pragma mark -  SDCycleScrollViewDelegate (轮播图)

- (void)addCarouselView {
    // 通过第三方框架SDCycleScrollView实现自动轮播图;
   // SDCycleScrollView *scrollView = [SDCycleScrollView cycleScrollViewWithFrame:_headerView.scrollView.frame imageURLStringsGroup:self.imageDataArray];
    
    // 加载本地图片
    SDCycleScrollView *SDCScrollView = [SDCycleScrollView cycleScrollViewWithFrame:self.headerView.scrollView.frame imageNamesGroup:self.imageDataArray];
    NSLog(@"%@",self.imageDataArray);
    
    SDCScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    SDCScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    SDCScrollView.autoScrollTimeInterval = 5;
    SDCScrollView.delegate = self;
    SDCScrollView.backgroundColor = [UIColor blueColor];
    [self.headerView.scrollView addSubview:SDCScrollView];
}
// 第三方自动轮播图代理方法; (选中事件)
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
   
}

- (void)post {
    NSDictionary *dic= @{@"iii":@"1"};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/plain",nil];
//    [manager POST:@"http://192.168.1.109/thinkphp3.2/home/index/test" parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//       
//    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"ok");
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@",error);
//    }];

    
    [manager POST:@"http://192.168.1.109/thinkphp3.2/home/index/test" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@", error.localizedDescription);
    }];
}

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
