//
//  GateWayViewController.m
//  wirelessuda
//
//  Created by ivanfee on 13-11-9.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//
#import "GateWayViewController.h"
#import "JWFolders.h"
#import "LoginViewController.h"
#import "PasswordData.h"
#import "GateWayVaildata.h"

@interface GateWayViewController ()

@end

@implementation GateWayViewController

@synthesize userPhoto;
@synthesize userInfo;
@synthesize appButton;
@synthesize appName;
@synthesize oldPsd,changedPsd;
@synthesize changePasswordView,bindPhoneView;
@synthesize turnOver,bindPhone;
@synthesize phone;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"网关应用";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];  //设置statusbar为白底黑字
#pragma mark - 返回按钮
    UIBarButtonItem *BackBtn = [[UIBarButtonItem alloc] initWithTitle:@"首页"
                                                                style:UIBarButtonItemStylePlain
                                                               target:self
                                                               action:@selector(backAction:)];
    self.navigationItem.leftBarButtonItem = BackBtn;
    
    //通知中心addObserver
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(transformView:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    self.view.backgroundColor=[UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGFloat originHeight = 0.0;
    if (height > 500.0) {
        originHeight = 120.0-64;
        span = 60.0;
    }
    else
    {
        originHeight = 90.0-64;
        span = -20.0;
    }
#pragma mark - 头像
    userPhoto = [[UIImageView alloc]initWithFrame:CGRectMake(110, originHeight, 100, 100)];
    userPhoto.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    userPhoto.image = [UIImage imageNamed:@"1.png"];
    userPhoto.layer.masksToBounds = YES;
    userPhoto.layer.cornerRadius = 50.0;
    userPhoto.layer.borderColor = [UIColor whiteColor].CGColor;
    userPhoto.layer.borderWidth = 3.0f;
    userPhoto.layer.rasterizationScale = [UIScreen mainScreen].scale;
    userPhoto.layer.shouldRasterize = YES;
    userPhoto.clipsToBounds = YES;
    
#pragma mark - 个人信息
    GateWayVaildata *gateWayVaildataInfo = [[GateWayVaildata alloc]init];
    NSString *money = [gateWayVaildataInfo validataGataWayTurnOver:[[NSUserDefaults standardUserDefaults] objectForKey:@"username"] withPassword:[[NSUserDefaults standardUserDefaults] objectForKey:@"password"]];
    phone = [gateWayVaildataInfo validataGataWayPhoneNumber:[[NSUserDefaults standardUserDefaults] objectForKey:@"username"] withPassword:[[NSUserDefaults standardUserDefaults] objectForKey:@"password"]];
    userInfo = [[UILabel alloc]initWithFrame:CGRectMake(30, originHeight+userPhoto.bounds.size.height+10, 260, 120)];
    userInfo.lineBreakMode = NSLineBreakByWordWrapping;
    userInfo.numberOfLines = 0;
    userInfo.text = [NSString stringWithFormat:@"%@\n%@",money,phone];
    userInfo.textAlignment = NSTextAlignmentCenter;
    [userInfo setBackgroundColor:[UIColor whiteColor]];
    
#pragma mark - 功能按钮
    for (int i = 0; i<2; i++) {
        appButton = [[UIButton alloc]initWithFrame:CGRectMake(60+i*(70+60), originHeight+userPhoto.bounds.size.height+userInfo.bounds.size.height+80, 70, 70)];
        [appButton setImage:[UIImage imageNamed:@"login.png"] forState:UIControlStateNormal];
        [appButton addTarget:self action:@selector(onClickOpen:) forControlEvents:UIControlEventTouchUpInside];
        appButton.tag = i;
        
        appName = [[UILabel alloc]initWithFrame:CGRectMake(60+i*(70+60), originHeight+userPhoto.bounds.size.height+userInfo.bounds.size.height+150, 70, 20)];
        appName.backgroundColor = [UIColor clearColor];
        appName.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
        appName.textAlignment = NSTextAlignmentCenter;
        if (i == 0) {
            appName.text = @"修改密码";
        }
        else
        {
            appName.text = @"绑定手机";
        }
        
        [self.view addSubview:appName];
        [self.view addSubview:appButton];
    }
    
    
    [self.view addSubview:userPhoto];
    [self.view addSubview:userInfo];
}

#pragma mark - 返回按钮
-(void)backAction:(UIButton *)backButton
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)onClickOpen:(UIButton *)button
{
    if(button.tag == 0)
    {
        if (bindPhoneView != nil) {
            [JWFolders closeCurrentFolder];
        }
        changePasswordView = [[ChangePasswordView alloc]initWithFrame:CGRectMake(0, 0, 320, 200)];
        changePasswordView.delegate=self;
        
        CGPoint openPoint = CGPointMake(0.0f, self.view.frame.size.height-130-span);
        [JWFolders openFolderWithContentView:changePasswordView position:openPoint containerView:self.view sender:self direction:0];
        
    }
    if(button.tag == 1) {
        if (changePasswordView != nil) {
            [JWFolders closeCurrentFolder];
        }
        NSString *tag;
        if ([phone isEqualToString:@"未绑定手机，请尽快绑定！"]) {
            tag = @"0";
        }
        else
        {
            tag = @"1";
        }
        bindPhoneView = [[BindPhoneView alloc]initWithFrame:CGRectMake(0, 0, 320, 200) withTag:tag];
        bindPhoneView.delegate = self;
        
        CGPoint openPoint = CGPointMake(0.0f, self.view.frame.size.height - 130 - span);
        [JWFolders openFolderWithContentView:bindPhoneView position:openPoint containerView:self.view sender:self direction:0];
    }
}

-(void)getResult:(NSString *)result
{
    if ([result isEqualToString:@"0"]) {
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:nil message:@"密码修改成功,请重新登录!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertView show];
        LoginViewController *loginViewController=[[LoginViewController alloc] init];
        [self.navigationController pushViewController:loginViewController animated:YES];
    }
}

-(void)getOnResult:(NSString *)result
{
    if ([result isEqualToString:@"0"]) {
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:nil message:@"验证码错误!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertView show];
    }
    else if ([result isEqualToString:@"1"]) {
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:nil message:@"手机绑定成功!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertView show];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

//键盘回收
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UIView *view in self.view.subviews)
    {
        [view resignFirstResponder];
    }
}

//上移UIView
-(void)transformView:(NSNotification *)aNSNotification{
    
    //获取键盘弹出前的Rect
    NSValue *keyBoardBeginBounds=[[aNSNotification userInfo]objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGRect beginRect=[keyBoardBeginBounds CGRectValue];
    
    //获取键盘弹出后的Rect
    NSValue *keyBoardEndBounds=[[aNSNotification userInfo]objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect endRect=[keyBoardEndBounds CGRectValue];
    
    //获取键盘位置变化前后纵坐标Y的变化值
    CGFloat deltaY=endRect.origin.y-beginRect.origin.y;
    if (deltaY > 0 ) {
        deltaY = deltaY - span - 130;
    }
    else
    {
        deltaY = deltaY + span + 130;
    }
    
    //在0.25秒内完成self.view的Fram变化，等于是给self.view添加一个向上移动 deltaY 的动画
    [UIView animateWithDuration:0.25f animations:^{
        [self.view setFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+deltaY, self.view.frame.size.width , self.view.frame.size.height)];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
