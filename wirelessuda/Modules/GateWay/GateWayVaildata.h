//
//  GateWayVaildata.h
//  wirelessuda
//
//  Created by 叶帆 on 13-11-20.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GateWayModel.h"

@interface GateWayVaildata : NSObject<GateWayDelegtate>

@property (strong, nonatomic)NSString *turnOver;
@property (strong, nonatomic)NSString *bindPhoneStatus;
@property (strong, nonatomic)NSString *phoneNumber;

-(NSString *)validataGataWayTurnOver:(NSString *)username withPassword:(NSString *)password;
-(NSString *)validataGataWayPhoneNumber:(NSString *)username withPassword:(NSString *)password;

@end
