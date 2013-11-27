//
//  ChangeCardPasswordViewController.m
//  wirelessuda
//
//  Created by Mac on 13-11-18.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "ChangeCardPasswordViewController.h"

@interface ChangeCardPasswordViewController ()

@end

@implementation ChangeCardPasswordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor=[UIColor whiteColor];
        self.navigationItem.title=@"修改密码";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UILabel *beformPsdLabel = [[UILabel alloc]init];
    beformPsdLabel.frame = CGRectMake(20, 80, 80, 30);
    beformPsdLabel.text = @"原密码:";
    [self.view addSubview:beformPsdLabel];
    
    UITextField *beformPsdText = [[UITextField alloc]init];
    beformPsdText.frame = CGRectMake(100, 80, 180 ,30);
    beformPsdText.borderStyle = UITextBorderStyleRoundedRect;
    beformPsdText.placeholder = @"请输入原密码";
    beformPsdText.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
    beformPsdText.secureTextEntry = YES;
    [self.view addSubview:beformPsdText];
    
#pragma mark - 新密码
    UILabel *newPsdLabel = [[UILabel alloc]init];
    newPsdLabel.frame = CGRectMake(20, 120, 80, 30);
    newPsdLabel.text = @"新密码:";
    [self.view addSubview:newPsdLabel];
    UITextField *newPsdText = [[UITextField alloc]init];
    newPsdText.frame = CGRectMake(100, 120, 180, 30);
    newPsdText.borderStyle = UITextBorderStyleRoundedRect;
    newPsdText.placeholder = @"请输入新密码";
    newPsdText.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
    newPsdText.secureTextEntry = YES;
    [self.view addSubview:newPsdText];
    
#pragma mark - 确认密码
    UILabel *conformPsdLabel = [[UILabel alloc]init];
    conformPsdLabel.frame = CGRectMake(20, 160, 80, 30);
    conformPsdLabel.text = @"确认密码:";
    [self.view addSubview:conformPsdLabel];
    UITextField *conformPsdText = [[UITextField alloc]init];
    conformPsdText.frame = CGRectMake(100, 160, 180, 30);
    conformPsdText.borderStyle = UITextBorderStyleRoundedRect;
    conformPsdText.placeholder = @"请确认新密码";
    conformPsdText.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
    conformPsdText.secureTextEntry = YES;
    [self.view addSubview:conformPsdText];
    
#pragma mark - 确认按钮
    UIButton *ok=[UIButton buttonWithType:UIButtonTypeCustom];
    ok.frame=CGRectMake(80, 220, 140, 44);
    [ok setTitle:@"确定修改" forState:UIControlStateNormal];
    [ok.titleLabel setFont:[UIFont systemFontOfSize:20]];
    [ok setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [ok setBackgroundColor:[UIColor lightGrayColor]];
    [ok addTarget:self action:@selector(onConfirmClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ok];
    
}
-(void)onConfirmClick
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
