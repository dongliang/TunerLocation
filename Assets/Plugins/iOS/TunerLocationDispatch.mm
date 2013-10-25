//
//  TunerLocation.m
//  TunerLocation
//
//  Created by dongliang on 13-10-17.
//  Copyright (c) 2013年 dongliang. All rights reserved.
//

#import "TunerLocationDispatch.h"

@implementation TunerLocationDispatch


- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    
    float longitude = loc.longitude;
    float latitude = loc.latitude;
    NSString* lo = [NSStringstringWithFormat:@"%f",longitude];
      NSString* la = [NSStringstringWithFormat:@"%f",latitude];
    NSString* str = [NSStringstringWithFormat:@"%@_%@",longitude,latitude];
    UnitySendMessage("Main Camera","EventLog",str);
}

- (id) init
{
    self = [super init];
    if (self) {
        _locationManager = [[CLLocationManager alloc] init];
        
        // set app-specific locationManager properties
        _locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;

        _locationManager.delegate = self;
        
        _locationManager.purpose = NSLocalizedStringWithDefaultValue(@"位置测试程序", nil, [NSBundle mainBundle], @"访问你的地理位置以便搜寻周围玩家。", @"LocationManager purpose");

    }
    
    return self;
}

- (void) start
{
    [_locationManager startUpdatingLocation];
}
- (void) stop
{
    [_locationManager stopUpdatingLocation];
}


@end

static TunerLocationDispatch* delegateObject = nil;

extern "C" {

    void _Start()
    {
        if (delegateObject == nil)
			delegateObject = [[TunerLocationDispatch alloc] init];
        [delegateObject start];
    }
    void _Stop()
    {
        if (delegateObject != nil)
            [delegateObject stop];
    }

}
