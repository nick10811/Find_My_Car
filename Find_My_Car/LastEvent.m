//
//  LastEvent.m
//  Find_My_Car
//
//  Created by Nick on 13/3/31.
//  Copyright (c) 2013年 Nick. All rights reserved.
//

#import "LastEvent.h"
#import "AppDelegate.h"
#import "Car.h"

@interface LastEvent ()

@end

@implementation LastEvent
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadData];
}
-(void)loadData{
    for (NSMutableArray* currentSection in m_car) {
        [currentSection removeAllObjects];
    }
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Car" inManagedObjectContext:[delegate managedObjectContext]];
    [request setEntity:entity];
    NSError* error = nil;
    NSMutableArray* returnObjs = [[[delegate managedObjectContext] executeFetchRequest:request error:&error] mutableCopy];
    [request release];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *sort = [dateFormatter dateFromString:@"1990-01-01 00:00:00"];
    
    for(Car* currentCar in returnObjs){
        if(currentCar.date > sort){
            modDate = currentCar.date;
            modLatitude = currentCar.locate_latitude;
            modLongitude = currentCar.locate_longitude;
            modNote = currentCar.note;
            
            [m_car insertObject:currentCar atIndex:0];
        }
    }
    
    [returnObjs release];
    index = [m_car count]-1;
    
    lastDate.text = [dateFormatter stringFromDate:modDate];
    last_latitude.text = modLatitude.stringValue;
    last_logitude.text = modLongitude.stringValue;
    last_note.text = modNote;

    
    [self.view reloadInputViews];
    
}
-(IBAction)doMod:(id)sender{
    Car* alteredCar = [m_car objectAtIndex:index];
    alteredCar.note = last_note.text;
    
    NSError *error = nil;
    if(![[delegate managedObjectContext] save:&error]){
        NSLog(@"物件更新失敗");
    }
    [m_car replaceObjectAtIndex:index withObject:alteredCar];
    
    [self.view reloadInputViews];
    [self.navigationController popViewControllerAnimated:YES];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    //按下return 虛擬鍵盤消失
    [textField resignFirstResponder];
    return YES;
}
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
    
    m_car = [[NSMutableArray alloc] init];
    
    delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [lastDate release];
    [last_latitude release];
    [last_logitude release];
    [last_note release];
    [super dealloc];
}
@end
