//
//  CalendarMainViewController.m
//  WLCalendar
//
//  Created by Tkey on 13-11-21.
//  Copyright (c) 2013年 WL. All rights reserved.
//

#import "CalendarMainViewController.h"


@interface CalendarMainViewController ()

@end

@implementation CalendarMainViewController

@synthesize segController;
@synthesize descriptionLabel;
@synthesize monthView;
@synthesize monthImage;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
      //设置statusbar为白底黑字
    monthImage = [[UIImageView alloc] init];
    self.navigationController.title = @"苏州大学2013-2014学年校历";
    NSArray *segmentedArray = [[NSArray alloc] initWithObjects:@"第一学期", @"第二学期", nil];
    segController = [[UISegmentedControl alloc] initWithItems:segmentedArray];
    descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 159)];
    
    [self.view addSubview:descriptionLabel];
    
    monthView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 223-64, 320, 345)];
    [monthView setContentSize:CGRectMake(0, 223-64, 320, 1073).size];
    [monthView setPagingEnabled:NO];
    [self.view addSubview:monthView];


    [segController addTarget:self action:@selector(termSelect:) forControlEvents:UIControlEventValueChanged];
    
    [self monthSelect:0];
    
    self.navigationItem.titleView = segController;
    
    
    
}

- (void)termSelect:(UISegmentedControl *)seg
{
    NSInteger index = seg.selectedSegmentIndex;
    if (index == 0) {
        [self monthSelect:index];
    } else {
        [self monthSelect:index];
    }
}

- (void)monthSelect:(NSInteger)term
{

    if (term == 0) {
        descriptionLabel.numberOfLines = 0;
        
        descriptionLabel.text = @"1报道：2013年8月25日\n2上课：2013年8月26日\n3中秋：9月19日只21日（3天）\n  国庆：10月1日至7日（7天）\n  元旦：12月30日至14年1月1日（3天）\n5寒假：14年1月13日至2月15日\n6停课：12月3日";
        [monthImage setFrame:CGRectMake(0, 0, 320, 931)];
        [monthImage setImage:[UIImage imageNamed:@"2013-2014苏大校历1.jpg"]];
        [monthView addSubview:monthImage];
    } else {
        descriptionLabel.text = @"1报道：2014年2月16日\n2上课：2014年2月17日\n3清明：4月5日至7日（3天）\n  劳动：5月1日至3日（3天）\n  端午：5月31日至14年5月2日（3天）\n5暑假：14年7月7日开始\n6停课：6月23日";
        [monthImage setFrame:CGRectMake(0, 0, 320, 1073)];
        [monthImage setImage:[UIImage imageNamed:@"2013-2014苏大校历2.jpg"]];
        [monthView addSubview:monthImage];
    }
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

@end

