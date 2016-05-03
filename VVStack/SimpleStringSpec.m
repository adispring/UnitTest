//
//  SimpleStringSpec.m
//  VVStack
//
//  Created by wangzengdi on 5/3/16.
//  Copyright 2016 wangzengdi. All rights reserved.
//

#import <Kiwi/Kiwi.h>


SPEC_BEGIN(SimpleStringSpec)

describe(@"SimpleString", ^{
    context(@"when assigned to 'Hello world'", ^{
        NSString *greeting = @"Hello world";
        it(@"should exist", ^{
            [[greeting shouldNot] beNil];
        });
        
        it(@"should equal to 'Hello world'", ^{
            [[greeting should] equal:@"Hello world"];
        });
    });
});

SPEC_END
