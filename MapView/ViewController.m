//
//  ViewController.m
//  MapView
//
//  Created by Felipe Marques Ramos on 26/02/15.
//  Copyright (c) 2015 Felipe Marques Ramos. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//teste


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _lugar=[[CLLocationManager alloc]init];//inicializa o CLLocationManager
    [_lugar setDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];//seta a precisao
    _lugar.delegate=self;// diz o delegate do CoreLocation é o self
        //resolve problema do IOS8 que pede por autorizacao
    if ([_lugar respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [_lugar requestWhenInUseAuthorization];
    }
    [_lugar startUpdatingLocation];//faz o coreLocation comecar a funcionar
    
    _mapa.showsUserLocation=YES;
    
    [self atualizarLoc:self];
}


-(void)locationManager:(CLLocationManager *)manager didUpateLocations:(NSArray *)locations{
    NSLog(@"%@",[locations lastObject]);
    
    CLLocationCoordinate2D loc=[[locations lastObject] coordinate];
    
    MKCoordinateRegion regiao = MKCoordinateRegionMakeWithDistance(loc, 30, 30);
    
    [_mapa setRegion:regiao animated:YES];
}

- (IBAction)atualizarLoc:(id)sender {
    
    MKCoordinateRegion regiao = MKCoordinateRegionMakeWithDistance([[_lugar location] coordinate], 30, 30);
    
    [_mapa setRegion:regiao animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
