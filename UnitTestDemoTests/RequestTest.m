//
//  RequestTest.m
//  UnitTestDemoTests
//
//  Created by pxx on 2018/3/29.
//  Copyright © 2018年 平晓行. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <AFNetworking.h>

@interface RequestTest : XCTestCase

@end

@implementation RequestTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"request"];
    // 获得请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",nil];
    // 发送 GET 请求
    [mgr GET:@"http://www.weather.com.cn/adat/sk/101110101.html" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        XCTAssertNotNil(responseObject, @"返回出错");
        [expectation fulfill];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        XCTAssertNil(error, @"请求出错");
        [expectation fulfill];
    }];
    
    // 在case最后使用这一方法，此时单测程序会阻塞到这里；除非达到了超时时间（秒单位）或者是回调函数中调用了fulfill，单测程序才会结束
    // 若是超时情况，则认为case失败；若通过expectation的fulfill触发，则case通过
    //等待回掉方法，5秒超时触发测试失败
    [self waitForExpectationsWithTimeout:5 handler:^(NSError * _Nullable error) {
        //测试结束
        NSLog(@"test case over");
    }];
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
