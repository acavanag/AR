//
//  WWViewController.m
//  WW_AR
//
//  Created by Andrew Cavanagh on 6/13/14.
//  Copyright (c) 2014 WeddingWire. All rights reserved.
//

#import "WWViewController.h"
#import "PlaceOfInterest.h"
#import "ARView.h"
@import CoreLocation;

@interface WWViewController ()

@end

@implementation WWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self begin];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)begin
{
    ARView *arView = (ARView *)self.view;
    
//    const char *poiNames[] = {"California Yacht Club"};
//    CLLocationCoordinate2D poiCoords[] = {{33.983209, -118.446133}};
    
    const char *poiNames[] = {"Central Park NY"};
	
    CLLocationCoordinate2D poiCoords[] = {{40.7711329, -73.9741874}};
    
    int numPois = sizeof(poiCoords) / sizeof(CLLocationCoordinate2D);
    
    NSMutableArray *placesOfInterest = [NSMutableArray arrayWithCapacity:numPois];
    
    for (int i = 0; i < numPois; i++)
    {
        UILabel *label = [[UILabel alloc] init];
        [label setAdjustsFontSizeToFitWidth:YES];
        [label setOpaque:NO];
        [label setBackgroundColor:[UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:0.5f]];
        [label setCenter:CGPointMake(200.0f, 200.0f)];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setTextColor:[UIColor whiteColor]];
        [label setText:[NSString stringWithCString:poiNames[i] encoding:NSASCIIStringEncoding]];
        
        CGSize size = [label.text sizeWithAttributes:@{
                                                       NSFontAttributeName : label.font
                                                       }];
        
        [label setBounds:CGRectMake(0.0f, 0.0f, size.width, size.height)];
        
        CLLocation *location = [[CLLocation alloc] initWithLatitude:poiCoords[i].latitude longitude:poiCoords[i].longitude];
        PlaceOfInterest *poi = [PlaceOfInterest placeOfInterestWithView:label at:location];
        
        [placesOfInterest insertObject:poi atIndex:i];
    }
    
    [arView setPlacesOfInterest:placesOfInterest];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    ARView *arView = (ARView *)self.view;
    [arView start];
}
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    ARView *arView = (ARView *)self.view;
    [arView stop];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return interfaceOrientation == UIInterfaceOrientationPortrait;
}

@end
