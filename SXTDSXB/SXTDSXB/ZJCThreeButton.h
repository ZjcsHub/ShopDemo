//
//  ZJCThreeButton.h
//  SXTDSXB
//
//  Created by 赵继超 on 16/8/18.
//  Copyright © 2016年 赵继超. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^QQloginBlock)(NSString *const string);

@interface ZJCThreeButton : UIView

@property (nonatomic,copy) QQloginBlock block;

@end
