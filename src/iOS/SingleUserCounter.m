//
//  SingleUserCounter.m
//  Plus1
//
//  Created by ariya on 16/10/22.
//  Copyright © 2016年 ariya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SingleUserCounter.h"
#import "Counter.h"


@implementation SingleUserCounter

- (id) init : (NSString*)ncounterId : (NSString*) ncreator{
    self->counterId = [[NSString alloc] initWithString:ncounterId];
    self->creator = [[NSString alloc] initWithString:ncreator];
    self->minus = 0;
    return self;
}
    
- (int) setCounterInfo : (NSString*) ncounterName : (double) nvalue : (double) nstep : (NSString*) nunit{
    value = nvalue;
    step = nstep;
    counterName = [[NSString alloc] initWithString:ncounterName];
    unit = [[NSString alloc] initWithString:nunit];
    return 0;
}
    
- (bool) isThisCounter : (NSString*) CounterId{
    return [counterId isEqualToString:CounterId];
}
    
- (int) setValue : (double) newvalue{
    value = newvalue;
    return 0;
}
- (int) setStep : (double) newstep{
    step = newstep;
    return 0;
}
- (int) setCounterName : (NSString*) newname{
    counterName = [[NSString alloc] initWithString:newname];
    return 0;
}
- (int) setMinus:(int)newminus{
    minus = newminus;
    return 0;
}
- (int) setUnit : (NSString*) newunit{
    unit = [[NSString alloc] initWithString:newunit];
    return 0;
}
    
- (double) getValue{
    return value;
}
    
- (double) getStep{
    return step;
}
    
- (int) getMinus{
    return minus;
}
    
- (NSString*) getCounterName{
    return counterName;
}
    
- (NSString*) getUnit{
    return unit;
}
    
- (NSString*) getCreator{
    return creator;
}
    
- (NSString*) getCounterId{
    return counterId;
}
    
- (int) count : (bool) isMinus{
    if (isMinus)
    {
        value -= step;
    }
    else
    {
        value += step;
    }
    return 0;
}

- (int) count{
    return [self count : minus];
}
    
- (bool) isSingleUserMode{
    return true;
}
    
- (bool) isCreatedBy : (NSString*) username{
    return [creator isEqualToString: username];
}



@end
