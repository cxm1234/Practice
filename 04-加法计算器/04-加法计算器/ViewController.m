//
//  ViewController.m
//  04-加法计算器
//
//  Created by xiaoming on 2018/3/26.
//  Copyright © 2018年 xiaoming. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *num1TextField;
@property (weak, nonatomic) IBOutlet UITextField *num2TextField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)sum:(id)sender {
    NSString *num1String = self.num1TextField.text;
    
    NSString *num2String = self.num2TextField.text;
    
    if (num1String.length == 0) {
        [self showInfo:@"请输入第一个数"];
    }
    
    if(num2String.length == 0){
        [self showInfo:@"请输入第二个数"];
    }
    
    NSInteger num1 = [num1String integerValue];
    
    NSInteger num2 = [num2String integerValue];
    
    self.resultLabel.text = [NSString stringWithFormat:@"%ld",num1+num2];
    
    
}

- (void)showInfo:(NSString *)info
{
   UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"输入有误" message:info delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
    [alertView show];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
