//
//  BusLineDataSourde.m
//  SchoolBusTest
//
//  Created by Tkey on 13-11-20.
//  Copyright (c) 2013年 TKey. All rights reserved.
//

#import "BusLineDataSourde.h"




@implementation BusLineDataSourde



- (void)readFromPlist:(NSString *) plistName
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    LineData = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
//    NSLog(@"%@",LineData);
}



- (id)init
{
    self = [super init];
    if (self) {
        LineData = [[NSDictionary alloc] init];
    }
    return self;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedData];
}

+ (BusLineDataSourde *)sharedData
{
    static BusLineDataSourde *sharedData = nil;
    if (!sharedData) {
        sharedData = [[super allocWithZone:nil] init];
    }
    [sharedData readFromPlist:@"BuslineData"];
    return sharedData;
}

- (NSDictionary *)allLineData
{
    return LineData;
}

- (NSArray *)campusArray
{
    NSMutableArray *campus = [[NSMutableArray alloc] init];
    
    for (id key in LineData.allKeys) {
        [campus addObject:key];
    }
    [campus sortedArrayUsingSelector:@selector(compare:)];
    return campus;
}

- (NSArray *)linesArrayAndTimeSorted:(NSString *)campus
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSHourCalendarUnit | NSMinuteCalendarUnit fromDate:[NSDate date]];
    NSInteger hour = [components hour];
    NSInteger minute = [components minute];
    
    NSMutableArray  *lines = [[NSMutableArray alloc] init];
    NSArray * keys = [[NSArray alloc] initWithArray:[[LineData objectForKey:campus] allKeys]];
    
    for (int i = 0; i < keys.count; i++) {
        [lines addObject:[[LineData objectForKey:campus] objectForKey:keys[i]]];
    }
    
    NSLog(@"这是%@",lines);
    
    NSMutableArray  *returnLines = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < lines.count; i++) {
        NSMutableDictionary *temp = [[NSMutableDictionary alloc] init];
        NSMutableArray *time = [[NSMutableArray alloc] init];
        time = [[lines[i] objectForKey:@"Time"] mutableCopy];
        
        NSArray *keys = [[NSArray alloc] initWithArray:[lines[i] allKeys]];
        for (id key in keys) {
            [temp setObject:[lines[i] objectForKey:key] forKey:key];
        }
        
        [temp setObject:[NSNumber numberWithInt:3] forKey:@"Flag"];
        
        for (int y = 0; y < time.count; y++) {
            NSDateComponents *componentsTemp = [[NSCalendar currentCalendar] components:NSHourCalendarUnit | NSMinuteCalendarUnit fromDate:time[y]];
            NSInteger hourTemp = [componentsTemp hour];
            NSInteger minuteTemp = [componentsTemp minute];
            NSInteger last = (hourTemp * 60 + minuteTemp) - (hour * 60 + minute);
            if ((last < 60) && (last > 0)) {
                [temp setObject:[NSNumber numberWithInt:last] forKey:@"Last"];
                [temp setObject:[NSNumber numberWithInt:1] forKey:@"Flag"];
                break;
            }  else {
                if (last > 60) {
                    [temp setObject:[NSNumber numberWithInt:2] forKey:@"Flag"];
                    break;
                } else {
                    continue;
                }
            }
         
        }
        [returnLines addObject:temp];
    }
    
    
    NSLog(@"%@", returnLines);
    return returnLines;
}



@end
