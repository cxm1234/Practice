//
//  ViewController.m
//  12-自定义不等高Cell
//
//  Created by zkinc on 2018/4/13.
//  Copyright © 2018年 zkinc. All rights reserved.
//

#import "ViewController.h"
#import <MJExtension/MJExtension.h>
#import "ESStatus.h"
#import "ESStatusCell.h"

@interface ViewController ()

@property(nonatomic,strong) NSArray *statuses;

@end

@implementation ViewController

-(NSArray *)statuses
{
    if(!_statuses){
        _statuses = [ESStatus mj_objectArrayWithFilename:@"statuses.plist"];
    }
    return _statuses;
}

NSString *ID = @"status";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[ESStatusCell class] forCellReuseIdentifier:ID];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statuses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ESStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.status = self.statuses[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ESStatus *status = self.statuses[indexPath.row];
    return status.cellHeight;
}


@end
