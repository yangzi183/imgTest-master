//
//  YZViewController.h
//  imgCtrl
//
//  Created by apple on 14-11-11.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YZImgTest.h"
#import "YZPopView.h"
#import <QuartzCore/QuartzCore.h>


@interface YZViewController : UIViewController <UIScrollViewDelegate, YZPopViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIImage *imageBak;
@property (assign, nonatomic) CGRect normalRect;
- (void)scrollviewDoubleTapped:(UITapGestureRecognizer *)recognizer;
- (IBAction)imgChange:(id)sender;
- (void)scrollviewTwoTapped:(UITapGestureRecognizer *)recognizer;
@end
