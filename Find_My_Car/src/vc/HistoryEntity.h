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
}
@property (nonatomic, weak)History* parentHistory;
@property int historyID;
@end
