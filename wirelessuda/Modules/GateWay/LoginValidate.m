//
//  LoginValidate.m
//  wirelessuda
//
//  Created by Mac on 13-11-14.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "LoginValidate.h"

@implementation LoginValidate

//result=0:登录成功，result＝1:用户名为空，result＝2:密码为空，result＝3：用户名或者密码输入错误。
-(NSString *)validateLogin:(NSString *)username withPassword:(NSString*) password
{
    GateWayModel *gateWayModel=[GateWayModel shareInstance];
    gateWayModel.delegate=self;
    [gateWayModel start:@"login" withUrl:@"http://jsglxt.suda.edu.cn/api_login.action" withParam1:username withParam2:password withParam3:nil withParam4:nil];
    if ([username isEqualToString:@""]) {
        return @"1";
    }else if ([password isEqualToString:@""]){
        return @"2";
    }else if ([self.status isEqualToString:@"0"]){
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        
        [defaults setObject:username forKey:@"username"];
        [defaults setObject:password forKey:@"password"];
        [defaults synchronize];
        NSLog(@"Data saved!");
        return @"0";
    }else if (self.status==nil||[self.status isEqualToString:@"1"]){
        return @"3";
    }
    return nil;
}

-(void)getLoginResult:(NSString *)status
{
    self.status=status;
}
@end
