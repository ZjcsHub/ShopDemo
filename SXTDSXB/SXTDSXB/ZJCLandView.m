//
//  ZJCLandView.m
//  SXTDSXB
//
//  Created by 赵继超 on 16/8/18.
//  Copyright © 2016年 赵继超. All rights reserved.
//

#import "ZJCLandView.h"
#import "ZJCRegistView.h"
#import "ZJCThreeButton.h"
#import "ZJCPhonetest.h"
@interface ZJCLandView ()<UITextFieldDelegate>

@property (nonatomic, strong) ZJCRegistView * regisView;

@property (nonatomic, strong) ZJCThreeButton * buttonView;
@end

@implementation ZJCLandView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = MainColor;
    self.edgesForExtendedLayout = 0;
   
    [self.view addSubview:self.regisView];
    [self.view addSubview:self.buttonView];
    
    __weak typeof (self) weakself =self;
    [self.regisView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.equalTo(weakself.view);
        make.height.equalTo(@225);
    }];
    [self.buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.regisView.mas_bottom);
        make.left.right.equalTo(weakself.view);
        make.height.equalTo(@100);
    }];
    
}

-(ZJCRegistView *)regisView{
    if (!_regisView) {
        _regisView =[[ZJCRegistView alloc] init];
        __weak typeof (self) weakself =self;
        _regisView.block =^(NSDictionary * dict){
            ZJCPhonetest * test =[[ZJCPhonetest alloc] init];
            test.usermessage =dict;
            [weakself.navigationController pushViewController:test animated:YES];
        };
        
        _regisView.alertblock=^(UIAlertController * alert){
          [weakself presentViewController:alert animated:YES completion:^{
              dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                  [alert dismissViewControllerAnimated:YES completion:nil];
              });
          }];
        };
    }
    return _regisView;
}
-(ZJCThreeButton *)buttonView{
    if (!_buttonView) {
        _buttonView =[[ZJCThreeButton alloc] init];
    }
    return _buttonView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end


