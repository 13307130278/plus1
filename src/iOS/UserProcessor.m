//
//  UserProcessor.m
//  Plus1
//
//  Created by ariya on 16/10/22.
//  Copyright © 2016年 ariya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserProcessor.h"



@implementation UserProcessor
    static UserProcessor *class = nil;
    + (UserProcessor*) getInstance{
        static UserProcessor *sharedInstance = nil;
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
    
    - (bool) isUsernameAvailable:(NSString *)username{
        return true;
    }
    - (int) signIn:(NSString *)username :(NSString *)password{
        return 0;
    }
    - (int) createUser:(NSString *)username :(NSString *)password{
        return 0;
    }


@end
