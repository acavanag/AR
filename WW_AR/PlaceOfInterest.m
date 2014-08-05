//
//  PlaceOfInterest.m
//  WeddingWireAR
//
//  Created by Andrew Cavanagh on 6/13/14.
//  Copyright (c) 2014 WeddingWire. All rights reserved.
//

#import "PlaceOfInterest.h"

@implementation PlaceOfInterest

+ (PlaceOfInterest *)placeOfInterestWithView:(UIView *)view at:(CLLocation *)location
{
    PlaceOfInterest *poi = [[PlaceOfInterest alloc] init];
    poi.view = view;
    poi.location = location;
    return  poi;
}

@end
