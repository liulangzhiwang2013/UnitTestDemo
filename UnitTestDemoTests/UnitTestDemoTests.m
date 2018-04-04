//
//  UnitTestDemoTests.m
//  UnitTestDemoTests
//
//  Created by pxx on 2018/3/28.
//  Copyright © 2018年 平晓行. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface UnitTestDemoTests : XCTestCase
@property (nonatomic,strong) ViewController *vc;
@end

@implementation UnitTestDemoTests

- (void)setUp {
    [super setUp];
    //初始化的代码，在测试方法调用之前调用
    self.vc = [ViewController new];
}

- (void)tearDown {
    [super tearDown];
    // 释放测试用例的资源代码，这个方法会每个测试用例执行后调用
    self.vc = nil;
}

- (void)testExample {
    // 测试用例的例子，可以自己重新添加，注意一定要test开头
    NSInteger a = 1, b = 2;
    XCTAssertTrue([self.vc addA:a andB:b]==3 , @"测试不通过");
}

- (void)testPerformanceExample {
    // 测试性能的方法，有Instrument调试工具之后，其实这个没毛用
    [self measureBlock:^{
        // 需要测试性能的代码
        for (int i = 0; i < 1000; i++) {
            NSLog(@"%d" , i);
        }
    }];
}

@end
