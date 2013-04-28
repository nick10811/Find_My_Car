//
//  Location.m
//  Find_My_Car
//
//  Created by Nick on 13/4/1.
//  Copyright (c) 2013年 Nick. All rights reserved.
//

#import "Location.h"
#import "AddInstance.h"

@interface Location ()

@end

@implementation Location

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView {
    // 讓載入中消失
    load.alpha = 0;
}
- (void)mapViewWillStartLoadingMap:(MKMapView *)mapView {
    // 讓載入中顯現
    load.alpha = 1;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [m_mapView setShowsUserLocation:YES];
    [self locateMap];
	// Do any additional setup after loading the view.
}
-(void)locateMap{
    // 初始化一個地理中心
    current = CLLocationCoordinate2DMake(25.052198,121.544076);
    // 將經緯度轉回地圖的點
    MKMapPoint mapPoint = MKMapPointForCoordinate(current);
    // 將原始的地圖畫面的矩形紀錄下來
    m_originalRect = MKMapRectMake(mapPoint.x , mapPoint.y, 1000,1000);
    // 繪製地圖
    [m_mapView setVisibleMapRect:m_originalRect];
    // 設定地圖的代理物件
    m_mapView.delegate = self;
    // 載入中先不要顯現
    load.alpha = 0;


}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    // 取得使用者目前的位置
    current = userLocation.coordinate;
    // 繪製經緯度差各0.005的區域
    MKCoordinateSpan defaultSpan = MKCoordinateSpanMake(0.005, 0.005);
    // 以動畫方式移動至該區域
    [m_mapView setRegion:MKCoordinateRegionMake(current, defaultSpan) animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc {
    [m_mapView release];
    [load release];
    [super dealloc];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"add"]){
        //取得目的的View Controller
        AddInstance *curr_locate = (AddInstance *)[segue destinationViewController];
        curr_locate.latitude =[NSDecimalNumber numberWithDouble:current.latitude];
        curr_locate.longitude = [NSDecimalNumber numberWithDouble:current.longitude];
        NSLog(@"pass parameter to next seque: %@, %@", curr_locate.latitude.stringValue, curr_locate.longitude.stringValue);
    }
}
@end
