//
//  YZViewController.m
//  imgCtrl
//
//  Created by apple on 14-11-11.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "YZViewController.h"

#define ZOOM_STEP    1.5
#define BTN_WIDTH   100
#define BTN_HEIGHT  20
#define kMenuViewWidth  300
#define kMenuViewHeight 200

//黑白
const float colormatrix_heibai[] = {
    0.8f,  1.6f, 0.2f, 0, -163.9f,
    0.8f,  1.6f, 0.2f, 0, -163.9f,
    0.8f,  1.6f, 0.2f, 0, -163.9f,
    0,  0, 0, 1.0f, 0 };
//旧化
const float colormatrix_huajiu[] = {
    0.2f,0.5f, 0.1f, 0, 40.8f,
    0.2f, 0.5f, 0.1f, 0, 40.8f,
    0.2f,0.5f, 0.1f, 0, 40.8f,
    0, 0, 0, 1, 0 };

//哥特
const float colormatrix_gete[] = {
    1.9f,-0.3f, -0.2f, 0,-87.0f,
    -0.2f, 1.7f, -0.1f, 0, -87.0f,
    -0.1f,-0.6f, 2.0f, 0, -87.0f,
    0, 0, 0, 1.0f, 0 };

//锐色
const float colormatrix_ruise[] = {
    4.8f,-1.0f, -0.1f, 0,-388.4f,
    -0.5f,4.4f, -0.1f, 0,-388.4f,
    -0.5f,-1.0f, 5.2f, 0,-388.4f,
    0, 0, 0, 1.0f, 0 };


//淡雅
const float colormatrix_danya[] = {
    0.6f,0.3f, 0.1f, 0,73.3f,
    0.2f,0.7f, 0.1f, 0,73.3f,
    0.2f,0.3f, 0.4f, 0,73.3f,
    0, 0, 0, 1.0f, 0 };

//lomo
const float colormatrix_lomo[] = {
    1.7f,  0.1f, 0.1f, 0, -73.1f,
    0,  1.7f, 0.1f, 0, -73.1f,
    0,  0.1f, 1.6f, 0, -73.1f,
    0,  0, 0, 1.0f, 0 };

//酒红
const float colormatrix_jiuhong[] = {
    1.2f,0.0f, 0.0f, 0.0f,0.0f,
    0.0f,0.9f, 0.0f, 0.0f,0.0f,
    0.0f,0.0f, 0.8f, 0.0f,0.0f,
    0, 0, 0, 1.0f, 0 };

//清宁
const float colormatrix_qingning[] = {
    0.9f, 0, 0, 0, 0,
    0, 1.1f,0, 0, 0,
    0, 0, 0.9f, 0, 0,
    0, 0, 0, 1.0f, 0 };

//浪漫
const float colormatrix_langman[] = {
    0.9f, 0, 0, 0, 63.0f,
    0, 0.9f,0, 0, 63.0f,
    0, 0, 0.9f, 0, 63.0f,
    0, 0, 0, 1.0f, 0 };

//光晕
const float colormatrix_guangyun[] = {
    0.9f, 0, 0,  0, 64.9f,
    0, 0.9f,0,  0, 64.9f,
    0, 0, 0.9f,  0, 64.9f,
    0, 0, 0, 1.0f, 0 };

//蓝调
const float colormatrix_landiao[] = {
    2.1f, -1.4f, 0.6f, 0.0f, -31.0f,
    -0.3f, 2.0f, -0.3f, 0.0f, -31.0f,
    -1.1f, -0.2f, 2.6f, 0.0f, -31.0f,
    0.0f, 0.0f, 0.0f, 1.0f, 0.0f
};

//梦幻
const float colormatrix_menghuan[] = {
    0.8f, 0.3f, 0.1f, 0.0f, 46.5f,
    0.1f, 0.9f, 0.0f, 0.0f, 46.5f,
    0.1f, 0.3f, 0.7f, 0.0f, 46.5f,
    0.0f, 0.0f, 0.0f, 1.0f, 0.0f
};

//夜色
const float colormatrix_yese[] = {
    1.0f, 0.0f, 0.0f, 0.0f, -66.6f,
    0.0f, 1.1f, 0.0f, 0.0f, -66.6f,
    0.0f, 0.0f, 1.0f, 0.0f, -66.6f,
    0.0f, 0.0f, 0.0f, 1.0f, 0.0f
};

@interface YZViewController () {
    YZPopView *addPopMenuView;
    NSMutableArray *arrayStyle;
}

@end

@implementation YZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"test1.png"]];
    self.imageView.userInteractionEnabled = YES;
    [self.scrollView addSubview:self.imageView];
    arrayStyle = [[NSMutableArray alloc]initWithObjects:@"Normal", @"黑白", @"旧化", @"哥特", @"锐色", @"淡雅", @"lomo", @"酒红", @"清宁", @"浪漫", @"光晕", @"蓝调", @"梦幻", @"夜色",nil];
    
    self.scrollView.contentSize = self.imageView.image.size;
    self.imageBak = [UIImage imageNamed:@"test1.png"];
    [self addBtn:self.scrollView.frame];
    
    UITapGestureRecognizer *tapReg3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(removePopView:)];
    tapReg3.numberOfTapsRequired = 1;
    tapReg3.numberOfTouchesRequired = 1;
    [self.scrollView addGestureRecognizer:tapReg3];
    
    UITapGestureRecognizer *tapReg = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(scrollviewDoubleTapped:)];
    tapReg.numberOfTapsRequired = 2;
    tapReg.numberOfTouchesRequired = 1;
    [tapReg3  requireGestureRecognizerToFail:tapReg];
    [self.scrollView addGestureRecognizer:tapReg];
    
    UITapGestureRecognizer *tapReg2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(scrollviewTwoTapped:)];
    tapReg2.numberOfTouchesRequired = 2;
    tapReg2.numberOfTapsRequired = 1;
    
    [self.scrollView addGestureRecognizer:tapReg2];
    self.normalRect = self.scrollView.bounds;
    NSLog(@"\r\n frame:%f-%f-%f-%f", self.scrollView.bounds.origin.x, self.scrollView.bounds.origin.y, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height);
    NSLog(@"\r\n frame:%f-%f-%f-%f", self.scrollView.frame.origin.x, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    [self addSomeBtn];

}

- (void)removePopViewForImg {
    if (addPopMenuView) {
        [addPopMenuView fadeOut];
        addPopMenuView = nil;
    }
}

- (void)removePopView: (UITapGestureRecognizer *)reg {
    NSLog(@"test1-1");
    [self removePopViewForImg];
    //[self zoomToNormal];
}

- (void)addBtn: (CGRect)frameRect{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake((frameRect.size.width - BTN_WIDTH) / 2, 0, BTN_WIDTH, BTN_HEIGHT);
    [btn setTitle:@"Change style!" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(changeStyle:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.4];
    [self.scrollView addSubview:btn];
}

- (void)changeStyle:(id)sender {
    if (addPopMenuView == nil) {
        addPopMenuView = [[YZPopView alloc]initWithFrame:CGRectMake(18, BTN_HEIGHT, self.scrollView.frame.size.width - 36, kMenuViewHeight)];
        addPopMenuView.delegate = self;
        
        [self.scrollView addSubview:addPopMenuView];
        //self.scrollView.scrollEnabled = NO;
        
    } else {
        [addPopMenuView fadeOut];
        addPopMenuView = nil;
        //self.tableView.scrollEnabled = YES;
    }

}

- (void)selectPhoto {
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    picker.delegate = self;
    //picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];
}

- (UIImage *)shrinkImg:(UIImage *)oriImg toSize:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    [oriImg drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *final = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return final;
}

- (void)addSomeBtn {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"复原" forState:UIControlStateNormal];
    btn.frame = CGRectMake(20, 518, 40, 30);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(zoomToNormal) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.title = @"testset";
    UIBarButtonItem *photo = [[UIBarButtonItem alloc]initWithTitle:@"照片" style:UIBarButtonItemStylePlain target:self action:@selector(selectPhoto)];
    [self.navigationItem setLeftBarButtonItem:photo animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    CGRect scrollFrame = self.scrollView.frame;
    CGFloat scaleWidth = scrollFrame.size.width / self.scrollView.contentSize.width;
    CGFloat scaleHeight = scrollFrame.size.height / self.scrollView.contentSize.height;
    CGFloat minScale = MIN(scaleWidth, scaleHeight);
    
    self.scrollView.maximumZoomScale = 2.0f;
    self.scrollView.minimumZoomScale = 0.5;
    NSLog(@"\r\n min:%f", minScale);
    self.scrollView.zoomScale = minScale;
}

- (void)zoomToNormal {
    NSLog(@"\r\n cur:%f-%f;normal:%f-%f", self.scrollView.bounds.origin.x, self.scrollView.bounds.origin.y, self.normalRect.origin.x, self.normalRect.origin.y);
    CGRect rect = CGRectMake(self.scrollView.bounds.origin.x, self.scrollView.bounds.origin.y, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height);
    
    [self.scrollView zoomToRect:rect animated:YES];
        //NSLog(@"\r\n scrollViewframe:%f-%f-%f-%f", self.scrollView.frame.origin.x, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
}

- (void)scrollviewDoubleTapped:(UITapGestureRecognizer *)recognizer {
    NSLog(@"\r\n test2");
    [self removePopViewForImg];
    CGPoint pointCur = [recognizer locationInView:recognizer.view];
    CGFloat newScale = self.scrollView.zoomScale * ZOOM_STEP;
    CGFloat width = self.scrollView.frame.size.width / newScale;
    CGFloat height = self.scrollView.frame.size.height / newScale;
    
    CGFloat x = pointCur.x - (width / 2.0f);
    CGFloat y = pointCur.y - (height / 2.0f);
    
    CGRect rectToNewZoom = CGRectMake(x, y, width, height);
    [self.scrollView zoomToRect:rectToNewZoom animated:YES];
    
}

- (IBAction)imgChange:(id)sender {
    UIGraphicsBeginImageContext(self.imageView.frame.size);
    [self.imageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *tmp = UIGraphicsGetImageFromCurrentImageContext();
    NSLog(@"\r\n tmp:%f-%f", tmp.size.width, tmp.size.height);
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(tmp, nil, nil, nil);
}

- (void)scrollviewTwoTapped:(UITapGestureRecognizer *)recognizer {
    [self removePopViewForImg];
    CGFloat newZoom = self.scrollView.zoomScale / ZOOM_STEP;
    newZoom = MAX(newZoom, self.scrollView.minimumZoomScale);

    [self.scrollView setZoomScale:newZoom animated:YES];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *img = info[UIImagePickerControllerOriginalImage];
    NSLog(@"\r\n img:%f-%f-%f-%f", img.size.width, img.size.height, self.imageView.image.size.width, self.imageView.image.size.height);
    UIImage *imgBak = [self shrinkImg:img toSize:self.imageView.bounds.size];
    self.imageView.image = imgBak;
    [picker dismissViewControllerAnimated:YES completion:NULL];
}


- (void)changeStyleForImg:(NSString *)styleStr {
    [addPopMenuView fadeOut];
    addPopMenuView = nil;
    NSUInteger index = [arrayStyle indexOfObject:styleStr];
    switch (index) {
        case 0:
            self.imageView.image = _imageBak;
            break;
        case 1:
            self.imageView.image = [YZImgTest processImg:_imageBak withColor:colormatrix_heibai];
            break;
        case 2:
            self.imageView.image = [YZImgTest processImg:_imageBak withColor:colormatrix_lomo];
            break;
        case 3:
            self.imageView.image = [YZImgTest processImg:_imageBak withColor:colormatrix_huajiu];
            break;
        case 4:
            self.imageView.image = [YZImgTest processImg:_imageBak withColor:colormatrix_gete];
            break;
        case 5:
            self.imageView.image = [YZImgTest processImg:_imageBak withColor:colormatrix_ruise];
            break;
        case 6:
            self.imageView.image = [YZImgTest processImg:_imageBak withColor:colormatrix_danya];
            break;
        case 7:
            self.imageView.image = [YZImgTest processImg:_imageBak withColor:colormatrix_jiuhong];
            break;
        case 8:
            self.imageView.image = [YZImgTest processImg:_imageBak withColor:colormatrix_qingning];
            break;
        case 9:
            self.imageView.image = [YZImgTest processImg:_imageBak withColor:colormatrix_langman];
            break;
        case 10:
            self.imageView.image = [YZImgTest processImg:_imageBak withColor:colormatrix_guangyun];
            break;
        case 11:
            self.imageView.image = [YZImgTest processImg:_imageBak withColor:colormatrix_landiao];
            break;
        case 12:
            self.imageView.image = [YZImgTest processImg:_imageBak withColor:colormatrix_menghuan];
            break;
        case 13:
            self.imageView.image = [YZImgTest processImg:_imageBak withColor:colormatrix_yese];
            break;
        default:
            break;
    }
}

@end
