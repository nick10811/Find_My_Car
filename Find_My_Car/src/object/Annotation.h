//
//  Annotation.h
//  Find_My_Car
//
//  Created by Nick on 13/4/28.
//  Copyright (c) 2013年 Nick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Annotation : NSObject <MKAnnotation>{
    CLLocationCoordinate2D coordinate;
    NSString* title;
}
-(id)initWithCoordinate:(CLLocationCoordinate2D)pCoordinate Title:(NSString*)pTitle;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly, copy)NSString *title;
@end
