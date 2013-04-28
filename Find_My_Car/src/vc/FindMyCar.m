//
//  FindMyCar.m
//  Find_My_Car
//
//  Created by Nick on 13/4/28.
//  Copyright (c) 2013年 Nick. All rights reserved.
//

#import "FindMyCar.h"
#import "Annotation.h"
#import "DBHelper.h"

@interface FindMyCar ()

@end

@implementation FindMyCar

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [find_map setShowsUserLocation:YES];
    
    DBHelper *db = [[DBHelper alloc]init];
    NSMutableDictionary *car = [db getLastEvent];
    NSLog(@"FindMyCar car location: %f, %f", [[car objectForKey:@"latitude"]doubleValue], [[car objectForKey:@"longitude"]doubleValue]);
    CLLocationCoordinate2D carLocation = CLLocationCoordinate2DMake([[car objectForKey:@"latitude"]doubleValue], [[car objectForKey:@"longitude"]doubleValue]);
    Annotation *carAnnotation = [[Annotation alloc] initWithCoordinate:carLocation Title:@"Car"];
    [find_map addAnnotation:carAnnotation];
    [carAnnotation release];
    
    [self locateMap];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc{
    [find_map release];
    [loading release];
    [super dealloc];
}
- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView {
    // 讓載入中消失
    loading.alpha = 0;
}
- (void)mapViewWillStartLoadingMap:(MKMapView *)mapView {
    // 讓載入中顯現
    loading.alpha = 1;
}
-(void)locateMap{
    // 將經緯度轉回地圖的點
    MKMapPoint mapPoint = MKMapPointForCoordinate(userLocationNow);
    // 將原始的地圖畫面的矩形紀錄下來
    m_originalRect = MKMapRectMake(mapPoint.x , mapPoint.y, 1000,1000);
    // 繪製地圖
    [find_map setVisibleMapRect:m_originalRect animated:YES];
    // 設定地圖的代理物件
    find_map.delegate = self;
    // 載入中先不要顯現
    loading.alpha = 0;
    
}
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    // 取得使用者目前的位置
    userLocationNow = userLocation.coordinate;
    // 繪製經緯度差各0.005的區域
    MKCoordinateSpan defaultSpan = MKCoordinateSpanMake(0.005, 0.005);
    // 以動畫方式移動至該區域
    [find_map setRegion:MKCoordinateRegionMake(userLocationNow, defaultSpan) animated:YES];
}
@end
