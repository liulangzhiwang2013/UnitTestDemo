//
//  TestSpec.m
//  UnitTestDemo
//
//  Created by pxx on 2018/3/30.
//  Copyright 2018年 平晓行. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <LRResty.h>
#import "ViewController.h"


SPEC_BEGIN(TestSpec)

describe(@"Test", ^{
    
    
    __block ViewController *vc = nil;
    beforeEach(^{
        vc = [ViewController new];
    });

    it(@"响应某个方法的期望，带参数", ^{
        [[vc should]receive:@selector(addA:andB:) withArguments:theValue(2),theValue(2)];
        [vc addA:2 andB:2];
    });
    
    
    //数量变化的期望
    it(@"数组长度变化的期望", ^{
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:20];
        
        //期望数组长度变化，变化量不确定
        [[theBlock(^{
            [arr addObject:@"bar"];
        }) should] change:^NSInteger{
            return arr.count;
        }];
        
        //期望数组长度变化+1
        [[theBlock(^{
            [arr addObject:@"foo"];
        }) should] change:^NSInteger{
            return arr.count;
        } by:+1];
    });
    
    
    //异步测试
    context(@"Fetching service data", ^{
        it(@"should receive data within one second", ^{
            
            __block NSString *fetchedData = nil;
            
            [[LRResty client] get:@"http://www.example.com" withBlock:^(LRRestyResponse* r) {
                NSLog(@"That's it! %@", [r asString]);
                fetchedData = [r asString];
            }];
            
            [[expectFutureValue(fetchedData) shouldEventually] beNonNil];
            
        });
        
    });
    
});

SPEC_END


