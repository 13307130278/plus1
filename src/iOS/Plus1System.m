//
//  Plus1System.m
//  Plus1
//
//  Created by ariya on 16/10/22.
//  Copyright © 2016年 ariya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Plus1System.h"
#import "BackupManager.h"
#import "Counter.h"
#import "SingleUserCounter.h"
#import "SingleUserCounterFactory.h"
#import "UserProcessor.h"


@implementation Plus1System
    static Plus1System *class = nil;

    + (Plus1System*) getInstance{
        static Plus1System *sharedInstance = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^(void) {
            sharedInstance = [[self alloc] initialize];
        });
        return sharedInstance;
    }
    
    - (id) initialize{
        if (self == [super init])
        {
            counters = nil;
            nowCounter = nil;
        }
        return self;
    }


    - (void) clear{
        counters = nil;
        nowCounter = nil;
        
    }

    
    - (Counter*) findCounter : (NSString*) counterId{
        if (!counterId)
        {
            return nil;
        }
        for (Counter* counter in counters)
        {
            if ([counter isThisCounter:counterId])
            {
                return counter;
            }
        }
        return nil;
    }
    
    - (int) addCounter : (Counter*) counter{
        [counters addObject:counter];
        return 0;
    }
    
    
    - (int) createUser : (NSString*) nusername : (NSString*) npassword{
        return [[UserProcessor getInstance] createUser:nusername :npassword];
    }
    
    - (bool) isUsernameAvailable : (NSString*) nusername{
        return [[UserProcessor getInstance] isUsernameAvailable:nusername];
    }
    
    - (int) signIn : (NSString*) nusername : (NSString*) npassword{
        int signinresult = [[UserProcessor getInstance] signIn:nusername :npassword];
        if (signinresult == 0)
        {
            counters = [[NSMutableArray alloc] init];
            username = [[NSString alloc] initWithString:nusername];
            NSMutableArray *backupdata = [[BackupManager getInstance] getAllCounter:username];
            
            for (Counter *data in backupdata)
            {
                [self addCounter : data];
            }
            
            nowCounterId = [self createSingleCounter:@"NewCounter" :0 :1 :@"s"];
            nowCounter = [self findCounter:nowCounterId];
            if (!nowCounter)
            {
                signinresult = -1;
            }
        }
        return signinresult;
    }
    
    - (int) signOn : (NSString*) username : (NSString*) password{
        return 0;
    }
    
    - (int) signOut{
        [self clear];
        return 0;
    }
    
    - (NSString*) createSingleCounter : (NSString*) counterName : (double) value : (double) step : (NSString*) unit{
        Counter *counter = [[SingleUserCounterFactory getInstance] createSingleUserCounter:counterName :value :step :unit];
        [self addCounter:counter];
        return [counter getCounterId];
    }
    
    - (NSString*) createMutipleCounter : (NSString*) counterName : (double) value : (double) step : (NSString*) unit{
        return nil;
    }
    
    - (int) isAbleToAddMutiUserCount : (NSString*) counterName{
        return 0;
    }
    
    - (int) deleteCounter : (NSString*) counterId{
        Counter *counter = [self findCounter:counterId];
        [counters removeObject:counter];
        return 0;
    }
    
    - (int) backup{
        int status = [[BackupManager getInstance] backup : nowCounter];
        nowCounterId = [self createSingleCounter:@"NewCounter" :0 :1 :@"s"];
        nowCounter = [self findCounter:nowCounterId];
        if (!nowCounter)
        {
            status = -1;
        }
        return status;
    }

    - (int) changeCounterName : (NSString*) counterId : (NSString*) newname{
        Counter *counter = [self findCounter:counterId];
        return [counter setCounterName:newname];
    }
    
    - (int) changeCounterStep : (NSString*) counterId : (double) newstep{
        Counter *counter = [self findCounter:counterId];
        return [counter setStep:newstep];
    }
    
    - (int) changeCounterMinus : (NSString*) counterId : (int) newminus{
        Counter *counter = [self findCounter:counterId];
        return [counter setMinus:newminus];
    }
    
    - (int) changeCounterValue : (NSString*) counterId : (double) newvalue{
        Counter *counter = [self findCounter:counterId];
        return [counter setValue:newvalue];
    }

    - (int) changeCounterUnit : (NSString*) counterId : (NSString*) newunit{
        Counter *counter = [self findCounter:counterId];
        return [counter setUnit:newunit];
    }

    - (int) setNowCounter : (NSString*) counterId{
        self->nowCounter = [self findCounter:counterId];
        self->nowCounterId = [[NSString alloc] initWithString:counterId];
        return 0;
    }
    
    - (Counter*) getNowCounter{
        return self->nowCounter;
    }
    - (NSString*) getNowCounterId{
        return [[NSString alloc] initWithString:nowCounterId];
    }
    
    
    - (NSString*) getNowName{
        return [nowCounter getCounterName];
    }
    
    - (double) getNowValue{
        return [nowCounter getValue];
    }
    
    - (double) getNowStep{
        return [nowCounter getStep];
    }
    
    - (int) getNowMinus{
        return [nowCounter getMinus];
    }

    - (NSString*) getNowUnit{
        return [nowCounter getUnit];
    }
    
    - (NSString*) getNowShareId{
        return [[NSString alloc] initWithString:nowCounterId];
    }
    
    - (bool) getNowSharing{
        return [nowCounter isSingleUserMode];
    }

    - (NSString*) getUserName{
        return [[NSString alloc] initWithString:username];
    }

    - (NSMutableArray*) getAllCounters{
        return counters;
    }
    
    - (int) count : (NSString*) counterId{
        return [[self findCounter:counterId] count];
    }

    - (int) count{
        return [nowCounter count];
    }




@end
