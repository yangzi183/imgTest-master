//
//  YZImgCtlViewController.m
//  imgCtrl
//
//  Created by apple on 14-11-19.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "YZImgCtlViewController.h"

@interface YZImgCtlViewController ()

@end

@implementation YZImgCtlViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

        
        //self.view.window = [[VGWindow alloc]initWithFrame:self.view.bounds];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    VGWindow *windowVg = [[VGWindow alloc]initWithFrame:self.view.bounds];
    self.img.image = [UIImage imageNamed:@"test1.png"];
    
    [self.view addSubview:windowVg];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
