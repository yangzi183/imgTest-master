//
//  YZLabel.m
//  dazhong
//
//  Created by apple on 14-7-27.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "YZLabel.h"

@implementation YZLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.userInteractionEnabled = YES;
        self.textAlignment = UITextAlignmentCenter;
        self.font = [UIFont systemFontOfSize:15];
        self.textColor = [UIColor grayColor];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"\r\n click:%@", self.text);
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectStyle:)]) {
        [self.delegate selectStyle:self.text];
    }
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
