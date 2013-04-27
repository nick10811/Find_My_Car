//
//  HistoryEntity.m
//  Find_My_Car
//
//  Created by Nick on 13/4/5.
//  Copyright (c) 2013年 Nick. All rights reserved.
//

#import "HistoryEntity.h"

@interface HistoryEntity ()

@end

@implementation HistoryEntity
@synthesize parentHistory;
@synthesize historyDate;
@synthesize historyLatitude;
@synthesize historyLongitude;
@synthesize historyNote;
@synthesize historyRow;

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
    NSDateFormatter * dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
    dateEntity.text = [dateFormat stringFromDate:historyDate];
    latitudeEntity.text = historyLatitude.stringValue;
    longitudeEntity.text = historyLongitude.stringValue;
    noteEntity.text = historyNote;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [dateEntity release];
    [latitudeEntity release];
    [longitudeEntity release];
    [noteEntity release];
    [super dealloc];
}
@end
