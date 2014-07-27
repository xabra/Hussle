//
//  VAXLocationViewController.m
//  Hussle
//
//  Created by Adam Brailove on 7/26/14.
//  Copyright (c) 2014 Vaxis Technologies. All rights reserved.
//

#import "VAXLocationViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface VAXLocationViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lattitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *altitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *courseLabel;
@property (weak, nonatomic) IBOutlet UILabel *speedLabel;

@end

@implementation VAXLocationViewController

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
    [self setupLocationManager];
}

- (void)setupLocationManager {
    // Create the location manager object
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    [self.locationManager startUpdatingLocation];
    if([CLLocationManager headingAvailable] == YES) {
        [self.locationManager startUpdatingHeading];
        NSLog(@"Started Heading Updates");
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    //Get a reference to the last (most recent) item in location array
    CLLocation* newLocation = (CLLocation*) locations.lastObject;
    // test that the horizontal accuracy does not indicate an invalid measurement
    if (newLocation.horizontalAccuracy < 0) return;
    // test the age of the location measurement to determine if the measurement is cached
    // in most cases you will not want to rely on cached measurements
    NSTimeInterval locationAge = -[newLocation.timestamp timeIntervalSinceNow];
    if (locationAge > 5.0) return;
    // update the display with the new location data
    
    NSString *latString = (newLocation.coordinate.latitude < 0) ? @"S": @"N";
    NSString *lonString = (newLocation.coordinate.longitude < 0) ? @"W":  @"E";
    
    self.lattitudeLabel.text = [NSString stringWithFormat:@"Lattitude: %3.4f deg %@", fabs(newLocation.coordinate.latitude), latString];
    self.longitudeLabel.text = [NSString stringWithFormat:@"Longitude: %3.4f deg %@", fabs(newLocation.coordinate.longitude), lonString];
    self.altitudeLabel.text = [NSString stringWithFormat:@"Altitude: %3.4f meters", fabs(newLocation.altitude)];
    //Heading: Using newLocation.course does NOT work.  returns -1.0 deg.  WHY?  Course may be derivative of position, vs compass
    self.courseLabel.text = [NSString stringWithFormat:@"Heading: %3.1f deg", manager.heading.magneticHeading];
    self.speedLabel.text = [NSString stringWithFormat:@"Speed: %3.2f meters/sec", newLocation.speed];
    NSLog(@"Location %@", newLocation.description);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
