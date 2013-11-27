//
//  AccountSettingViewController.m
//  wirelessuda
//
//  Created by Mac on 13-11-26.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "AccountSettingViewController.h"
#import "HelpAndSugestionViewController.h"

@interface AccountSettingViewController ()

@end

@implementation AccountSettingViewController
@synthesize tableView=_tableView;
@synthesize array;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor=[UIColor  whiteColor];
        self.navigationItem.title=@"账号设置";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
    array=[NSMutableArray arrayWithObjects:@"版本更新",@"功能介绍",@"帮助与反馈",@"开发人员",@"关于无线苏大", nil];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellWithIdentifier = @"AccountSetting";
    UITableViewCell *cell=[_tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellWithIdentifier];
    }
    cell.textLabel.text=[array objectAtIndex:indexPath.row];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==2) {
        HelpAndSugestionViewController *helpAndSugestionViewController=[[HelpAndSugestionViewController alloc]initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:helpAndSugestionViewController animated:YES];
        helpAndSugestionViewController.navigationController.navigationBar.hidden=NO;
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];

    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    self.navigationController.navigationBar.hidden=NO;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
