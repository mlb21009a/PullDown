//
//  PullDownView.h
//  PullDown
//
//  Created by マック太郎 on 2014/01/18.
//  Copyright (c) 2014年 マック太郎. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PullDownView : UITextField<UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>

//リスト項目
@property(nonatomic) NSArray *contens;

@end
