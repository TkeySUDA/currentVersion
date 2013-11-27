//
//  CustomButton.m
//  WirelessSudaV1-1.01
//
//  Created by Mac on 13-10-25.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton
@synthesize icon,name;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor=[UIColor clearColor];
        //news icon
        icon=[UIButton buttonWithType:UIButtonTypeCustom];
        icon.backgroundColor=[UIColor clearColor];
        icon.frame=CGRectMake(0, 0, 65, 65);
        name=[[UILabel alloc]initWithFrame:CGRectMake(0,65, 65, 20)];
        name.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
        name.textAlignment=NSTextAlignmentCenter;
        name.backgroundColor = [UIColor clearColor];
        [self addSubview:icon];
        [self addSubview:name];
    }
    return self;
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
