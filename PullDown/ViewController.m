//
//  ViewController.m
//  PullDown
//
//  Created by マック太郎 on 2014/01/18.
//  Copyright (c) 2014年 マック太郎. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    PullDownView *view = [[PullDownView alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
    
    view.center = self.view.center;
    
    [self.view addSubview:view];
    view.contens = @[@"あ", @"い", @"う"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
