//
//  PasswordData.m
//  wirelessuda
//
//  Created by 叶帆 on 13-11-13.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "PasswordData.h"

@implementation PasswordData

- (NSString *)judgePassword:(UITextField *)beformPsdText andNewPassword:(UITextField *)newPsdText andConfirmPassword:(UITextField *)conformPsdText
{
    NSString *response = [[NSString alloc]init];
    
    if (!beformPsdText||!beformPsdText.text||[@"" isEqualToString:[beformPsdText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]]) {
        response = @"请输入原密码!";
        return response;
    }
    
    if (![beformPsdText.text isEqualToString:[[NSUserDefaults standardUserDefaults]objectForKey:@"password"]]) {
        response = @"原密码不正确,请重新输入!";
        return response;
    }
    
    if (!newPsdText||!newPsdText.text||[@"" isEqualToString:[newPsdText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]]) {
        response = @"请输入新密码!";
        return response;
    }
    
    if ([newPsdText.text length]< 6) {
        response = @"新密码长度太短!";
        return response;
    }
    
    if (!conformPsdText||!conformPsdText.text||[@"" isEqualToString:[conformPsdText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]]) {
        response = @"请确认新密码!";
        return response;
    }
    
    if (![conformPsdText.text isEqualToString:newPsdText.text]) {
        response = @"两次输入不一致,请重新输入!";
        conformPsdText.text = nil;
        return response;
    }
    
    return nil;
}

- (NSString *)validataChangePassword:(NSString *)username withPassword:(NSString *)password withNewPassword:(NSString *) newpassword
{
    GateWayModel *gatewayModel = [GateWayModel shareInstance];
    gatewayModel.delegate = self;
    [gatewayModel start:@"changePassword" withUrl:@"http://jsglxt.suda.edu.cn/api_changePsd.action" withParam1:username withParam2:password withParam3:newpassword withParam4:nil];
    if ([username isEqualToString:@""]) {
        return @"1";
    }else if ([password isEqualToString:@""]){
        return @"2";
    }else if ([self.status isEqualToString:@"0"]){
        return @"0";
    }else if (self.status==nil||[self.status isEqualToString:@"1"]){
        return @"3";
    }
    return nil;
}

-(void)getChangePasswordResult:(NSString *)status
{
    self.status = status;
    
}

@end
