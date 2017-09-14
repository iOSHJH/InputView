# InputView
最好用的输入框，没有之一
在开发中UITextField和UITextview这两个组件用的是非常频繁的，而且还要限制输入框的字数，UITextview要设置placeholder等，每个控件都要实现代理方法写相应的逻辑代码。是不是很麻烦？

很多新手是这样写的：
```
// 限制字数
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@""]) {
        return YES;
    }
    if (textView.text.length > 5) {
        return NO;
    }
    return YES;
}
```
这样写会有问题，当输入中文或粘贴字符到文本框时问题就出来了。


为此我重写了UITextField和UITextview，实现一句话设置限制字数和placeholder。代理用block代替，使用更加方便灵活。
限制字数相关实现，完美解决刚提到的问题（UITextField和UITextview的实现思路一样）：
```
if (self.limitLength > 0) { // 限制长度
        //获取高亮部分
        UITextRange *selectedRange = [textView markedTextRange];
        UITextPosition *position = [textView positionFromPosition:selectedRange.start offset:0];
        
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position)
        {
            if (toBeString.length > self.limitLength)
            {
                NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:self.limitLength];
                if (rangeIndex.length == 1)
                {
                    textView.text = [toBeString substringToIndex:self.limitLength];
                }
                else
                {
                    NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, self.limitLength)];
                    textView.text = [toBeString substringWithRange:rangeRange];
                }
            }
        }
    }
```
效果图：
![效果图](http://upload-images.jianshu.io/upload_images/3950574-96f4fc4e5debd3cf.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

使用：
```
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
```
有问题欢迎issues，若项目对你有用还望不吝给个star让我动力十足😀
