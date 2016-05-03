//
//  VVStackSpec.m
//  VVStack
//
//  Created by wangzengdi on 5/3/16.
//  Copyright 2016 wangzengdi. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "VVStack.h"


SPEC_BEGIN(VVStackSpec)

describe(@"VVStack", ^{
    context(@"when created", ^{
        __block VVStack *stack = nil;
        
        beforeEach(^{
            stack = [[VVStack alloc] init];
        });
        
        afterEach(^{
            stack = nil;
        });
        
        it(@"should have the class VVStack", ^{
            [[[VVStack class] shouldNot] beNil];
        });
        
        it(@"should exist", ^{
            [[stack shouldNot] beNil];
        });
        
        it(@"should be able to push and get top", ^{
            [stack push:2.3];
            [[theValue([stack top]) should] equal:theValue(2.3)];
            
            [stack push:4.6];
            [[theValue([stack top]) should] equal:4.6 withDelta:0.001];
        });
        
        it(@"should equal contains 0 element", ^{
            [[theValue(stack.count) should] beZero];
        });
        
        it(@"should equal contains 0 element", ^{
            [[stack should] haveCountOf:0];
        });
        
        it(@"should equal contains 0 element", ^{
            [[stack should] beEmpty];
        });
        
        it(@"should raise a exception when pop", ^{
            [[theBlock(^{
                [stack pop];
            }) should] raiseWithName:@"VVStackPopEmptyException"];
        });
    });
    
    context(@"when new created and push 4.6", ^{
        __block VVStack *stack = nil;
        beforeEach(^{
            stack = [[VVStack alloc] init];
            [stack push:4.6];
        });
        
        afterEach(^{
            stack = nil;
        });
        
        it(@"can be poped and the value equals 4.6", ^{
            [[theValue([stack pop]) should] equal:theValue(4.6)];
        });
        
        it(@"should contains 0 element after pop", ^{
            [stack pop];
            [[stack should] beEmpty];
        });
    });
});

SPEC_END
