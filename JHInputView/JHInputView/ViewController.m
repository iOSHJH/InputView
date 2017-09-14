//
//  ViewController.m
//  JHInputView
//
//  Created by 黄俊煌 on 2017/9/14.
//  Copyright © 2017年 yunshi. All rights reserved.
//

#import "ViewController.h"
#import "JHTextField.h"
#import "JHTextView.h"

@interface ViewController ()

@property (nonatomic, strong) JHTextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    JHTextField *textField = [[JHTextField alloc] initWithFrame:CGRectMake(50, 50, 300, 44)];
    textField.limitLength = 5;
    textField.placeholder = @"请输入~";
    textField.layer.borderWidth = 1;
    textField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.view addSubview:textField];
    
    JHTextView *textView = [[JHTextView alloc] initWithFrame:CGRectMake(50, 120, 300, 200)];
    textView.limitLength = 10;
    textView.placeholder = @"请输入~";
    textView.layer.borderWidth = 1;
    textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.view addSubview:textView];
    self.textView = textView;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
