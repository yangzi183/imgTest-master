//
//  YZLabel.h
//  dazhong
//
//  Created by apple on 14-7-27.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YZLabelDelegate;

@interface YZLabel : UILabel

@property (nonatomic, assign) id<YZLabelDelegate> delegate;

@end

@protocol YZLabelDelegate <NSObject>
- (void) selectStyle: (NSString *) menuTxt;
@end