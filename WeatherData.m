//
//  WeatherData.m
//  wirelessuda
//
//  Created by 叶帆 on 13-11-24.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "WeatherData.h"

@implementation WeatherData

- (void)startJSONSting
{
    WeatherModel *weather = [WeatherModel shareInstance];
    weather.delegate = self;
    [weather cityUrl];
}

- (void)getResult:(NSDictionary *)cityInfo
{
    self.result = cityInfo;
}

@end
