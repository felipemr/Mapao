//
//  ViewController.h
//  MapView
//
//  Created by Felipe Marques Ramos on 26/02/15.
//  Copyright (c) 2015 Felipe Marques Ramos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController

@property (strong) CLLocationManager *lugar;

@property (weak, nonatomic) IBOutlet MKMapView *mapa;


-(void)locationManager:(CLLocationManager *)manager didUpateLocations:(NSArray *)locations;

- (IBAction)atualizarLoc:(id)sender;
@end

