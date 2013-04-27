//
//  AddInstance.m
//  Find_My_Car
//
//  Created by Nick on 13/4/2.
//  Copyright (c) 2013年 Nick. All rights reserved.
//

#import "AddInstance.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"

@interface AddInstance ()

@end

@implementation AddInstance
@synthesize latitude;
@synthesize longitude;

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    //按下return 虛擬鍵盤消失
    [textField resignFirstResponder];
    return YES;
}
-(IBAction)doAdd:(id)sender{
    FMDatabase *db = [self dbPreOpen];
    [db executeUpdate:@"INSERT INTO History (date, locate_latitude, locate_longitude, note) VALUES (?, ?, ?, ?)", addDate.text, latitude, longitude, addNote.text];
    
    [db close];
    
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    NSDate *date = [NSDate date];
    NSDateFormatter * dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
    addDate.text = [dateFormat stringFromDate:date];
    
    addLatitude.text = latitude.stringValue;
    addLongitude.text = longitude.stringValue;
    
    NSLog(@"test2: %@, %@", latitude.stringValue, longitude.stringValue);
    
    FMDatabase *db = [self dbPreOpen];
    [db executeUpdate:@"CREATE TABLE IF NOT EXISTS History (id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT, locate_latitude REAL, locate_longitude REAL, note TEXT, pic TEXT)"];
    [db close];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [latitude dealloc];
    [longitude dealloc];
    [super dealloc];
}
@end
