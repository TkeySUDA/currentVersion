//
//  GateWayModel.m
//  wirelessuda
//
//  Created by Mac on 13-11-13.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "GateWayModel.h"
#import "SBJson.h"
#import "ASIHTTPRequest.h"

@implementation GateWayModel

@synthesize delegate;

+(GateWayModel *)shareInstance
{
    GateWayModel *gateWayModel=[[GateWayModel alloc]init];
    return gateWayModel;
}

#pragma mark－ request入口
- (void) start:(NSString *)tag withUrl:(NSString *)url withParam1:(NSString *)param1 withParam2:(NSString *)param2 withParam3:(NSString *)param3 withParam4:(NSString *)param4;
{
    if ([tag isEqualToString:@"login"]) {
        NSString *urlString = [NSString stringWithFormat:@"%@?username=%@&password=%@",url,param1,param2];
        NSURL *urlLast=[NSURL URLWithString:urlString];
        ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:urlLast];
        request.delegate=self;
        request.tag=Login;
        [request startSynchronous];
    }
    else if ([tag isEqualToString:@"changePassword"]){
        NSString *urlString = [NSString stringWithFormat:@"%@?username=%@&password=%@&newPassword=%@",url,param1,param2,param3];
        NSURL *urlLast=[NSURL URLWithString:urlString];
        ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:urlLast];
        request.delegate=self;
        request.tag=ChangePassWord;
        [request startSynchronous];
    }
    else if ([tag isEqualToString:@"userInfoTurnOver"]){
        NSString *urlString = [NSString stringWithFormat:@"%@?username=%@&password=%@",url,param1,param2];
        NSURL *urlLast = [NSURL URLWithString:urlString];
        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:urlLast];
        request.delegate = self;
        request.tag = UserInfoTurnOver;
        [request startSynchronous];
    }
    else if ([tag isEqualToString:@"userInfoBindPhone"]){
        NSString *urlString = [NSString stringWithFormat:@"%@?username=%@&password=%@",url,param1,param2];
        NSURL *urlLast = [NSURL URLWithString:urlString];
        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:urlLast];
        request.delegate = self;
        request.tag = UserInfoBindPhone;
        [request startSynchronous];
    }
    else if ([tag isEqualToString:@"code"]){
        NSString *urlString = [NSString stringWithFormat:@"%@?phoneNum=%@",url,param1];
        NSURL *urlLast = [NSURL URLWithString:urlString];
        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:urlLast];
        request.delegate = self;
        request.tag = Code;
        [request startSynchronous];
    }
    else if ([tag isEqualToString:@"onBind"]){
        NSString *urlString = [NSString stringWithFormat:@"%@?username=%@&phoneNum=%@&code=%@&seqID=%@",url,param1,param2,param3,param4];
        NSURL *urlLast = [NSURL URLWithString:urlString];
        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:urlLast];
        request.delegate = self;
        request.tag = OnBind;
        [request startSynchronous];
    }
    else if ([tag isEqualToString:@"offBind"]){
        NSString *urlString = [NSString stringWithFormat:@"%@?username=%@&identifyNum=%@",url,param1,param2];
        NSURL *urlLast = [NSURL URLWithString:urlString];
        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:urlLast];
        request.delegate = self;
        request.tag = OffBind;
        [request startSynchronous];
    }
}

#pragma mark－requestFinish回调函数
-(void)requestFinished:(ASIHTTPRequest *)request
{
    NSString *responseString=request.responseString;
    if (request.tag==Login) {
        if (responseString==nil) {
            [delegate getLoginResult:@"1"];
        }else{
            NSDictionary *result=[responseString JSONValue];
            NSString *status=[result objectForKey:@"status"];
            [delegate getLoginResult:status];
        }
    }
    else if (request.tag==ChangePassWord){
        if (responseString == nil) {
            [delegate getChangePasswordResult:@"1"];
        }else
        {
            NSDictionary *result = [responseString JSONValue];
            NSString *status = [result objectForKey:@"status"];
            [delegate getChangePasswordResult:status];
        }
    }
    else if (request.tag == UserInfoTurnOver){
        if (responseString == nil) {
            [delegate getUserInfoTurnOverResult:@"1"];
        }else{
            NSDictionary *result=[responseString JSONValue];
            NSString *status=[result objectForKey:@"remaining_money"];
            [delegate getUserInfoTurnOverResult:status];
        }
    }
    else if (request.tag == UserInfoBindPhone){
        if (responseString == nil) {
            [delegate getUserInfoBindPhoneResult:@"4" withPhoneNumber:nil];
        }else{
            NSDictionary *result=[responseString JSONValue];
            NSString *status=[result objectForKey:@"status"];
            NSString *phoneNumber = [result objectForKey:@"phoneNum"];
            [delegate getUserInfoBindPhoneResult:status withPhoneNumber:phoneNumber];
        }
    }
    else if (request.tag == Code){
        if (responseString == nil) {
            [delegate getCodeResult:@"1"];
        }
        else{
            NSDictionary *result = [responseString JSONValue];
            NSString *status = [result objectForKey:@"seqID"];
            [delegate getCodeResult:status];
        }
    }
    else if (request.tag == OnBind){
        if (responseString == nil) {
            [delegate getOnBindResult:@"4"];
        }
        else{
            NSDictionary *result = [responseString JSONValue];
            NSString *status = [result objectForKey:@"status"];
            [delegate getOnBindResult:status];
        }
    }
    else if (request.tag == OffBind){
        if (responseString == nil) {
            [delegate getOffBindResult:@"4"];
        }
        else{
            NSDictionary *result = [responseString JSONValue];
            NSString *status = [result objectForKey:@"status"];
            [delegate getOffBindResult:status];
        }
    }
}

@end


