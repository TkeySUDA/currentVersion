//
//  GuaShiViewController.m
//  wirelessuda
//
//  Created by Mac on 13-11-18.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "GuaShiViewController.h"

@interface GuaShiViewController ()

@end

@implementation GuaShiViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor=[UIColor whiteColor];
        self.navigationItem.title=@"挂失";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UILabel *usernameLabel=[[UILabel alloc] initWithFrame:CGRectMake(30, 140, 60, 35)];
    usernameLabel.text=@"账号:";
    UILabel *usernameField=[[UILabel alloc] initWithFrame:CGRectMake(90, 140, 150, 35)];
    usernameField.text=@"1127403119";
    usernameField.textColor=[UIColor  redColor];
    usernameField.backgroundColor=[UIColor whiteColor];
    
    UILabel *passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 180, 60, 35)];
    passwordLabel.text = @"密码:";
    UITextField *passwordField=[[UITextField alloc] initWithFrame:CGRectMake(90, 180, 150, 35)];
    passwordField.borderStyle=UITextBorderStyleLine;
    passwordField.textColor=[UIColor redColor];
    passwordField.placeholder=@"请输入苏大通密码";
    passwordField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    passwordField.secureTextEntry = YES;
    passwordField.backgroundColor=[UIColor whiteColor];
    
    UIButton *ok=[UIButton buttonWithType:UIButtonTypeCustom];
    ok.frame=CGRectMake(50, 260, 140, 44);
    [ok setTitle:@"确定挂失" forState:UIControlStateNormal];
    [ok.titleLabel setFont:[UIFont systemFontOfSize:20]];
    [ok setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [ok setBackgroundColor:[UIColor lightGrayColor]];
    [ok addTarget:self action:@selector(okClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:usernameLabel];
    [self.view addSubview:usernameField];
    [self.view addSubview:passwordLabel];
    [self.view addSubview:passwordField];
    [self.view addSubview:ok];
}
-(void)okClicked:(id)sender
{
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
