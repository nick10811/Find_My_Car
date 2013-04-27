//
//  LastEvent.m
//  Find_My_Car
//
//  Created by Nick on 13/3/31.
//  Copyright (c) 2013年 Nick. All rights reserved.
//

#import "LastEvent.h"

@interface LastEvent ()

@end

@implementation LastEvent
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    }
-(void)loadData{
       
      
    [self.view reloadInputViews];
    
}
-(IBAction)doMod:(id)sender{
    
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
