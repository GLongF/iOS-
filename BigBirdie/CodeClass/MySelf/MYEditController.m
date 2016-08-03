//
//  MYEditController.m
//  100s
//
//  Created by 郭龙飞 on 16/7/15.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYEditController.h"
#import "MYPhotoController.h"

@interface MYEditController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic,strong) MYButton *photoButton;
@end

@implementation MYEditController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"修改资料";
    
    self.photoButton = [MYButton createMYButton];
    self.photoButton.frame = CGRectMake((SCREEN_WIDTH - 100) / 2 , 100, 100, 100);
    [self.photoButton setBackgroundImage:[UIImage imageNamed:@"dazuimaike.png"] forState:UIControlStateNormal];
    [self.view addSubview:self.photoButton];

#warning 不调用相册,调用相机
    // 调用系统相册
    __weak typeof(self) weakSelf = self;
    self.photoButton.block = ^(MYButton *btn){
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
        imagePicker.allowsEditing = YES;
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.delegate = weakSelf;
        [weakSelf presentViewController:imagePicker animated:YES completion:^{
            NSLog(@"打开相册");
        }];
    };
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:^{
        NSLog(@"取消");
    }];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self.photoButton setBackgroundImage:info[UIImagePickerControllerEditedImage] forState:UIControlStateNormal];
    
    MYPhotoController *photo = [[MYPhotoController alloc] init];
    [self .navigationController pushViewController:photo animated:YES];
    [picker dismissViewControllerAnimated:YES completion:^{
        NSLog(@"选照片");
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
