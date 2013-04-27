//
//  HistoryData.m
//  Find_My_Car
//
//  Created by Steve Chiang on 13/4/27.
//  Copyright (c) 2013年 Nick. All rights reserved.
//

#import "HistoryData.h"

@implementation HistoryData
@synthesize date;
@synthesize rowId;
-(void)dealloc {
    [date release];
    rowId = -1;
    [super dealloc];
}
@end
