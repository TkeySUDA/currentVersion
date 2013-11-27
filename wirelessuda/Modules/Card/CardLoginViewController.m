//
//  CardLoginViewController.m
//  wirelessuda
//
//  Created by Mac on 13-11-17.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "CardLoginViewController.h"
#import "CardViewController.h"

@interface CardLoginViewController ()

@end

@implementation CardLoginViewController
@synthesize usernameLabel,usernameField;
@synthesize passwordLabel,passwordField;
@synthesize loginButton,backButton;
@synthesize autoLoginButton,autoLoginLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title=@"首页";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIView *subBackground=[[UIView alloc]initWithFrame:CGRectMake(0, 20, 320, SCREEN_HEIGHT-20)];
    subBackground.backgroundColor=[UIColor lightGrayColor];
    
    UIImageView* loginView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_textfield"]];
    loginView.frame=CGRectMake(10, 130, 300, 94);
    [subBackground addSubview:loginView];
    
    UILabel *loginType=[[UILabel alloc]initWithFrame:CGRectMake(0, 20, 320, 100)];
    loginType.textAlignment=NSTextAlignmentCenter;
    loginType.text=@"苏大通用户登录";
    loginType.textColor=[UIColor blackColor];
    loginType.font=[UIFont fontWithName:@"Arial" size:20];
    
    usernameLabel=[[UILabel alloc] initWithFrame:CGRectMake(30, 140, 60, 35)];
    usernameLabel.text=@"登录号:";
    usernameField=[[UITextField alloc] initWithFrame:CGRectMake(90, 140, 200, 35)];
    usernameField.placeholder=@"请输入苏大通账号";
    usernameField.autocapitalizationType=UITextAutocapitalizationTypeNone;
    usernameField.autocorrectionType=UITextAutocorrectionTypeNo;
    usernameField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    usernameField.backgroundColor=[UIColor whiteColor];
    
    passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 180, 60, 35)];
    passwordLabel.text = @"  密码:";
    passwordField=[[UITextField alloc] initWithFrame:CGRectMake(90, 180, 200, 35)];
    passwordField.placeholder=@"请输入苏大通密码";
    passwordField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    passwordField.secureTextEntry = YES;
    passwordField.backgroundColor=[UIColor whiteColor];
    
    loginButton=[UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.frame=CGRectMake(15, 260, 140, 44);
    [loginButton setBackgroundImage:[UIImage imageNamed:@"login18"] forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(onLoginClick) forControlEvents:UIControlEventTouchUpInside];
    
    backButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    backButton.frame=CGRectMake(165, 260, 140, 44);
    [backButton setTitle:@"" forState:UIControlStateNormal];
    [backButton setBackgroundImage:[UIImage imageNamed:@"return18"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(onBackClick) forControlEvents:UIControlEventTouchUpInside];
    
    [subBackground addSubview:loginType];
    [subBackground  addSubview:usernameLabel];
    [subBackground addSubview:usernameField];
    [subBackground addSubview:passwordLabel];
    [subBackground addSubview:passwordField];
    [subBackground addSubview:loginButton];
    [subBackground addSubview:backButton];
    [subBackground addSubview:autoLoginLabel];
    [subBackground addSubview:autoLoginButton];
    [self.view addSubview:subBackground];
}

-(void)onLoginClick
{
    CardViewController *cardViewController=[[CardViewController alloc]initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:cardViewController animated:YES];
    cardViewController.navigationController.navigationBar.hidden=NO;
}
-(void)onBackClick
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.navigationController.navigationBar.hidden=YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
