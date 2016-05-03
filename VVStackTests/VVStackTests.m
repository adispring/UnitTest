//
//  VVStackTests.m
//  VVStackTests
//
//  Created by wangzengdi on 4/29/16.
//  Copyright © 2016 wangzengdi. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "VVStack.h"

@interface VVStackTests : XCTestCase

@property (nonatomic, strong) VVStack *stack;


@end

@implementation VVStackTests

- (void)setUp {
    [super setUp];
    self.stack = [[VVStack alloc] init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.stack = nil;
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testStackExist {
    XCTAssertNotNil([VVStack class], @"VVStack class should exist.");
}

- (void)testStackObjectCanBeCreated {
    XCTAssertNotNil(self.stack, @"VVStack object can be created.");
}

- (void)testPushANumberAndGetIt {
    [self.stack push:2.3];
    double topNumber = [self.stack top];
    XCTAssertEqual(topNumber, 2.3, @"VVStack should can be pushed and has that top value.");
}

- (void)testPopANumberAndGetIt {
    [self.stack push:3.1];
    NSInteger beforePopCount = self.stack.count;
    double popNumber = [self.stack pop];
    NSInteger afterPopCount = self.stack.count;
    XCTAssertEqual(popNumber, 3.1, @"VVStack should can be pop and return the pop value.");
    XCTAssertEqual(beforePopCount, afterPopCount + 1, @"VVStack pop and count should minus 1");
}

@end
