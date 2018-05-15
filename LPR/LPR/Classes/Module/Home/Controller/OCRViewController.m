//
//  OCRViewController.m
//  LPR
//
//  Created by 干志雄 on 2018/3/19.
//  Copyright © 2018年 干志雄. All rights reserved.
//

#import "OCRViewController.h"
#import "OCRInfo.h"
#import "OCRRecordTableViewCell.h"

@interface OCRViewController () <UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate,
                                 UINavigationControllerDelegate> {
    //    NSMutableArray *_ocrRecordMutableArray;
    BOOL _canUserCamera;
}

@property (nonatomic, strong) UIImagePickerController *imagePicker; //声明全局的UIImagePickerController

@property (weak, nonatomic) IBOutlet UITableView *ocrRecordTableView;
@property (weak, nonatomic) IBOutlet UIButton *takePhotosButton;
@property (weak, nonatomic) IBOutlet UIButton *selectPhotosButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cameraBarButtonItem;
@property (nonatomic, strong) UIImagePickerController *imagePickerController;

@property (nonatomic, strong) NSMutableArray *ocrRecordMutableArray;

@end

@implementation OCRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.title = @"车牌识别";

    // ------ocrRecordTableView
    self.ocrRecordTableView.dataSource = self;
    self.ocrRecordTableView.delegate = self;
    [self.ocrRecordTableView
                   registerNib:[UINib nibWithNibName:NSStringFromClass([OCRRecordTableViewCell class]) bundle:nil]
        forCellReuseIdentifier:NSStringFromClass([OCRRecordTableViewCell class])];

    // ------UIImagePickerController
    _canUserCamera = true;
    self.imagePickerController = [[UIImagePickerController alloc] init];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        self.imagePickerController.delegate = self;
        self.imagePickerController.allowsEditing = YES;
    } else {
        _canUserCamera = false;
        //         self.takePhotosButton.enabled=NO;
        //        self.selectPhotosButton.enabled=NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - **************** 懒加载
- (NSMutableArray *)ocrRecordMutableArray {
    if (!_ocrRecordMutableArray) {
        _ocrRecordMutableArray = [NSMutableArray new];

        for (int i = 0; i < 8; i++) {
            OCRInfo *ocrInfo = [OCRInfo new];
            ocrInfo.image = [NSString stringWithFormat:@"%d.jpg", i + 1];
            switch (i+1) {
                case 1:
                    ocrInfo.plateNumber = @"川A·205Q6";
                    break;
                case 2:
                    ocrInfo.plateNumber = @"川A·SN575";
                    break;
                case 3:
                    ocrInfo.plateNumber = @"京M·J0166";
                    break;
                default:
                    ocrInfo.plateNumber = @"赣K·11978";
                    break;
            }
            
            ocrInfo.isCorrect = YES;
            [_ocrRecordMutableArray addObject:ocrInfo];
        }
    }
    return _ocrRecordMutableArray;
}

#pragma mark - **************** button action
- (IBAction)rightBarButtonItemAction:(id)sender {
    UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:@"照片识别" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancelAction];

    UIAlertAction *takePhotosAction = [UIAlertAction
        actionWithTitle:@"拍摄照片"
                  style:UIAlertActionStyleDefault
                handler:^(UIAlertAction *_Nonnull action) {
                    if (!_canUserCamera) {
                        UIAlertController *alert =
                            [UIAlertController alertControllerWithTitle:@""
                                                                message:@"您所使用的设备不支持相机！"
                                                         preferredStyle:UIAlertControllerStyleAlert];
                        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"确定"
                                                                                style:UIAlertActionStyleDefault
                                                                              handler:^(UIAlertAction *action) {
                                                                                  //响应事件
                                                                                  NSLog(@"action = %@", action);
                                                                              }];
                        [alert addAction:defaultAction];
                        [self presentViewController:alert animated:YES completion:nil];
                        return;
                    }
                    //拍照
                    self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
                    [self presentViewController:self.imagePickerController animated:YES completion:nil];

                }];
    [alertController addAction:takePhotosAction];

    UIAlertAction *selectPhotosAction = [UIAlertAction
                                         actionWithTitle:@"从手机相册选择"
                                         style:UIAlertActionStyleDefault
                                         handler:^(UIAlertAction *_Nonnull action) {
                                             //相册
                                             self.imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                                             [self presentViewController:self.imagePickerController animated:YES completion:nil];
                                             
                                         }];
    [alertController addAction:selectPhotosAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (IBAction)takePhotosButtonTouchUpInside:(id)sender {
}

- (IBAction)selectPhotosButtonTouchUpInside:(id)sender {
    //相册
    self.imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}

#pragma mark - **************** UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.ocrRecordMutableArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [OCRRecordTableViewCell cellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    OCRRecordTableViewCell *cell =
        [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OCRRecordTableViewCell class])
                                        forIndexPath:indexPath];
    cell.ocrInfo = [_ocrRecordMutableArray objectAtIndex:indexPath.row];

    return cell;
}

#pragma mark - **************** UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
