//
//  CheckNetWork.m
//  wirelessuda
//
//  Created by Mac on 13-11-26.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "CheckNetWork.h"
#import "ASIFormDataRequest.h"

@implementation CheckNetWork
//1.0:有网，1.无网
+(NSString *)getNetWorkStatus
{
    ASIFormDataRequest *request=[[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:@"http://wg.suda.edu.cn/indexm.asp"]];
    [request startSynchronous];
    NSData *responseData = [request  responseData];
    if (responseData!=nil) {
        return @"0";
    }else{
        return @"1";
    }
}

@end
