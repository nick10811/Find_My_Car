//
//  AddInstance.m
//  Find_My_Car
//
//  Created by Nick on 13/4/2.
//  Copyright (c) 2013年 Nick. All rights reserved.
//

#import "AddInstance.h"
#import "DBHelper.h"

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
    DBHelper *dh = [[DBHelper alloc] init];
    [dh insertHistoryWithDate:addDate.text andNote:addNote.text forLat:latitude andLng:longitude];
    [self.navigationController popToRootViewControllerAnimated:YES];
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
