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
@end

@implementation VVStack
- (id)init {
    if (self = [super init]) {
        _numbers = [NSMutableArray new];
    }
    return self;
}

- (void)push:(double)num {
    [self.numbers addObject:@(num)];
}

- (double)pop {
    if ([self count] == 0) {
        [NSException raise:@"VVStackPopEmptyException" format:@"Can not pop an empty stack."];
    }
    double result = self.top;
    [self.numbers removeLastObject];
    return result;
}

- (double)top {
    return [[self.numbers lastObject] doubleValue];
}

- (NSInteger)count {
    return [self.numbers count];
}
@end

