//
//  Counter.m
//  Plus1
//
//  Created by ariya on 16/10/23.
//  Copyright © 2016年 ariya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Counter.h"

@implementation Counter

- (int) setCounterInfo : (NSString*) ncounterName : (double) nvalue : (double) nstep : (NSString*) nunit{
    return 0;
}

- (bool) isThisCounter : (NSString*) CounterId{
    return false;
}

- (double) getValue{
    return 0;
}
- (double) getStep{
    return 0;
}
- (int) getMinus{
    return 0;
}
- (NSString*) getCounterName{
    return nil;
}
- (NSString*) getUnit{
    return nil;
}
- (NSString*) getCreator{
    return nil;
}
- (NSString*) getCounterId{
    return nil;
}
- (int) setValue : (double) newvalue{
    return 0;
}
- (int) setStep : (double) newstep{
    return 0;
}
- (int) setMinus : (int) newminus{
    return 0;
}
- (int) setCounterName : (NSString*) newname{
    return 0;
}
- (int) setUnit : (NSString*) newunit{
    return 0;
}
- (int) count{
    return 0;
}
- (int) count : (bool) isMinus{
    return 0;
}
- (bool) isSingleUserMode{
    return false;
}
- (bool) isCreatedBy : (NSString*) username{
    return false;
}


@end
