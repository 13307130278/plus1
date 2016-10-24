//
//  SingleUserCounterFactory.m
//  Plus1
//
//  Created by ariya on 16/10/23.
//  Copyright © 2016年 ariya. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Plus1System.h"
#import "SingleUserCounterFactory.h"
#import "SingleUserCounter.h"
#import "Counter.h"

@implementation SingleUserCounterFactory

    static SingleUserCounterFactory *class = nil;
    
    + (SingleUserCounterFactory*) getInstance{
        static SingleUserCounterFactory *sharedInstance = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^(void) {
            sharedInstance = [[self alloc] initialize];
        });
        return sharedInstance;
    }
    
    - (id) initialize{
        if (self == [super init])
        {
            ;
        }
        return self;
    }
    
    - (Counter*) createSingleUserCounter:(NSString *)counterName :(double)value :(double)step :(NSString *)unit{
        UInt64 createtime = [[NSDate date] timeIntervalSince1970] * 1000;
        NSString *creator = [[Plus1System getInstance] getUserName];
        NSString *counterId = [[NSString alloc] initWithFormat:@"%@:%llu:%d" ,creator, createtime, arc4random()];
        Counter *counter = [[SingleUserCounter alloc] init : counterId : creator];
        [counter setCounterInfo : counterName : value : step : unit];
        return counter;
    }

    - (Counter*) buildSingleUserCounter:(NSString *)counterId : (NSString*) counterName : (double) value : (double) step : (NSString*) unit : (int) minus{
        NSString *creator = [[Plus1System getInstance] getUserName];
        Counter *counter = [[SingleUserCounter alloc] init : counterId : creator];
        [counter setCounterInfo : counterName : value : step : unit];
        [counter setMinus:minus];
        return counter;
    }


@end
