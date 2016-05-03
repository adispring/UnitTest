//
//  VVStack.m
//  VVStack
//
//  Created by wangzengdi on 4/29/16.
//  Copyright © 2016 wangzengdi. All rights reserved.
//

#import "VVStack.h"

@interface VVStack()
@property (nonatomic, strong) NSMutableArray *numbers;
@property (nonatomic, assign) NSInteger count;
@end

@implementation VVStack
- (id)init {
    if (self = [super init]) {
        _numbers = [NSMutableArray new];
        _count = 0;
    }
    return self;
}

- (void)push:(double)num {
    [self.numbers addObject:@(num)];
    self.count++;
}

- (double)pop {
    NSAssert(self.count > 0, @"count should > 0");
    NSNumber *lastNum = self.numbers.lastObject;
    [self.numbers removeLastObject];
    self.count--;
    return [lastNum floatValue];
}

- (double)top {
    return [[self.numbers lastObject] doubleValue];
}
@end

