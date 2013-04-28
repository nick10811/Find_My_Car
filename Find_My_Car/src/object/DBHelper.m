//
//  DBHelper.m
//  Find_My_Car
//
//  Created by Steve Chiang on 13/4/27.
//  Copyright (c) 2013年 Nick. All rights reserved.
//

#import "DBHelper.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "HistoryData.h"
@interface DBHelper() {
    
}
-(FMDatabase*)dbPreOpen;
-(void)createDBTable;
@end
@implementation DBHelper

#pragma mark - public
-(id)init {
    self = [super init];
    if (self) {
        [self createDBTable];
    }
    return self;
}

-(void)insertHistoryWithDate:(NSString*)date andNote:(NSString*)note forLat:(NSNumber*)lat andLng:(NSNumber*)lng {
    FMDatabase *db = [self dbPreOpen];
    [db executeUpdate:@"INSERT INTO History (date, locate_latitude, locate_longitude, note) VALUES (?, ?, ?, ?)", date, lat, lng, note];
    [db close];
}

-(void)deleteHistoryById:(NSInteger)rowId {
    FMDatabase *db = [self dbPreOpen];
    [db executeUpdate:@"DELETE FROM History WHERE id = ?", [NSNumber numberWithInt:rowId]];
    [db close];
}

-(NSMutableArray*)getHistoryDate {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    FMDatabase *db = [self dbPreOpen];
    FMResultSet *rs = [db executeQuery:@"SELECT id, date FROM History ORDER BY date DESC"];
    
    while ([rs next]) {
        HistoryData *data = [[HistoryData alloc] init];
        data.rowId = [rs intForColumn:@"id"];
        data.date = [rs stringForColumn:@"date"];
        [result addObject:data];
        [data release];
    }
    
    [db close];

    if ([result count] == 0) {
        [result release];
        result = nil;
    } else {
        [result autorelease];
    }
    
    return result;
}
-(NSMutableDictionary*)getHistoryID:(int)historyID{
    FMDatabase *db = [self dbPreOpen];
    FMResultSet *rs = [db executeQuery:@"SELECT * FROM History WHERE id=?", [NSNumber numberWithInt:historyID]];
    NSMutableDictionary *detail = [[NSMutableDictionary alloc]init];
    while ([rs next]) {
        [detail setObject:[rs stringForColumn:@"date"] forKey:@"date"];
        [detail setObject:[NSNumber numberWithDouble:[rs doubleForColumn:@"locate_latitude"]] forKey:@"latitude"];
        [detail setObject:[NSNumber numberWithDouble:[rs doubleForColumn:@"locate_longitude"]] forKey:@"longitude"];
        [detail setObject:[rs stringForColumn:@"note"] forKey:@"note"];
    }
    [db close];
    
    if ([detail count] == 0) {
        [detail release];
        detail = nil;
    }
    else{
        [detail autorelease];
    }
    
    return detail;
}
-(NSMutableDictionary*)getLastEvent{
    NSMutableDictionary *lastEvent = [[NSMutableDictionary alloc] init];
    
    FMDatabase *db = [self dbPreOpen];
    FMResultSet *rs = [db executeQuery:@"SELECT * FROM History WHERE date = (SELECT MAX(date) FROM History)"];
    while ([rs next]) {
        [lastEvent setObject:[NSNumber numberWithInt:[rs intForColumn:@"id"]] forKey:@"id"];
        [lastEvent setObject:[rs stringForColumn:@"date"] forKey:@"date"];
        [lastEvent setObject:[NSNumber numberWithDouble:[rs doubleForColumn:@"locate_latitude"]] forKey:@"latitude"];
        [lastEvent setObject:[NSNumber numberWithDouble:[rs doubleForColumn:@"locate_longitude"]] forKey:@"longitude"];
        [lastEvent setObject:[rs stringForColumn:@"note"] forKey:@"note"];
    }
    NSLog(@"[DB] getLastEventID = %@",[lastEvent objectForKey:@"id"]);
    
    if([lastEvent count] == 0){
        [lastEvent release];
        lastEvent = nil;
    }
    else{
        [lastEvent autorelease];
    }
    return lastEvent;
}
-(void)updateLastEventWithID:(int)getLastEventID andNote:(NSString*)lastEventNote{
    FMDatabase *db = [self dbPreOpen];
    [db executeUpdate:@"UPDATE History SET note=? WHERE id=?",lastEventNote, [NSNumber numberWithInt:getLastEventID]];
}

#pragma mark - private
-(FMDatabase*)dbPreOpen {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *dbPath = [documentDirectory stringByAppendingPathComponent:@"MyDatabase.db"];
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    if (![db open]) {
        NSLog(@"[ERROR][DB] db open failure");
        db = nil;
    }
    
    return db;
}

-(void)createDBTable {
    FMDatabase *db = [self dbPreOpen];
    [db executeUpdate:@"CREATE TABLE IF NOT EXISTS History (id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT, locate_latitude REAL, locate_longitude REAL, note TEXT, pic TEXT)"];
    [db close];
}
@end
