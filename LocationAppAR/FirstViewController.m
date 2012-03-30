//
//  FirstViewController.m
//  LocationAppAR
//
//  Created by Ignacio Bermeo Juarez on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

@synthesize locationTextView = _locationTextView;

- (void)viewDidLoad
{
    [self startStandardUpdates];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)startStandardUpdates
{
    
    
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    locationManager.distanceFilter = 500;
    
    [locationManager startUpdatingLocation];
    
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    
    NSDate *eventDate = newLocation.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    
    if (abs(howRecent) <15.0 ) 
    
    {
        
        self.locationTextView.text = [NSString stringWithFormat:@"latitude %+.6f, longitude %+.6f\n", newLocation.coordinate.latitude, newLocation.coordinate.longitude];

    } else {
        
         self.locationTextView.text = @"Old Update";
    }
    
   
    
    
}


- (void)viewDidUnload
{
    self.locationTextView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
