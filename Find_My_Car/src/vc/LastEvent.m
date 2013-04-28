//
//  LastEvent.m
//  Find_My_Car
//
//  Created by Nick on 13/3/31.
//  Copyright (c) 2013年 Nick. All rights reserved.
//

#import "LastEvent.h"
#import "DBHelper.h"

@interface LastEvent ()

@end

@implementation LastEvent
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    }
-(IBAction)doMod:(id)sender{
    
    DBHelper *db = [[DBHelper alloc]init];
    [db updateLastEventWithID:last_id andNote:last_note.text];
    
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
    DBHelper * db = [[DBHelper alloc]init];
    NSMutableDictionary *entity = [db getLastEvent];
    last_id = [[entity objectForKey:@"id"]intValue];
    lastDate.text = [entity objectForKey:@"date" ];
    last_latitude.text = [[entity objectForKey:@"latitude"] stringValue];
    last_logitude.text = [[entity objectForKey:@"longitude"] stringValue];
    last_note.text = [entity objectForKey:@"note"] ;
    
    [db release];
    
    NSLog(@"LastEventID %d", last_id);
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
