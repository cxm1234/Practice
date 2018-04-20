//
//  ViewController.m
//  13-数据刷新
//
//  Created by zkinc on 2018/4/17.
//  Copyright © 2018年 zkinc. All rights reserved.
//

#import "ViewController.h"
#import "ESWineCell.h"
#import "ESWine.h"
#import <MJExtension/MJExtension.h>

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *wineArray;
@property(nonatomic, strong) NSMutableArray *selectedIndexPath;

@end

@implementation ViewController

-(NSMutableArray *)selectedIndexPath
{
    if(!_selectedIndexPath){
        _selectedIndexPath = [NSMutableArray array];
    }
    return _selectedIndexPath;
}

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
    
    NSLog(@"remove ************");
    NSMutableArray *deletedWine = [NSMutableArray array];
    for (NSIndexPath *indexPath in self.selectedIndexPath) {
        [deletedWine addObject:self.wineArray[indexPath.row]];
    }
    
    [self.wineArray removeObjectsInArray:deletedWine];
    
    [self.tableView deleteRowsAtIndexPaths:self.selectedIndexPath withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self.selectedIndexPath removeAllObjects];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.wineArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"wine";
    ESWineCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil){
        cell = [[ESWineCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.wine = self.wineArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ESWine *wine = self.wineArray[indexPath.row];
    if (wine.isChecked){
        wine.checked = NO;
        [self.selectedIndexPath removeObject:indexPath];
    }else {
        wine.checked = YES;
        [self.selectedIndexPath addObject:indexPath];
    }
    
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
