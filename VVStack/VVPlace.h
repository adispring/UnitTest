//
//  VVPlace.h
//  VVStack
//
//  Created by wangzengdi on 5/4/16.
//  Copyright © 2016 wangzengdi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VVPlace : NSObject

@property (nonatomic, copy) NSString *name;

- (NSString *)getPlaceName;
- (NSString *)getEncodeName;
- (NSString *)encodeName;
- (NSString *)getOtherName;
-(void)getPlaceDetails:(void (^)(NSString *result))successBlock;

@end
