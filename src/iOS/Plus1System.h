//
//  Plus1System.h
//  Plus1
//
//  Created by ariya on 16/10/22.
//  Copyright © 2016年 ariya. All rights reserved.
//

#ifndef Plus1System_h
#define Plus1System_h

#import "Counter.h"

@interface Plus1System : NSObject
    
    {
        NSString *nowCounterId;
        Counter *nowCounter;
        
        NSString *username;
        
        NSMutableArray *counters;
    }
    
    + (Plus1System*) getInstance;
    - (id) initialize;
    
    - (int) createUser : (NSString*) username : (NSString*) password;
    - (bool) isUsernameAvailable : (NSString*) username;
    - (int) signIn : (NSString*) username : (NSString*) password;
    - (int) signOn : (NSString*) username : (NSString*) password;
    - (int) signOut;
    - (void) clear;
    - (NSString*) createSingleCounter : (NSString*) counterName : (double) value : (double) step : (NSString*) unit;
    - (NSString*) createMutipleCounter : (NSString*) counterName : (double) value : (double) step : (NSString*) unit;
    - (int) isAbleToAddMutiUserCount : (NSString*) counterName;
    
    - (int) deleteCounter : (NSString*) counterId;
    - (int) backup;
    
    - (int) changeCounterName : (NSString*) counterId : (NSString*) newname;
    - (int) changeCounterStep : (NSString*) counterId : (double) newstep;
    - (int) changeCounterMinus : (NSString*) counterId : (int) newminus;
    - (int) changeCounterValue : (NSString*) counterId : (double) newvalue;
    - (int) changeCounterUnit : (NSString*) counterId : (NSString*) newunit;
    - (int) setNowCounter : (NSString*) counterId;
    - (Counter*) getNowCounter;
    - (NSString*) getNowCounterId;
    
    - (NSString*) getNowName;
    - (double) getNowValue;
    - (double) getNowStep;
    - (int) getNowMinus;
    - (NSString*) getNowUnit;
    - (NSString*) getNowShareId;
    - (bool) getNowSharing;
    - (NSMutableArray*) getAllCounters;

    - (NSString*) getUserName;
    
    - (int) count : (NSString*) counterId;
    - (int) count;

    - (Counter*) findCounter : (NSString*) counterId;
    - (int) addCounter : (Counter*) counter;
    
    
    
    
    
@end


#endif /* Plus1System_h */
