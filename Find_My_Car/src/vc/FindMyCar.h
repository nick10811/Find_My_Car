//
//  FindMyCar.h
//  Find_My_Car
//
//  Created by Nick on 13/4/28.
//  Copyright (c) 2013年 Nick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface FindMyCar : UIViewController<MKMapViewDelegate>{
    IBOutlet MKMapView *find_map;
    IBOutlet UILabel* loading;
}

@end
