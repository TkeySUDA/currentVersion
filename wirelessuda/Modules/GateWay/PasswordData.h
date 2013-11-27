//
//  PasswordData.h
//  wirelessuda
//
//  Created by 叶帆 on 13-11-13.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GateWayModel.h"

@interface PasswordData : NSObject<GateWayDelegtate>

@property (strong, nonatomic)NSString *status;

- (NSString *)judgePassword:(UITextField *)beformPsdText andNewPassword:(UITextField *)newPsdText andConfirmPassword:(UITextField *)conformPsdText;

- (NSString *)validataChangePassword:(NSString *)username withPassword:(NSString *)password withNewPassword:(NSString *) newpassword;

@end
