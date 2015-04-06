//
//  YZPopView.m
//  noteTest
//
//  Created by apple on 14-8-27.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "YZPopView.h"

#define kLabelWidth     80
#define kLabelHeight    20
#define kPadding    5

@implementation YZPopView {
    NSMutableDictionary *styleDic;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        styleDic = [[NSMutableDictionary alloc]init];
        [self getDetail];
        [self fadeIn];
    }

    return self;
}

- (void)getDetail {
    
    
    UIColor *colorWhite = [UIColor colorWithWhite:0.4 alpha:0.5];
    self.backgroundColor = colorWhite;
    [self addBtn:@"Normal" rect:CGRectMake(kLabelWidth + kPadding, (kLabelHeight + kPadding) * 5, kLabelWidth, kLabelHeight)];
    
    [self addBtn:@"lomo" rect:CGRectMake(0, 0, kLabelWidth, kLabelHeight)];
    [self addBtn:@"黑白" rect:CGRectMake(kLabelWidth + kPadding, 0, kLabelWidth, kLabelHeight)];
    [self addBtn:@"旧化" rect:CGRectMake((kLabelWidth + kPadding) * 2, 0, kLabelWidth, kLabelHeight)];
    [self addBtn:@"哥特" rect:CGRectMake(0, kLabelHeight + kPadding, kLabelWidth, kLabelHeight)];
    [self addBtn:@"锐色" rect:CGRectMake(kLabelWidth + kPadding, kLabelHeight + kPadding, kLabelWidth, kLabelHeight)];
    [self addBtn:@"淡雅" rect:CGRectMake((kLabelWidth + kPadding) * 2, kLabelHeight + kPadding, kLabelWidth, kLabelHeight)];
    
    [self addBtn:@"酒红" rect:CGRectMake(0, (kLabelHeight + kPadding) * 2, kLabelWidth, kLabelHeight)];
    [self addBtn:@"清宁" rect:CGRectMake(kLabelWidth + kPadding, (kLabelHeight + kPadding) * 2, kLabelWidth, kLabelHeight)];
    [self addBtn:@"浪漫" rect:CGRectMake((kLabelWidth + kPadding) * 2, (kLabelHeight + kPadding) * 2, kLabelWidth, kLabelHeight)];
    
    [self addBtn:@"光晕" rect:CGRectMake(0, (kLabelHeight + kPadding) * 3, kLabelWidth, kLabelHeight)];
    [self addBtn:@"蓝调" rect:CGRectMake(kLabelWidth + kPadding, (kLabelHeight + kPadding) * 3, kLabelWidth, kLabelHeight)];
    [self addBtn:@"梦幻" rect:CGRectMake((kLabelWidth + kPadding) * 2, (kLabelHeight + kPadding) * 3, kLabelWidth, kLabelHeight)];
    
}

- (void)selectStyle:(NSString *)menuTxt {
    if (self.delegate && [self.delegate respondsToSelector:@selector(changeStyleForImg:)]) {
        [self.delegate changeStyleForImg:menuTxt];
    }
}

- (void)addBtn:(NSString *)test rect:(CGRect)frameRect{
    YZLabel *label = [[YZLabel alloc]initWithFrame:frameRect];
    label.delegate = self;
    label.text = test;
    [self addSubview:label];
}

- (void)fadeIn
{
    self.transform = CGAffineTransformMakeScale(1.3, 1.3);
    self.alpha = 0;
    [UIView animateWithDuration:.35 animations:^{
        self.alpha = 1;
        self.transform = CGAffineTransformMakeScale(1, 1);
    }];
}

- (void)fadeOut
{
    self.transform = CGAffineTransformMakeScale(1, 1);
    self.alpha = 1;
    [UIView animateWithDuration:.35 animations:^{
        self.alpha = 0;
        self.transform = CGAffineTransformMakeScale(0, 0);
        //[self removeFromSuperview];
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/



@end
