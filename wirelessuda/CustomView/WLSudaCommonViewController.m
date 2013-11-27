//
//  WLSudaCommonViewController.m
//  wirelessuda
//
//  Created by Mac on 13-11-25.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "WLSudaCommonViewController.h"

@interface WLSudaCommonViewController ()

@end

@implementation WLSudaCommonViewController
@synthesize subView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    subView=[[UIView alloc]init];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        self.edgesForExtendedLayout=UIRectEdgeNone;
        //subView.frame=CGRectMake(0, 0,320 , 600);
    }
    else{
        //subView.frame=CGRectMake(0, 0, 320, 600);
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}
@end
