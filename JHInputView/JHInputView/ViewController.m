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

@interface ViewController ()<UITextViewDelegate>

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
    
//    JHTextView *textView = [[JHTextView alloc] initWithFrame:CGRectMake(50, 120, 300, 200)];
//    textView.limitLength = 10;
//    textView.placeholder = @"请输入~";
//    textView.layer.borderWidth = 1;
//    textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    [self.view addSubview:textView];
//    self.textView = textView;
    
    UITextView *tv = [[UITextView alloc] initWithFrame:CGRectMake(50, 120, 300, 200)];
    tv.backgroundColor = [UIColor brownColor];
    tv.delegate = self;
    [self.view addSubview:tv];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextViewDelegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@""]) {
        return YES;
    }
    if (textView.text.length > 5) {
        return NO;
    }
    return YES;
}



@end
