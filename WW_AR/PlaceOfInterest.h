//
//  PlaceOfInterest.h
//  WeddingWireAR
//
//  Created by Andrew Cavanagh on 6/13/14.
//  Copyright (c) 2014 WeddingWire. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
@import CoreLocation;

@interface PlaceOfInterest : NSObject

@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) CLLocation *location;

+ (PlaceOfInterest *)placeOfInterestWithView:(UIView *)view at:(CLLocation *)location;

@end
