//
//  VAXLocationViewController.h
//  Hussle
//
//  Created by Adam Brailove on 7/26/14.
//  Copyright (c) 2014 Vaxis Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface VAXLocationViewController : UIViewController <CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;

@end
