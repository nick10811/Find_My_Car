//
//  Car.h
//  Find_My_Car
//
//  Created by Nick on 13/4/1.
//  Copyright (c) 2013年 Nick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Car : NSManagedObject

@property (nonatomic, retain) NSString * pic;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSNumber * locate_latitude;
@property (nonatomic, retain) NSNumber * locate_longitude;
@property (nonatomic, retain) NSString * note;

@end
