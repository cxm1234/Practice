//
//  ViewController.m
//  13-数据刷新
//
//  Created by zkinc on 2018/4/17.
//  Copyright © 2018年 zkinc. All rights reserved.
//

#import "ViewController.h"
#import "ESWine.h"
#import <MJExtension/MJExtension.h>

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *wineArray;
@property(nonatomic, strong) NSMutableArray *selectedIndexPath;

@end

@implementation ViewController

-(NSMutableArray *)wineArray
{
    if(!_wineArray){
        _wineArray = [ESWine mj_objectArrayWithFilename:@"wine.plist"];
    }
    return _wineArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)remove {
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.wineArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
