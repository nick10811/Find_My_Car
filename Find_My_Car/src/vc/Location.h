//
//  Location.h
//  Find_My_Car
//
//  Created by Nick on 13/4/1.
//  Copyright (c) 2013年 Nick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "AddInstance.h"

@interface Location : UIViewController <MKMapViewDelegate>{
    IBOutlet MKMapView *m_mapView;
    IBOutlet UILabel *load;
    MKMapRect m_originalRect;
    CLLocationCoordinate2D current;
}
-(void)locateMap;

@end
