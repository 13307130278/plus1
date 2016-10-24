//
//  SingleUserCounterFactory.h
//  Plus1
//
//  Created by ariya on 16/10/23.
//  Copyright © 2016年 ariya. All rights reserved.
//

#ifndef SingleUserCounterFactory_h
#define SingleUserCounterFactory_h

#import "Counter.h"

@interface SingleUserCounterFactory : NSObject
    
    + (SingleUserCounterFactory*) getInstance;
    - (id) initialize;
    - (Counter*) createSingleUserCounter : (NSString*) counterName : (double) value : (double) step : (NSString*) unit;
- (Counter*) buildSingleUserCounter:(NSString *)counterId : (NSString*) counterName : (double) value : (double) step : (NSString*) unit : (int) minus;

@end

#endif /* SingleUserCounterFactory_h */
