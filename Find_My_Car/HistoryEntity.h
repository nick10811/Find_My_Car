//
//  HistoryEntity.h
//  Find_My_Car
//
//  Created by Nick on 13/4/5.
//  Copyright (c) 2013年 Nick. All rights reserved.
//

#import <UIKit/UIKit.h>

@class History;
@interface HistoryEntity : UIViewController{
    
    History* parentHistory;
    
    IBOutlet UILabel *dateEntity;
    IBOutlet UILabel *latitudeEntity;
    IBOutlet UILabel *longitudeEntity;
    IBOutlet UILabel *noteEntity;
    
    //目前資料
    NSDate* historyDate;
    NSNumber* historyLatitude;
    NSNumber* historyLongitude;
    NSString* historyNote;
    int historRow; //selected row of TableView
    
}
@property (nonatomic, weak)History* parentHistory;
@property (nonatomic, retain) NSDate* historyDate;
@property (nonatomic, retain) NSNumber* historyLatitude;
@property (nonatomic, retain) NSNumber* historyLongitude;
@property (nonatomic, retain) NSString* historyNote;
@property int historyRow;
@end
