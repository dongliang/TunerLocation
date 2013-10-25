//
//  TunerLocation.h
//  TunerLocation
//
//  Created by dongliang on 13-10-17.
//  Copyright (c) 2013年 dongliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
@interface TunerLocationDispatch :  NSObject <CLLocationManagerDelegate>
{
    CLLocationManager *_locationManager;
        CLLocation *_Location;
}
@property (nonatomic, strong, readonly) CLLocation *Location;

- (void) start;
- (void) stop;
@end
