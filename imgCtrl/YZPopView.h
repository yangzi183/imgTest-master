//
//  YZPopView.h
//  noteTest
//
//  Created by apple on 14-8-27.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YZLabel.h"

#define kTxtWidth               240
#define kTxtHeight              25
#define kPadding                5
#define kConfirmBtnWidth        70
#define kConfirmBtnHeight       25

@protocol YZPopViewDelegate;

@interface YZPopView : UIView <YZLabelDelegate> {
}

@property (nonatomic, assign) id<YZPopViewDelegate> delegate;

- (void)fadeOut;
@end

@protocol YZPopViewDelegate <NSObject>

- (void) changeStyleForImg: (NSString *)styleStr;


@end
