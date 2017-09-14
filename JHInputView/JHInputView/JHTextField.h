//
//  JHTextField.h
//  JHTextField
//
//  Created by 黄俊煌 on 2017/8/2.
//  Copyright © 2017年 yunshi. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 欲用此控件就不能设置代理，用block代替
 */
@interface JHTextField : UITextField

/** 限制长度*/
@property (nonatomic, assign) NSInteger limitLength;

#pragma mark - UITextFieldDelegate block

@property (nonatomic, copy) BOOL (^textFieldShouldBeginEditingBlock)(UITextField *textField);
@property (nonatomic, copy) void (^textFieldDidBeginEditingBlock)(UITextField *textField);
@property (nonatomic, copy) BOOL (^textFieldShouldEndEditingBlock)(UITextField *textField);
@property (nonatomic, copy) void (^textFieldDidEndEditingBlock)(UITextField *textField);
@property (nonatomic, copy) BOOL (^textFieldShouldReturnBlock)(UITextField *textField);
@property (nonatomic, copy) BOOL (^textFieldShouldChangeCharactersInRangeReplacementStringBlock)(UITextField *textField, NSRange range, NSString *string);

@end
