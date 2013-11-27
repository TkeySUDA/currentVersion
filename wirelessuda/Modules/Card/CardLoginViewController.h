//
//  CardLoginViewController.h
//  wirelessuda
//
//  Created by Mac on 13-11-17.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardLoginViewController : UIViewController

@property (strong, nonatomic)UILabel *usernameLabel;
@property (strong, nonatomic)UITextField *usernameField;
@property (strong, nonatomic)UILabel *passwordLabel;
@property (strong, nonatomic)UITextField *passwordField;
@property (strong, nonatomic)UIButton *loginButton;
@property (strong, nonatomic)UIButton *backButton;
@property (strong, nonatomic)UIButton *autoLoginButton;
@property (strong, nonatomic)UILabel *autoLoginLabel;

@end
