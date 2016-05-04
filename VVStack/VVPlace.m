//
//  VVPlace.m
//  VVStack
//
//  Created by wangzengdi on 5/4/16.
//  Copyright © 2016 wangzengdi. All rights reserved.
//

#import "VVPlace.h"

@implementation VVPlace

-(NSString *)getPlaceName
{
    return self.name;
}

-(NSString *)encodeName
{
    return [[self getPlaceName] stringByRemovingPercentEncoding];
}

-(NSString *)getEncodeName
{
    return [self encodeName];
}

-(void)getPlaceDetails:(void (^)(NSString *result))successBlock
{
    //Make a network call to get the place's details from Google Places API for instance
}

- (NSString *)getOtherName {
    return @"other name";;
}

@end
