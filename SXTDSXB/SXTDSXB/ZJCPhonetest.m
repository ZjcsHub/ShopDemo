//
//  ZJCPhonetest.m
//  SXTDSXB
//
//  Created by 赵继超 on 16/8/18.
//  Copyright © 2016年 赵继超. All rights reserved.
//

#import "ZJCPhonetest.h"
#import "ZJCPhoneView.h"
@interface ZJCPhonetest ()

@property (nonatomic, strong) ZJCPhoneView * phoneview;

@end

@implementation ZJCPhonetest

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =MainColor;
    self.edgesForExtendedLayout =0;
    [self.view addSubview:self.phoneview];
    __weak typeof (self) weakself =self;
    [_phoneview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(weakself.view);
        make.height.equalTo(@200);
    }];
    
}

- (ZJCPhoneView *)phoneview{
    if (!_phoneview) {
        _phoneview = [[ZJCPhoneView alloc] init];
    }
    return _phoneview;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
