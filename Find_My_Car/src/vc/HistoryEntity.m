//
//  HistoryEntity.m
//  Find_My_Car
//
//  Created by Nick on 13/4/5.
//  Copyright (c) 2013年 Nick. All rights reserved.
//

#import "HistoryEntity.h"
#import "DBHelper.h"

@interface HistoryEntity ()

@end

@implementation HistoryEntity
@synthesize parentHistory;
@synthesize historyID;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    /*
     1.select detail
     2. show on the view
     */
    
    DBHelper *dh = [[DBHelper alloc]init];
    NSDictionary *historyData = [dh getHistoryID:historyID];
    dateEntity.text = [historyData objectForKey:@"date"];
    latitudeEntity.text = [[historyData objectForKey:@"latitude"] stringValue];
    longitudeEntity.text = [[historyData objectForKey:@"longitude"] stringValue];
    noteEntity.text = [historyData objectForKey:@"note"];
    
    [dh release];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [parentHistory release];
    [dateEntity release];
    [latitudeEntity release];
    [longitudeEntity release];
    [noteEntity release];
    [super dealloc];
}
@end
