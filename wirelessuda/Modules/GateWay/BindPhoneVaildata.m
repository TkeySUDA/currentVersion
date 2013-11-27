//
//  BindPhoneVaildata.m
//  wirelessuda
//
//  Created by 叶帆 on 13-11-22.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "BindPhoneVaildata.h"

@implementation BindPhoneVaildata

- (NSString *)judgePhoneNum:(UITextField *)phoneNumberText
{
    NSString *response = [[NSString alloc]init];
    
    if (!phoneNumberText||!phoneNumberText.text||[@"" isEqualToString:[phoneNumberText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]])
    {
        response = @"请输入手机号";
        return response;
    }
    return nil;
}

- (NSString *)judgeCode:(UITextField *)codeText
{
    NSString *response = [[NSString alloc]init];
    
    if (!codeText||!codeText.text||[@"" isEqualToString:[codeText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]]) {
        response = @"请输入验证码";
        return response;
    }
    return nil;
}

- (NSString *)judgeIdentify:(UITextField *)identifyText
{
    NSString *response = [[NSString alloc]init];
    
    if (!identifyText||!identifyText.text||[@"" isEqualToString:[identifyText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]]) {
        response = @"请输入身份证号!";
        return response;
    }
    
    return  nil;
}

- (NSString *)validataCode:(NSString *)phoneNum
{
    GateWayModel *gatewayModel = [GateWayModel shareInstance];
    gatewayModel.delegate = self;
    [gatewayModel start:@"code" withUrl:@"http://jsglxt.suda.edu.cn/api_getSeqId.action" withParam1:phoneNum withParam2:nil withParam3:nil withParam4:nil];
    if ([phoneNum isEqualToString:@""]) {
        return @"1";
    }else {
        return self.code;
    }
}

- (NSString *)validataOn:(NSString *)username withPhone:(NSString *)phoneNum withCode:(NSString *)code withseqID:(NSString *)seq
{
    GateWayModel *gatewayModel = [GateWayModel shareInstance];
    gatewayModel.delegate = self;
    [gatewayModel start:@"onBind" withUrl:@"http://jsglxt.suda.edu.cn/api_bindCellphone.action" withParam1:username withParam2:phoneNum withParam3:code withParam4:seq];
    if ([username isEqualToString:@""]) {
        return @"2";
    }else if ([self.onstatus isEqualToString:@"0"]){
        return @"0";
    }else if ([self.onstatus isEqualToString:@"1"]){
        return @"1";
    }
    return nil;
}

- (NSString *)validataIdentify:(NSString *)username withIdentify:(NSString *)identify
{
    GateWayModel *gatewayModel = [GateWayModel shareInstance];
    gatewayModel.delegate = self;
    [gatewayModel start:@"offBind" withUrl:@"http://jsglxt.suda.edu.cn/api_cancelBind.action" withParam1:username withParam2:identify withParam3:nil withParam4:nil];
    if ([username isEqualToString:@""]) {
        return @"2";
    }else if ([self.offstatus isEqualToString:@"0"]){
        return @"0";
    }else if ([self.offstatus isEqualToString:@"1"]){
        return @"1";
    }
    return nil;
}

-(void)getCodeResult:(NSString *)status
{
    self.code = status;
}

-(void)getOnBindResult:(NSString *)status
{
    self.onstatus = status;
}

-(void)getOffBindResult:(NSString *)status
{
    self.offstatus = status;
}

@end
