//
//  mainViewScrollView.m
//  WirelessSudaV1-1.01
//
//  Created by Mac on 13-10-25.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "mainViewScrollView.h"
#import "UIButton+WebCache.h"

@implementation mainViewScrollView
@synthesize imagePage;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.bounces=NO;
        self.pagingEnabled=YES;
        self.userInteractionEnabled=YES;
        self.showsHorizontalScrollIndicator=NO;
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
-(void)setImage
{
#pragma mark - 初始化数组并添加图片
    imagePage = [[NSMutableArray alloc]init];
    [imagePage addObject:@"http://www.suda.edu.cn/upload/2013050269785665.jpg"];
    [imagePage addObject:@"http://www.suda.edu.cn/upload/image/20130911/20130911161782038203.jpg"];
    [imagePage addObject:@"http://www.suda.edu.cn/upload/2013082561558597.jpg"];
    [imagePage addObject:@"http://www.suda.edu.cn/upload/2013061100435728.jpg"];
    
#pragma mark - 创建四个图片
    for (int i = 0; i < [imagePage count]; i++) {
        UIButton *imageView = [UIButton buttonWithType:UIButtonTypeCustom];
        [imageView setImageWithURL:[NSURL URLWithString:[imagePage objectAtIndex:i]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"defaultPic.png"]];
        imageView.frame = CGRectMake((320 * i) +320, 0, 320, 150);
        [imageView addTarget:self action:@selector(newsClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:imageView];
    }
    
    UIButton *imageView = [UIButton buttonWithType:UIButtonTypeCustom];

    [imageView setImageWithURL:[NSURL URLWithString:[imagePage objectAtIndex:([imagePage count] - 1)]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"defaultPic.png"]];
    imageView.frame = CGRectMake(0, 0, 320, 150);
    [self addSubview:imageView];
    
    imageView = [UIButton buttonWithType:UIButtonTypeCustom];

    [imageView setImageWithURL:[NSURL URLWithString:[imagePage objectAtIndex:([imagePage count] - 1)]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"defaultPic.png"]];
    
    imageView.frame = CGRectMake((320 * ([imagePage count] + 1)) , 0, 320, 150);
    [self addSubview:imageView];
    
    [self setContentSize:CGSizeMake(320 * ([imagePage count] + 2), 150)];
    [self setContentOffset:CGPointMake(0, 0)];
    [self scrollRectToVisible:CGRectMake(320, 0, 320, 150) animated:NO];

}
-(void)newsClicked:(UIButton *)button
{
    
}

@end
