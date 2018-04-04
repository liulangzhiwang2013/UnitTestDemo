//
//  SimpaleTestSpec.m
//  UnitTestDemo
//
//  Created by pxx on 2018/3/30.
//  Copyright 2018年 平晓行. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "ViewController.h"

SPEC_BEGIN(SimpaleTestSpec)

describe(@"SimpaleTest", ^{
    
    //当前scope内部的所有的其他block运行之前调用一次
    beforeAll(^{
    });
    
    //当前scope内部的所有的其他block运行之后调用一次
    afterAll(^{
    });
    
    __block ViewController*vc = nil;
    //在scope内的每个it之前调用一次，对于context的配置代码应该写在这里
    beforeEach(^{
        vc = [ViewController new];
    });
    
    //在scope内的每个it之后调用一次，用于清理测试后的代码
    afterEach(^{
        vc = nil;
    });
    
    //测试代码写在这里
    it(@"test message addA andB", ^{
        [[theValue([vc addA:1 andB:2]) should] equal: theValue(3)];
    });
});

SPEC_END
