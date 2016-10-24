//
//  SingleUserCounter.h
//  Plus1
//
//  Created by ariya on 16/10/22.
//  Copyright © 2016年 ariya. All rights reserved.
//

#ifndef SingleUserCounter_h
#define SingleUserCounter_h

#import "Counter.h"

@interface SingleUserCounter : Counter 
    {
        NSString *counterId;
        NSString *creator;
        NSString *counterName;
        double value;
        double step;
        NSString *unit;
        int minus;
    }
   
- (id) init : (NSString*) ncounterId : (NSString*) ncreator;
    
@end

#endif /* SingleUserCounter_h */
