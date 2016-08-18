//
//  ZJCLandView.m
//  SXTDSXB
//
//  Created by 赵继超 on 16/8/18.
//  Copyright © 2016年 赵继超. All rights reserved.
//

#import "ZJCLandView.h"
@interface ZJCLandView ()<UITextFieldDelegate>
@property (strong, nonatomic)   UILabel *tostLabel;              /** 提示label */
@property (strong, nonatomic)   UITextField *userNameText;              /** 手机号text */
@property (strong, nonatomic)   UITextField *passwordText;              /** 密码text */
@property (strong, nonatomic)   UIButton *nextBtn;              /** 下一步button */
@property (strong, nonatomic)   UIButton *goLoginBtn;              /** 去登录 */
@property (strong, nonatomic)   UIButton *qqLoginBtn;              /** qq登录button */
@property (strong, nonatomic)   UIButton *WXLoginBtn;              /** 微信登陆button */
@property (strong, nonatomic)   UIButton *sinaLoginBtn;              /** 新浪登录 */
@property (strong, nonatomic)   UILabel *oneLogin;              /** 一键登录 */
@property (strong, nonatomic)   UILabel *lineLabel;              /** 分割线 */
@property (strong, nonatomic)   UILabel *textBackLabel;              /** 输入框背景图 */
@property (strong, nonatomic)   UILabel *textLineLabel;              /** text中间的分割线 */

@end

@implementation ZJCLandView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = MainColor;
    self.edgesForExtendedLayout = 0;
    [self.view addSubview:self.tostLabel];
    [self.view addSubview:self.textBackLabel];
    [self.view addSubview:self.userNameText];
    [self.view addSubview:self.passwordText];
    [self.view addSubview:self.textLineLabel];
    [self.view addSubview:self.nextBtn];
    [self.view addSubview:self.goLoginBtn];
    [self.view addSubview:self.lineLabel];
    [self.view addSubview:self.oneLogin];
    [self.view addSubview:self.qqLoginBtn];
    [self.view addSubview:self.sinaLoginBtn];
    [self.view addSubview:self.WXLoginBtn];
    
    __weak typeof (self) weakSelf = self;
    
    [_tostLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@35);
        make.top.right.equalTo(weakSelf.view);
        make.left.equalTo(weakSelf.view.mas_left).offset(15);
    }];
    
    [_textBackLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@89);
        make.top.equalTo(weakSelf.tostLabel.mas_bottom);
        make.left.equalTo(weakSelf.view.mas_left).offset(-1);
        make.right.equalTo(weakSelf.view.mas_right).offset(1);
    }];
    
    [_userNameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view).offset(15);
        make.height.equalTo(@44);
        make.top.equalTo(weakSelf.textBackLabel.mas_top);
    }];
    
    [_passwordText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view).offset(15);
        make.height.equalTo(@44);
        make.top.equalTo(weakSelf.userNameText.mas_bottom).offset(1);
    }];
    
    [_textLineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@1);
        make.left.equalTo(weakSelf.textBackLabel.mas_left).offset(15);
        make.right.equalTo(weakSelf.textBackLabel.mas_right).offset(-15);
        make.centerY.equalTo(weakSelf.textBackLabel.mas_centerY);
    }];
    
    [_nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left).offset(16);
        make.right.equalTo(weakSelf.view.mas_right).offset(-16);
        make.height.equalTo(@35);
        make.top.equalTo(weakSelf.passwordText.mas_bottom).offset(15);
    }];
    
    [_goLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 16));
        make.right.equalTo(weakSelf.view.mas_right).offset(-15);
        make.top.equalTo(weakSelf.nextBtn.mas_bottom).offset(23);
    }];
    
    [_oneLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80, 20));
        make.centerX.equalTo(weakSelf.view.mas_centerX);
        make.top.equalTo(weakSelf.nextBtn.mas_bottom).offset(57);
    }];
    
    [_WXLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.oneLogin.mas_bottom).offset(20);
        make.size.mas_equalTo(CGSizeMake(45, 45));
        make.centerX.equalTo(weakSelf.view.mas_centerX);
    }];
    
    [_qqLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.oneLogin.mas_bottom).offset(20);
        make.size.mas_equalTo(CGSizeMake(45, 45));
        make.right.equalTo(weakSelf.WXLoginBtn.mas_left).offset(-(VIEW_WIDTH-135)/4);
    }];
    
    [_sinaLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.oneLogin.mas_bottom).offset(20);
        make.size.mas_equalTo(CGSizeMake(45, 45));
        make.left.equalTo(weakSelf.WXLoginBtn.mas_right).offset((VIEW_WIDTH-135)/4);
    }];
    
    [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.oneLogin.mas_centerY);
        make.height.equalTo(@1);
        make.left.equalTo(weakSelf.view.mas_left).offset(16);
        make.right.equalTo(weakSelf.view.mas_right).offset(-16);
    }];
}

- (UILabel *)tostLabel{
    if (!_tostLabel) {
        _tostLabel = [[UILabel alloc]init];
        _tostLabel.text = @"请输入手机号码注册新用户";
        _tostLabel.font = [UIFont systemFontOfSize:14.0];
        _tostLabel.textColor = [UIColor colorWithRed:0.49 green:0.49 blue:0.49 alpha:1.00];
    }
    return _tostLabel;
}

- (UILabel *)textBackLabel{
    if (!_textBackLabel) {
        _textBackLabel = [[UILabel alloc]init];
        _textBackLabel.backgroundColor = [UIColor whiteColor];
        _textBackLabel.layer.borderWidth = 1;
        _textBackLabel.layer.borderColor = [UIColor colorWithRed:0.80 green:0.78 blue:0.80 alpha:1.00].CGColor;
    }
    return _textBackLabel;
}

- (UITextField *)userNameText{
    if (!_userNameText) {
        _userNameText = [[UITextField alloc]init];
        _userNameText.delegate = self;
        _userNameText.placeholder = @"请输入手机号码";
        
    }
    return _userNameText;
}

- (UITextField *)passwordText{
    if (!_passwordText) {
        _passwordText = [[UITextField alloc]init];
        _passwordText.delegate = self;
        _passwordText.placeholder = @"设置账号密码";
        
    }
    return _passwordText;
}

- (UILabel *)textLineLabel{
    if (!_textLineLabel) {
        _textLineLabel = [[UILabel alloc]init];
        _textLineLabel.backgroundColor =[UIColor colorWithRed:0.80 green:0.78 blue:0.80 alpha:1.00];
    }
    return _textLineLabel;
}

- (UIButton *)nextBtn{
    if (!_nextBtn) {
        _nextBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_nextBtn setTitle:@"下一步" forState:(UIControlStateNormal)];
        _nextBtn.backgroundColor = [UIColor colorWithRed:0.92 green:0.92 blue:0.92 alpha:1.00];
        [_nextBtn setTitleColor:[UIColor colorWithRed:0.58 green:0.58 blue:0.58 alpha:1.00] forState:(UIControlStateNormal)];
    }
    return _nextBtn;
}

- (UIButton *)goLoginBtn{
    if (!_goLoginBtn) {
        _goLoginBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_goLoginBtn setTitle:@"去登录" forState:(UIControlStateNormal)];
        [_goLoginBtn setTitleColor:[UIColor colorWithRed:0.00 green:0.71 blue:0.98 alpha:1.00] forState:(UIControlStateNormal)];
        _goLoginBtn.backgroundColor = MainColor;
    }
    return _goLoginBtn;
}

- (UILabel *)oneLogin{
    if (!_oneLogin) {
        _oneLogin = [[UILabel alloc]init];
        _oneLogin.text = @"一键登录";
        _oneLogin.textColor = [UIColor colorWithRed:0.78 green:0.78 blue:0.78 alpha:1.00];
        _oneLogin.backgroundColor = MainColor;
        _oneLogin.textAlignment = NSTextAlignmentCenter;
        _oneLogin.font = [UIFont systemFontOfSize:16.0];
    }
    return _oneLogin;
}

- (UIButton *)qqLoginBtn{
    if (!_qqLoginBtn) {
        _qqLoginBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_qqLoginBtn setImage:[UIImage imageNamed:@"登录界面qq登陆"] forState:(UIControlStateNormal)];
    }
    return _qqLoginBtn;
}

- (UIButton *)WXLoginBtn{
    if (!_WXLoginBtn) {
        _WXLoginBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_WXLoginBtn setImage:[UIImage imageNamed:@"登录界面微信登录"] forState:(UIControlStateNormal)];
    }
    return _WXLoginBtn;
}

- (UIButton *)sinaLoginBtn{
    if (!_sinaLoginBtn) {
        _sinaLoginBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_sinaLoginBtn setImage:[UIImage imageNamed:@"登陆界面微博登录"] forState:(UIControlStateNormal)];
    }
    return _sinaLoginBtn;
}

- (UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = [UIColor colorWithRed:0.81 green:0.80 blue:0.82 alpha:1.00];
    }
    return _lineLabel;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end


