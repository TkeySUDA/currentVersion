//
//  CardViewController.m
//  wirelessuda
//
//  Created by Mac on 13-11-17.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "CardViewController.h"
#import "CustomButton.h"
#import "GuaShiViewController.h"
#import "ChangeCardPasswordViewController.h"
#import "ConsumptionSearchViewController.h"
#import "PickCardViewController.h"

@interface CardViewController ()

@end

@implementation CardViewController
@synthesize personInfoView;
@synthesize btScrollView;
@synthesize functionScrollView;
@synthesize detailInfoView,guaShiView,changePsdView,consumptionView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor=[UIColor whiteColor];
        self.navigationItem.title=@"苏大通应用";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    personInfoView=[[PersonInfoView alloc]initWithFrame:CGRectMake(0, 0, 320, 100)];
    btScrollView=[[BtScrollView alloc]initWithFrame:CGRectMake(0, 100, 320, 64)];
    btScrollView.delegate=self;
    functionScrollView=[[UIView alloc]init];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        functionScrollView.frame=CGRectMake(0, 164, 320, SCREEN_HEIGHT-164-70);
    }
    else
    {
        functionScrollView.frame=CGRectMake(0, 164, 320, SCREEN_HEIGHT-164-44);
    }
    NSLog(@"aaaaa%f",SCREEN_HEIGHT);
    functionScrollView.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:btScrollView];
    [self.view addSubview:personInfoView];
    [self.view addSubview:functionScrollView];
}
-(void)buttonClick:(NSString *)which
{
    if ([which isEqualToString:@"0"]) {
        NSLog(@"详细信息");
//        [functionScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        detailInfoView=[[DetailInfoView alloc]initWithFrame:CGRectMake(0, 0, 320, 200)];
        detailInfoView.backgroundColor=[UIColor redColor];
        [functionScrollView addSubview:detailInfoView];
    }else if ([which isEqualToString:@"1"]){
        NSLog(@"苏大通挂失");
        //[functionScrollView setContentOffset:CGPointMake(320, 0) animated:YES];
        guaShiView=[[GuaShiView alloc]initWithFrame:CGRectMake(0, 0, 320, 200)];
        guaShiView.backgroundColor=[UIColor cyanColor];
        [functionScrollView addSubview:guaShiView];
    }else if ([which isEqualToString:@"2"]){
        NSLog(@"修改密码");
        //[functionScrollView setContentOffset:CGPointMake(320*2, 0) animated:YES];
        changePsdView=[[ChangePsdView alloc]initWithFrame:CGRectMake(0, 0, 320, 200)];
        changePsdView.backgroundColor=[UIColor purpleColor];
        [functionScrollView addSubview:changePsdView];
        
    }else if ([which isEqualToString:@"3"]){
        NSLog(@"消费查询");
        //[functionScrollView setContentOffset:CGPointMake(320*3, 0) animated:YES];
         consumptionView=[[ConsumptionView alloc]initWithFrame:CGRectMake(0, 0, 320, 200)];
        consumptionView.backgroundColor=[UIColor blueColor];
        [functionScrollView addSubview:consumptionView];
    }else if ([which isEqualToString:@"4"]){
        NSLog(@"捡卡功能");
        
        //[functionScrollView setContentOffset:CGPointMake(320*4, 0) animated:YES];
        
        UIScrollView *jianka=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 200)];
        jianka.backgroundColor=[UIColor purpleColor];
        [functionScrollView addSubview:jianka];
    }
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
