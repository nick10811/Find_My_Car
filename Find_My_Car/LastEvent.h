//
//  LastEvent.h
//  Find_My_Car
//
//  Created by Nick on 13/3/31.
//  Copyright (c) 2013年 Nick. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainTableViewController;
@class AppDelegate;
@interface LastEvent : UIViewController <UITextFieldDelegate>{
    
    NSMutableArray* m_car;
    AppDelegate * delegate;
    int index;
    IBOutlet UILabel *lastDate;
    IBOutlet UILabel *last_latitude;
    IBOutlet UILabel *last_logitude;
    IBOutlet UITextField *last_note;
    
    NSDate* modDate;
    NSNumber* modLatitude;
    NSNumber* modLongitude;
    NSString* modNote;
}

-(void)loadData;
-(IBAction)doMod:(id)sender;
@end
