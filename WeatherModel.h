//
//  WeatherModel.h
//  wirelessuda
//
//  Created by 叶帆 on 13-11-24.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASINetworkQueue.h"

@protocol WeatherDelegate;

@interface WeatherModel : NSObject<ASIHTTPRequestDelegate>

@property (strong, nonatomic) id<WeatherDelegate> delegate;
@property (strong, nonatomic) NSString *cityCode;

+ (WeatherModel *)shareInstance;
- (NSString *)getCityCode;//返回城市代码
- (void) cityUrl;

@end

@protocol WeatherDelegate <NSObject>

-(void)getResult:(NSDictionary *)cityInfo;

@end
