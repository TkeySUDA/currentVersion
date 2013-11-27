//
//  LoginViewController.m
//  WirelesSudaV1.0
//
//  Created by ivanfee on 13-8-7.
//  Copyright (c) 2013年 suda. All rights reserved.
//

#import "LoginViewController.h"
#import "GateWayViewController.h"
#import "LoginValidate.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize autoLogin;
@synthesize btnAutoLogin;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"首页";
        autoLogin=@"0";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    #pragma mark - 背景图片初始化
    //self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"login_bg.jpg"]];
    self.view.backgroundColor = [UIColor blackColor];
    //判断ios系统
    UIView *subBackground=[[UIView alloc]initWithFrame:CGRectMake(0, 20, 320, SCREEN_HEIGHT-20)];
    subBackground.backgroundColor=[UIColor lightGrayColor];
    
    #pragma mark - 输入子视框
    UIImageView* loginView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_textfield"]];
    loginView.frame=CGRectMake(10, 130, 300, 94);
    [subBackground addSubview:loginView];
    
    #pragma mark - 输入框和文字提示
    UILabel *usernameLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 140, 60, 35)];
    usernameLabel.text = @"用户：";
    [subBackground addSubview:usernameLabel];
    UILabel *passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 180, 60, 35)];
    passwordLabel.text = @"密码：";
    [subBackground addSubview:passwordLabel];
    
    #pragma mark - 用户名和密码的UITextField
    usernameText=[[UITextField alloc] initWithFrame:CGRectMake(90, 140, 200, 35)];
    usernameText.placeholder=@"请输入网关账号";
    usernameText.autocapitalizationType=UITextAutocapitalizationTypeNone;
    usernameText.autocorrectionType=UITextAutocorrectionTypeNo;
    usernameText.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    [subBackground addSubview:usernameText];
    
    passwordText=[[UITextField alloc] initWithFrame:CGRectMake(90, 180, 200, 35)];
    passwordText.placeholder=@"请输入网关密码";
    passwordText.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    passwordText.secureTextEntry = YES;
    [subBackground addSubview:passwordText];
    
    #pragma mark - 登陆UIButton
    UIButton* btnLogin=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnLogin.frame=CGRectMake(15, 260, 140, 44);
    [btnLogin setBackgroundImage:[UIImage imageNamed:@"login18"] forState:UIControlStateNormal];
    [btnLogin addTarget:self action:@selector(onLoginClick:) forControlEvents:UIControlEventTouchUpInside];
    [subBackground addSubview:btnLogin];
    
    #pragma mark - 返回UIButton
    UIButton* btnBack=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnBack.frame=CGRectMake(165, 260, 140, 44);
    [btnBack setTitle:@"" forState:UIControlStateNormal];
    [btnBack setBackgroundImage:[UIImage imageNamed:@"return18"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(onBackClick) forControlEvents:UIControlEventTouchUpInside];
    [subBackground addSubview:btnBack];

    #pragma mark - 忘记密码
    UIButton* btnForget=[UIButton buttonWithType:UIButtonTypeCustom];
    btnForget.frame=CGRectMake(20, 320, 80, 40);
    btnForget.titleLabel.font=[UIFont boldSystemFontOfSize:15];
    [btnForget setTitle:@"忘记密码?" forState:UIControlStateNormal];
    btnForget.showsTouchWhenHighlighted=YES;
    [btnForget addTarget:self action:@selector(onForgetClick) forControlEvents:UIControlEventTouchUpInside];
    [subBackground addSubview:btnForget];
    
    #pragma mark - 自动登录
    btnAutoLogin=[UIButton buttonWithType:UIButtonTypeCustom];
    btnAutoLogin.frame=CGRectMake(170, 320, 130, 40);
    btnAutoLogin.titleLabel.font=[UIFont boldSystemFontOfSize:15];
    [btnAutoLogin setTitle:@"允许自动登录" forState:UIControlStateNormal];
    [btnAutoLogin setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    btnAutoLogin.showsTouchWhenHighlighted=YES;
//    [btnAutoLogin setImage:[UIImage imageNamed:@"auto_login_frame"] forState:UIControlStateNormal];
    [btnAutoLogin setImage:[UIImage imageNamed:@"auto_login2"] forState:UIControlStateNormal];
    btnAutoLogin.tag=0;
    
    [btnAutoLogin addTarget:self action:@selector(onAutoLoginClick:) forControlEvents:UIControlEventTouchUpInside];
    [subBackground addSubview:btnAutoLogin];
    
    #pragma mark - 文字提醒
    UITextView* tipsView=[[UITextView alloc] initWithFrame:CGRectMake(20, 400, 280, 100)];
    tipsView.backgroundColor=[UIColor clearColor];
    tipsView.textColor=[UIColor whiteColor];
    tipsView.font=[UIFont systemFontOfSize:13];
    tipsView.text=@"友情提示：\n☞ 设置自动登录系统将保存你的账号信息\n☞ 如果忘记密码，请点击忘记密码，使用绑定的手机找回";
    [tipsView setUserInteractionEnabled:NO];
    [subBackground addSubview:tipsView];
    #pragma mark - 触摸收回键盘
    UITapGestureRecognizer* tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tapGesture.delegate=(id<UIGestureRecognizerDelegate>)self;
    [subBackground addGestureRecognizer:tapGesture];
    [self.view addSubview:subBackground];
}

#pragma mark - 隐藏navigationBar
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.navigationController.navigationBar.hidden=YES;
}

#pragma mark - 登录按钮
- (void)onLoginClick:(id)sender
{
    LoginValidate *loginValidate=[[LoginValidate alloc]init];

    NSString *result=[loginValidate validateLogin:usernameText.text withPassword:passwordText.text];
    if ([result isEqualToString:@"0"]) {
        if ([autoLogin isEqualToString:@"0"]) {
            [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"autoLogin"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }else{
            [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"autoLogin"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
        GateWayViewController *appViewController = [[GateWayViewController alloc]initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:appViewController animated:NO];
        appViewController.navigationController.navigationBar.hidden=NO;
    }
    else if([result isEqualToString:@"3"]){
        UIAlertView * alert= [[UIAlertView alloc]initWithTitle:nil message:@"用户名或密码输入错误！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }else if ([result isEqualToString:@"1"]){
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"     请输入用户名！     ";
        hud.margin = 10.f;
        hud.yOffset = -60.f;
         hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:2];
        [usernameText becomeFirstResponder];
    }else if ([result isEqualToString:@"2"]){
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"     请输入密码！     ";
        hud.margin = 10.f;
        hud.yOffset = -60.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:2];
        [passwordText becomeFirstResponder];

    }
}

#pragma mark - 返回按钮
- (void)onBackClick
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - 忘记密码按钮
- (void)onForgetClick
{
    
}

#pragma mark - 自动登录按钮
-(void)onAutoLoginClick:(UIButton*)btn
{
    if (btn.tag==0) {
        btn.tag=1;
        NSLog(@"%d",btn.tag);
        [btnAutoLogin setImage:[UIImage imageNamed:@"auto_login_frame"] forState:UIControlStateNormal];
        autoLogin=@"1";
    }else if(btn.tag==1){
        btn.tag=0;
        NSLog(@"%d",btn.tag);
        [btnAutoLogin setImage:[UIImage imageNamed:@"auto_login2"] forState:UIControlStateNormal];
        autoLogin=@"0";
    }
}

#pragma mark - 触摸键盘消失
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([touch.view isKindOfClass:[UIButton class]]) {
        return NO;
    }
    return YES;
}

-(void)tap:(UIGestureRecognizer*)gesture
{
    if (self.view.frame.origin.y==-85) {
        [UIView animateWithDuration:0.3 animations:^{
            self.view.frame=CGRectOffset(self.view.frame, 0, 85);
        }];
    }
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
