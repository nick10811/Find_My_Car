//
//  MainTableViewController.m
//  Find_My_Car
//
//  Created by Nick on 13/3/30.
//  Copyright (c) 2013年 Nick. All rights reserved.
//

#import "MainTableViewController.h"
#import "Location.h"
#import "AddInstance.h"
#import "LastEvent.h"
#import "FindMyCar.h"
#import "History.h"

@interface MainTableViewController ()

@end

@implementation MainTableViewController

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
    [super viewDidLoad];
    self.navigationItem.title = @"Find My Car";
    
    //menu
    NSString *item0 = @"Parking";
    NSString *item1 = @"LastEvent";
//    NSString *item1 = @"Note and Photo";
    NSString *item2 = @"Find My Car";
//    NSString *item3 = @"Timer";
    NSString *item4 = @"History";
//    NSString *item5 = @"Setting";
    
    //create a block to store data of menu
    NSMutableArray *block = [[NSMutableArray alloc] initWithObjects:item0, item1, item2, item4, nil];
    //move block to table
    menu = [[NSMutableArray alloc] initWithObjects:block, nil];
    
    [block release];
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
    return [menu count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[menu objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    // set text for each row of table
    cell.textLabel.text = [[menu objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"/MainTable/ touch on %d section and %d row", indexPath.section, indexPath.row);

    if(indexPath.section == 0){
        if(indexPath.row == 0){
            Location *locate = [self.storyboard instantiateViewControllerWithIdentifier:@"Locate"];
            [self.navigationController pushViewController:locate animated:YES];
        }
        else if(indexPath.row == 1){
            LastEvent* last = [self.storyboard instantiateViewControllerWithIdentifier:@"LastEvent"];
            [self.navigationController pushViewController:last animated:YES];
        }
        else if (indexPath.row == 2){
            FindMyCar *find = [self.storyboard instantiateViewControllerWithIdentifier:@"FindMyCar"];
            [self.navigationController pushViewController:find animated:YES];
        }
        else if(indexPath.row == 3){
            History * his = [self.storyboard instantiateViewControllerWithIdentifier:@"History"];
            [self.navigationController pushViewController:his animated:YES];
            
        }
    }
}

@end
