//
//  WeatherModel.m
//  wirelessuda
//
//  Created by 叶帆 on 13-11-24.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "WeatherModel.h"
#import "SBJson.h"
#import "ASIHTTPRequest.h"

@implementation WeatherModel

@synthesize delegate;
@synthesize cityCode;

+ (WeatherModel *)shareInstance
{
    WeatherModel *weatherModel = [[WeatherModel alloc]init];
    return weatherModel;
}

- (NSString *)getCityCode
{
    //解析网址通过ip 获取城市天气代码
    NSURL *url = [NSURL URLWithString:@"http://61.4.185.48:81/g/"];
    
    //定义一个NSError对象，用于捕获错误信息
    NSError *error;
    NSString *jsonString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    
    //得到城市代码字符串，截取出城市代码
    NSString *Str;
    for (int i = 0; i<=[jsonString length]; i++)
    {
        for (int j = i+1; j <=[jsonString length]; j++)
        {
            Str = [jsonString substringWithRange:NSMakeRange(i, j-i)];
            if ([Str isEqualToString:@"id"]) {
                if (![[jsonString substringWithRange:NSMakeRange(i+3, 1)] isEqualToString:@"c"]) {
                    cityCode = [jsonString substringWithRange:NSMakeRange(i+3, 9)];
                    return cityCode;
                }
            }
        }
    }
    return nil;
}

- (void)cityUrl
{
    NSString *url = @"http://m.weather.com.cn/data/cityCode.html";
    url = [url stringByReplacingOccurrencesOfString:@"cityCode" withString:cityCode];
    NSURL *urlList = [NSURL URLWithString:url];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:urlList];
    request.delegate = self;
    [request startSynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSString *responseString=request.responseString;
    NSDictionary *response = [responseString JSONValue];
    NSDictionary *result = [response objectForKey:@"weatherinfo"];
    [delegate getResult:result];
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSError *error = [request error];
    NSLog(@">>>>>>>>>>>>>>>%@",error);
}

@end
