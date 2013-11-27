//
//  BusLineDataSourde.h
//  SchoolBusTest
//
//  Created by Tkey on 13-11-20.
//  Copyright (c) 2013年 TKey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BusLineDataSourde : NSObject
{
    NSDictionary *LineData;
}


+ (BusLineDataSourde *)sharedData;
- (void)readFromPlist:(NSString *) plistName;
- (NSDictionary *)allLineData;
- (NSArray *)linesArrayAndTimeSorted:(id)campus;

@end
