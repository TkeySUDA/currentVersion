//
//  GateWayVaildata.m
//  wirelessuda
//
//  Created by 叶帆 on 13-11-20.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "GateWayVaildata.h"

@implementation GateWayVaildata

//result=0:未绑定，result＝1:已经绑定，result＝2:账号为空，result = 3:密码为空, result＝4：用户名或者密码输入错误。

-(NSString *)validataGataWayTurnOver:(NSString *)username withPassword:(NSString *)password
{
    GateWayModel *gateWayModel = [GateWayModel shareInstance];
    gateWayModel.delegate = self;
    [gateWayModel start:@"userInfoTurnOver" withUrl:@"http://jsglxt.suda.edu.cn/api_money.action" withParam1:username withParam2:password withParam3:nil withParam4:nil];
    if ([username isEqualToString:@""]) {
        return @"1";
    }else if ([password isEqualToString:@""]){
        return @"2";
    }else if ([self.turnOver isEqualToString:@"1"]){
        return @"3";
    }else {
        return [NSString stringWithFormat:@"当前账号余额为%@元",self.turnOver];
    }
}

-(NSString *)validataGataWayPhoneNumber:(NSString *)username withPassword:(NSString *)password
{
    GateWayModel *gateWayModel = [GateWayModel shareInstance];
    gateWayModel.delegate = self;
    [gateWayModel start:@"userInfoBindPhone" withUrl:@"http://jsglxt.suda.edu.cn/api_isBindCellphone.action" withParam1:username withParam2:password withParam3:nil withParam4:nil];
    if ([username isEqualToString:@""]) {
        return @"2";
    }else if ([password isEqualToString:@""]){
        return @"3";
    }else if ([self.bindPhoneStatus isEqualToString:@"0"]){
        return @"未绑定手机，请尽快绑定！";
    }else if ([self.bindPhoneStatus isEqualToString:@"1"]){
        return [NSString stringWithFormat:@"已绑定手机，号码为%@",self.phoneNumber];
    }
    return nil;
}

-(void)getUserInfoTurnOverResult:(NSString *)status
{
    self.turnOver = status;
}

-(void)getUserInfoBindPhoneResult:(NSString *)status withPhoneNumber:(NSString *)number
{
    self.bindPhoneStatus = status;
    self.phoneNumber = number;
}

@end
