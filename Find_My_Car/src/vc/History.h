//
//  History.h
//  Find_My_Car
//
//  Created by Nick on 13/4/4.
//  Copyright (c) 2013年 Nick. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AppDelegate;
@interface History : UITableViewController{
    NSMutableArray* history_row;
}
-(void)loadData;
@end
