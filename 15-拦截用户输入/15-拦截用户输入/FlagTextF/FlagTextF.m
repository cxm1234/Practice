//
//  FlagTextF.m
//  15-拦截用户输入
//
//  Created by zkinc on 2018/4/20.
//  Copyright © 2018年 zkinc. All rights reserved.
//

#import "FlagTextF.h"
#import "FlagItem.h"
#import "FlagView.h"

@interface FlagTextF()<UIPickerViewDelegate,UIPickerViewDataSource>

@property(nonatomic, strong) NSArray *dataArray;
@property(nonatomic, weak) UIPickerView *pick;

@end
@implementation FlagTextF

-(NSArray *)dataArray
{
    if(_dataArray == nil){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"flags.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            FlagItem *item = [FlagItem itemWithDict:dict];
            [tempArray addObject:item];
        }
        _dataArray = tempArray;
    }
    return _dataArray;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
        [self setUp];
    }
    return self;
}

-(void)awakeFromNib
{
    [self setUp];
}

- (void)setUp{
    
    UIPickerView *pick = [[UIPickerView alloc] init];
    pick.delegate = self;
    pick.dataSource = self;
    self.inputView = pick;
    self.pick = pick;
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.dataArray.count;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    
    FlagView *flagView = [FlagView flagView];
    FlagItem *item = self.dataArray[row];
    flagView.item = item;
    return flagView;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 80;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    FlagItem *item = self.dataArray[row];
    self.text = item.name;
}

- (void)initWithText{
    [self pickerView:self.pick didSelectRow:0 inComponent:0];
}

@end
