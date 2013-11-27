//
//  BtScrollView.m
//  wirelessuda
//
//  Created by Mac on 13-11-26.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "BtScrollView.h"

@implementation BtScrollView
@synthesize detailInfoButton,guaShiButton,changePsdButton,consumptionSearchButton,pickCardButton;
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor=[UIColor clearColor];
        detailInfoButton=[UIButton buttonWithType:UIButtonTypeCustom];
        detailInfoButton.backgroundColor=[UIColor redColor];
        detailInfoButton.frame=CGRectMake(0, 0, 80, 64);
        [detailInfoButton setTitle:@"详细信息" forState:UIControlStateNormal];
        detailInfoButton.titleLabel.font=[UIFont systemFontOfSize:12];
        detailInfoButton.titleLabel.textColor=[UIColor blackColor];
        [detailInfoButton addTarget:self action:@selector(btClicked:) forControlEvents:UIControlEventTouchUpInside];
        detailInfoButton.tag=0;
        
        guaShiButton=[UIButton buttonWithType:UIButtonTypeCustom];
        guaShiButton.backgroundColor=[UIColor cyanColor];
        guaShiButton.frame=CGRectMake(80, 0, 80, 64);
        [guaShiButton setTitle:@"挂失" forState:UIControlStateNormal];
        guaShiButton.titleLabel.font=[UIFont systemFontOfSize:12];
        guaShiButton.titleLabel.textColor=[UIColor blackColor];
        [guaShiButton addTarget:self action:@selector(btClicked:) forControlEvents:UIControlEventTouchUpInside];
        guaShiButton.tag=1;
        
        changePsdButton=[UIButton buttonWithType:UIButtonTypeCustom];
        changePsdButton.backgroundColor=[UIColor purpleColor];
        changePsdButton.frame=CGRectMake(160, 0, 80, 64);
        [changePsdButton setTitle:@"修改密码" forState:UIControlStateNormal];
        changePsdButton.titleLabel.font=[UIFont systemFontOfSize:12];
        changePsdButton.titleLabel.textColor=[UIColor blackColor];
        [changePsdButton addTarget:self action:@selector(btClicked:) forControlEvents:UIControlEventTouchUpInside];
        changePsdButton.tag=2;
        
        consumptionSearchButton=[UIButton buttonWithType:UIButtonTypeCustom];
        consumptionSearchButton.backgroundColor=[UIColor blueColor];
        consumptionSearchButton.frame=CGRectMake(240, 0, 80, 64);
        [consumptionSearchButton setTitle:@"消费查询" forState:UIControlStateNormal];
        consumptionSearchButton.titleLabel.font=[UIFont systemFontOfSize:12];
        consumptionSearchButton.titleLabel.textColor=[UIColor blackColor];
        [consumptionSearchButton addTarget:self action:@selector(btClicked:) forControlEvents:UIControlEventTouchUpInside];
        consumptionSearchButton.tag=3;
        
        pickCardButton=[UIButton buttonWithType:UIButtonTypeCustom];
        pickCardButton.backgroundColor=[UIColor purpleColor];
        pickCardButton.frame=CGRectMake(300, 0, 80, 64);
        [pickCardButton setTitle:@"捡卡功能" forState:UIControlStateNormal];
        pickCardButton.titleLabel.font=[UIFont systemFontOfSize:12];
        pickCardButton.titleLabel.textColor=[UIColor blackColor];
        [pickCardButton addTarget:self action:@selector(btClicked:) forControlEvents:UIControlEventTouchUpInside];
        pickCardButton.tag=4;
        
        [self addSubview:detailInfoButton];
        [self addSubview:guaShiButton];
        [self addSubview:changePsdButton];
        [self addSubview:consumptionSearchButton];
        //[self addSubview:pickCardButton];
    }
    return self;
}

-(void)btClicked:(UIButton *)button
{
    int btTag=button.tag;
    switch (btTag) {
        case 0:
        {
            [delegate buttonClick:@"0"];
        }
            break;
        case 1:
        {
            [delegate buttonClick:@"1"];
        }
            break;
        case 2:
        {
            [delegate buttonClick:@"2"];
        }
            break;
        case 3:
        {
            [delegate buttonClick:@"3"];
        }
            break;
        case 4:
        {
            [delegate buttonClick:@"4"];
        }
            break;
        default:
        {}
            break;
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
