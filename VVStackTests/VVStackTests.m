//
//  VVStackTests.m
//  VVStackTests
//
//  Created by wangzengdi on 4/29/16.
//  Copyright © 2016 wangzengdi. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Kiwi.h"
#import "OCMock.h"

#import "VVStack.h"
#import "VVPlace.h"

//#define OCMOCK_V2

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

}

- (void)testGetPlaceDetails {
    VVPlace *actualPlaceInstance = [[VVPlace alloc] init];
    id partialMockPlace = OCMPartialMock(actualPlaceInstance);
    
    // 替换 getPlaceName 的返回值
    OCMStub([partialMockPlace getPlaceName]).andReturn(@"JFK International Airport");
    XCTAssertEqualObjects([partialMockPlace getPlaceName], @"JFK International Airport", @"Invalid Place name");
    
    // 验证 getEncodeName 调用后，encodeName 有没有被调用。
    [partialMockPlace getEncodeName];
    OCMVerify([partialMockPlace encodeName]);
//    OCMVerify([partialMockPlace getOtherName]);
 
    // 模拟completeBlock 的返回数据。
#ifdef OCMOCK_V2
    void (^proxyBlock)(NSInvocation *) = ^(NSInvocation *invocation) {
        void (^passedBlock)(NSString *result);
        // The block gets a NSInvocation instance from which you can query all the used arguments. Note that the first argument is at index 2 since you have self and _cmd at the indices 0 and 1
        [invocation getArgument: &passedBlock atIndex: 2];
        if (passedBlock != nil) {
            passedBlock(@"JFK International Airport");
        }
    };
    
    [[[partialMockPlace stub] andDo:proxyBlock] getPlaceDetails:[OCMArg any]];
#else
    OCMStub([partialMockPlace getPlaceDetails:[OCMArg any]]).andDo(^(NSInvocation *invocation) {
        void (^passedBlock)(NSString *result);
        [invocation getArgument: &passedBlock atIndex: 2];
        if (passedBlock != nil) {
            passedBlock(@"JFK International Airport");
        }
    });
#endif
    
    [partialMockPlace getPlaceDetails:^(NSString *result) {
        XCTAssertEqualObjects(result, @"JFK International Airport");
    }];
}

@end
