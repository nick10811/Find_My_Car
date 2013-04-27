//
//  DBHelper.h
//  Find_My_Car
//
//  Created by Steve Chiang on 13/4/27.
//  Copyright (c) 2013年 Nick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBHelper : NSObject
-(void)insertHistoryWithDate:(NSString*)date andNote:(NSString*)note forLat:(NSNumber*)lat andLng:(NSNumber*)lng;
-(NSMutableArray*)getHistoryDate;
-(void)deleteHistoryById:(NSInteger)rowId;
-(NSMutableDictionary*)getID:(int)historyID;
@end
