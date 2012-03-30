//
//  FirstViewController.h
//  LocationAppAR
//
//  Created by Ignacio Bermeo Juarez on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface FirstViewController : UIViewController <CLLocationManagerDelegate>

@property (nonatomic, strong) IBOutlet UITextView *locationTextView;

-(void)startStandardUpdates;

@end
