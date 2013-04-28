//
//  AddInstance.h
//  Find_My_Car
//
//  Created by Nick on 13/4/2.
//  Copyright (c) 2013年 Nick. All rights reserved.
//
#import <UIKit/UIKit.h>

@class AppDelegate;
@interface AddInstance : UIViewController <UITextFieldDelegate>{
    IBOutlet UILabel *addDate;
    IBOutlet UILabel *addLatitude;
    IBOutlet UILabel *addLongitude;
    IBOutlet UITextField *addNote;

}
-(IBAction)doAdd:(id)sender;
@property (nonatomic, retain) NSNumber* latitude;
@property (nonatomic, retain) NSNumber* longitude;
@end
