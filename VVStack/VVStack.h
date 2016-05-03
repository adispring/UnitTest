//
//  VVStack.h
//  VVStack
//
//  Created by wangzengdi on 4/29/16.
//  Copyright © 2016 wangzengdi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VVStack : NSObject

@property (nonatomic, readonly, assign) NSInteger count;

- (void)push:(double)num;
- (double)top;
- (double)pop;

@end
