//
//  Counter.h
//  Plus1
//
//  Created by ariya on 16/10/22.
//  Copyright © 2016年 ariya. All rights reserved.
//

#ifndef Counter_h
#define Counter_h


@interface Counter : NSObject

- (int) setCounterInfo : (NSString*) ncounterName : (double) nvalue : (double) nstep : (NSString*) nunit;
    
- (bool) isThisCounter : (NSString*) CounterId;
    
- (double) getValue;
- (double) getStep;
- (int) getMinus;
- (NSString*) getCounterName;
- (NSString*) getUnit;
- (NSString*) getCreator;
- (NSString*) getCounterId;
- (int) setValue : (double) newvalue;
- (int) setStep : (double) newstep;
- (int) setMinus : (int) newminus;
- (int) setCounterName : (NSString*) newname;
- (int) setUnit : (NSString*) newunit;
    
- (int) count;
- (int) count : (bool) isMinus;
- (bool) isSingleUserMode;
- (bool) isCreatedBy : (NSString*) username;

@end
/*
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
*/

#endif /* Counter_h */
