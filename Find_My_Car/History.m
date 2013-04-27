//
//  History.m
//  Find_My_Car
//
//  Created by Nick on 13/4/4.
//  Copyright (c) 2013年 Nick. All rights reserved.
//

#import "History.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "HistoryEntity.h"

@interface History ()

@end

@implementation History
-(FMDatabase*)dbPreOpen {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *dbPath = [documentDirectory stringByAppendingPathComponent:@"MyDatabase.db"];
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    if (![db open]) {
        NSLog(@"[ERROR][DB] db open failure");
        db = nil;
    }
    
    return db;
}

-(void)loadData{
    // 如果有資料先清空
    [history_row removeAllObjects];
    
    FMDatabase *db = [self dbPreOpen];
    FMResultSet *rs = [db executeQuery:@"SELECT id, date FROM History ORDER BY id DESC"];
    while ([rs next]) {
        /*
         History h = [History alloc] initWithDate: [rs stringForColumn:@"date"]
                                            andId: [rs intForColumn:@"id"]
                                                ];
         [history_row addObject:h];

         */
        [history_row addObject:[rs stringForColumn:@"date"]];
    }
    
    [db close];
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
    if (!cell) {
        cell = [[UITableViewCell alloc] init];
    }
    [[cell textLabel] setText:[history_row objectAtIndex:[indexPath row]]];
    
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
//    Car* entity = [[history_row objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
//    HistoryEntity *historyEntityController = [self.storyboard instantiateViewControllerWithIdentifier:@"HistoryEntity"];
//    //將自己傳入
//    historyEntityController.parentHistory = self;
//    
//    //設定目前資料的值
//    historyEntityController.historyDate = entity.date;
//    historyEntityController.historyLatitude = entity.locate_latitude;
//    historyEntityController.historyLongitude = entity.locate_longitude;
//    historyEntityController.historyNote = entity.note;
//    historyEntityController.historyRow = indexPath.row;
//    
//    [self.navigationController pushViewController:historyEntityController animated:YES];
}

@end
