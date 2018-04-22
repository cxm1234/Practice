//
//  ViewController.m
//  15-拦截用户输入
//
//  Created by zkinc on 2018/4/20.
//  Copyright © 2018年 zkinc. All rights reserved.
//

#import "ViewController.h"
#import "FlagTextF.h"
#import "UITextField+test.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *countryTextF;
@property (weak, nonatomic) IBOutlet UITextField *birthDayTextF;
@property (weak, nonatomic) IBOutlet UITextField *cityTextF;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.countryTextF.delegate = self;
    self.birthDayTextF.delegate = self;
    self.cityTextF.delegate = self;
}

//是否允许开始编辑
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}


-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [textField initWithText];
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return NO;
}

@end
