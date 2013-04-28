//
//  Annotation.m
//  Find_My_Car
//
//  Created by Nick on 13/4/28.
//  Copyright (c) 2013年 Nick. All rights reserved.
//

#import "Annotation.h"

@implementation Annotation
@synthesize coordinate;
@synthesize title;

-(id)initWithCoordinate:(CLLocationCoordinate2D)pCoordinate Title:(NSString*)pTitle{
    self = [super init];
    if(self){
        coordinate = pCoordinate;
        title = pTitle;
    }
    return self;
}

@end
