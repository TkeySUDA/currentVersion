//
//  LoginValidate.h
//  wirelessuda
//
//  Created by Mac on 13-11-14.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GateWayModel.h"

@interface LoginValidate : NSObject<GateWayDelegtate>

@property (strong, nonatomic)NSString *status;

-(NSString *)validateLogin:(NSString *)username withPassword:(NSString*) password;

@end
