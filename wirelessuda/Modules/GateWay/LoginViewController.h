//
//  LoginViewController.h
//  WirelesSudaV1.0
//
//  Created by ivanfee on 13-8-7.
//  Copyright (c) 2013年 suda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@class RootViewController;

@interface LoginViewController : UIViewController<UITextFieldDelegate>
{
    UITextField *usernameText;
    UITextField *passwordText;
}

@property (strong, nonatomic)NSString *autoLogin;
@property (strong, nonatomic)UIButton* btnAutoLogin;
@end
