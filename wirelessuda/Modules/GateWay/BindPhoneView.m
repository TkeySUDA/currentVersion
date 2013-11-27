//
//  BindPhoneView.m
//  wirelessuda
//
//  Created by Mac on 13-11-19.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "BindPhoneView.h"
#import "BindPhoneVaildata.h"
#import "MBProgressHUD.h"

@implementation BindPhoneView

@synthesize phoneNumberText;
@synthesize codeText;
@synthesize cancelBind;
@synthesize identifyNumLabel;
@synthesize identifyNumText;
@synthesize confirmCancelBind;
@synthesize delegate;
@synthesize code;
@synthesize onstatus;
@synthesize offstatus;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame withTag:(NSString *)tag
{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor colorWithRed:210/255.0 green:210/255.0 blue:210/255.0 alpha:1];
    if ([tag isEqualToString:@"0"]) {
#pragma mark - 手机号码
        UILabel *phoneNumberLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 20, 80, 40)];
        phoneNumberLabel.text = @"手机号码:";
        
        phoneNumberText = [[UITextField alloc]initWithFrame:CGRectMake(100, 20, 200, 40)];
        phoneNumberText.borderStyle=UITextBorderStyleLine;
        phoneNumberText.borderStyle = UITextBorderStyleRoundedRect;
        phoneNumberText.keyboardType = UIKeyboardTypeNumberPad;
        phoneNumberText.placeholder = @"请输入手机号码";
        phoneNumberText.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
        
#pragma mark - 验证码
        UILabel *codeLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 80, 80, 40)];
        codeLabel.text = @"验证码:";
        
        codeText = [[UITextField alloc]initWithFrame:CGRectMake(100, 80, 200, 40)];
        codeText.borderStyle=UITextBorderStyleLine;
        codeText.borderStyle = UITextBorderStyleRoundedRect;
        codeText.keyboardType = UIKeyboardTypeNumberPad;
        codeText.placeholder = @"请输入验证码";
        codeText.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
        
#pragma mark - 获取验证码
        UIButton *confirmButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        confirmButton.frame = CGRectMake(50, 160, 100, 40);
        [confirmButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        confirmButton.titleLabel.font=[UIFont systemFontOfSize:18];
        [confirmButton addTarget:self action:@selector(onConfirmButton:) forControlEvents:UIControlEventTouchUpInside];
        confirmButton.highlighted = NO;
        
#pragma mark - 确认绑定
        UIButton *conYesButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        conYesButton.frame = CGRectMake(180, 160, 100, 40);
        [conYesButton setTitle:@"确认绑定" forState:UIControlStateNormal];
        conYesButton.titleLabel.font=[UIFont systemFontOfSize:18];
        [conYesButton addTarget:self action:@selector(onConYesButton:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self addSubview:phoneNumberLabel];
        [self addSubview:phoneNumberText];
        [self addSubview:codeLabel];
        [self addSubview:codeText];
        [self addSubview:confirmButton];
        [self addSubview:conYesButton];
        
    }
    if ([tag isEqualToString:@"1"]) {
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(10, 20, 300, 60)];
        lable.lineBreakMode = UILineBreakModeWordWrap;
        lable.numberOfLines = 0;
        lable.text = @"当前已经绑定手机!\n正在进行解绑操作!";
        [lable.font fontWithSize:18];
        lable.textAlignment = UITextAlignmentCenter;
        
        cancelBind = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        cancelBind.frame = CGRectMake(120, 70, 80, 40);
        [cancelBind setTitle:@"解除绑定" forState:UIControlStateNormal];
        cancelBind.titleLabel.font=[UIFont systemFontOfSize:18];
        [cancelBind addTarget:self action:@selector(onCancelButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:lable];
        [self addSubview:cancelBind];
    }
    
#pragma mark - 键盘消失
    UITapGestureRecognizer* tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tapGesture.delegate=(id<UIGestureRecognizerDelegate>)self;
    [self addGestureRecognizer:tapGesture];
    
    return self;
}

-(void)onConfirmButton:(id)sender
{
    BindPhoneVaildata *bindPhoneVaildata = [[BindPhoneVaildata alloc]init];
    NSString *response = [bindPhoneVaildata judgePhoneNum:phoneNumberText];
    if (response != nil) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = response;
        hud.margin = 10.f;
        hud.yOffset = 0.0f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:2];
        return;
    }
    self.code = [bindPhoneVaildata validataCode:phoneNumberText.text];
}

-(void)onConYesButton:(id)sender
{
    BindPhoneVaildata *bindPhoneVaildata = [[BindPhoneVaildata alloc]init];
    NSString *response = [bindPhoneVaildata judgePhoneNum:phoneNumberText];
    NSString *newresponse = [bindPhoneVaildata judgeCode:codeText];
    if (response != nil) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = response;
        hud.margin = 10.f;
        hud.yOffset = 0.0f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:2];
        return;
    }
    if (newresponse != nil) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = response;
        hud.margin = 10.f;
        hud.yOffset = 0.0f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:2];
        return;
    }
    self.onstatus = [bindPhoneVaildata validataOn:[[NSUserDefaults standardUserDefaults]objectForKey:@"username"] withPhone:phoneNumberText.text withCode:codeText.text withseqID:self.code];
    [delegate getOnResult:self.onstatus];
}

-(void)onCancelButton:(UIButton *)button
{
    button.hidden = YES;

    identifyNumLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 90, 80, 40)];
    identifyNumLabel.text = @"身份证号:";
    
    identifyNumText = [[UITextField alloc]initWithFrame:CGRectMake(100, 90, 200, 40)];
    identifyNumText.borderStyle=UITextBorderStyleLine;
    identifyNumText.keyboardType = UIKeyboardTypeNumberPad;
    identifyNumText.borderStyle = UITextBorderStyleRoundedRect;
    identifyNumText.placeholder = @"请输入身份证号";
    identifyNumText.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
    
    confirmCancelBind = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    confirmCancelBind.frame = CGRectMake(100, 140, 100, 40);
    [confirmCancelBind setTitle:@"确认取消绑定" forState:UIControlStateNormal];
    [confirmCancelBind addTarget:self action:@selector(onclickIdentifyNum:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:confirmCancelBind];
    [self addSubview:identifyNumText];
    [self addSubview:identifyNumLabel];
}

-(void)onclickIdentifyNum:(id)sender
{
    BindPhoneVaildata *bindPhoneVaildata = [[BindPhoneVaildata alloc]init];
    NSString *response = [bindPhoneVaildata judgeIdentify:identifyNumText];
    if (response != nil) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = response;
        hud.margin = 10.f;
        hud.yOffset = 0.0f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:2];
        return;
    }
    self.offstatus = [bindPhoneVaildata validataIdentify:[[NSUserDefaults standardUserDefaults]objectForKey:@"username"] withIdentify:identifyNumText.text];
    [self.delegate getOnResult:self.offstatus];
}

-(void)getCodeResult:(NSString *)status
{
    self.code = status;
}

-(void)getOnBindResult:(NSString *)status
{
    self.onstatus = status;
}

-(void)getOffResult:(NSString *)result
{
    self.offstatus = result;
}

#pragma mark - 触摸键盘消失
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([touch.view isKindOfClass:[UIButton class]]) {
        return NO;
    }
    return YES;
}

-(void)tap:(UIGestureRecognizer*)gesture
{
    if (self.frame.origin.y==-85) {
        [UIView animateWithDuration:0.3 animations:^{
            self.frame=CGRectOffset(self.frame, 0, 85);
        }];
    }
    [self endEditing:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
