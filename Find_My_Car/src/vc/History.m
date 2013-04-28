//
//  History.m
//  Find_My_Car
//
//  Created by Nick on 13/4/4.
//  Copyright (c) 2013年 Nick. All rights reserved.
//

#import "History.h"
#import "HistoryEntity.h"
#import "DBHelper.h"
#import "HistoryData.h"
@interface History ()

@end

@implementation History

-(void)loadData{
    // 如果有資料先清空
    [history_row removeAllObjects];
    DBHelper *dh = [[DBHelper alloc] init];
    [history_row addObjectsFromArray:[dh getHistoryDate]];
    [dh release];
    
    NSLog(@"%@", history_row);
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    NSLog(@"viewDidLoad");
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [self editButtonItem];
    history_row = [[NSMutableArray alloc] init];
    
    [self loadData];

    // 將表格的資料重新載入
    [self.tableView reloadData];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [history_row count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"HistoryCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    HistoryData *data = [history_row objectAtIndex:indexPath.row];
    [[cell textLabel] setText:data.date];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DBHelper *dh = [[DBHelper alloc] init];
    HistoryData *data = [history_row objectAtIndex:indexPath.row];
    [dh deleteHistoryById:data.rowId];
    [dh release];

    [self loadData];
    [tableView reloadData];
    
    /*
      1. delete record by rowId
      2. reflash History array
      3. tableView reloadData
     */
    
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"/History/ section:%d, row:%d ", indexPath.section, indexPath.row);
    
    /*
     1. new data obj
     2. historyentity
     3. push
     */
    HistoryData *data = [history_row objectAtIndex:indexPath.row];
    HistoryEntity * parentController = [self.storyboard instantiateViewControllerWithIdentifier:@"HistoryEntity"];
    parentController.historyID = data.rowId;
    [self.navigationController pushViewController:parentController animated:YES];
    
}

@end
