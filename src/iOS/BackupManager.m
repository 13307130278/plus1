//
//  BackupManager.m
//  Plus1
//
//  Created by ariya on 16/10/22.
//  Copyright © 2016年 ariya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BackupManager.h"
#import "Counter.h"
#import "SingleUserCounterFactory.h"
#import <sqlite3.h>

#define kFilename @"data.sqlite3"

/*
 NSString *counterId;
 NSString *creator;
 NSString *counterName;
 double value;
 double step;
 NSString *unit;
 int minus;
*/

@implementation BackupManager
    static BackupManager *class = nil;
    + (BackupManager*) getInstance{
        static BackupManager *sharedInstance = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^(void) {
            sharedInstance = [[self alloc] initialize];
        });
        return sharedInstance;
    }

    - (NSString *) dataFilePath {
        NSArray *paths = NSSearchPathForDirectoriesInDomains ( NSDocumentDirectory, NSUserDomainMask, YES );
        NSString *documentsDirectory = [paths objectAtIndex:0];
        return [documentsDirectory stringByAppendingPathComponent:kFilename];
    }
    
    - (id) initialize{
        if (self == [super init])
        {
            if (sqlite3_open([[self dataFilePath] UTF8String], &database) != SQLITE_OK)
            {
                sqlite3_close(database);
            }
            const char *createsql = "create table if not exists info(counterid string primary key, creator string, countername string, unit string, value double, step double, minus int)";
            char* errorMsg;
            if (sqlite3_exec(database, createsql, NULL, NULL, &errorMsg) != SQLITE_OK)
            {
                sqlite3_close(database);
            }
        }
        return self;
    }
    
    - (int) backup
    {
        return 0;
    }

    - (int) backup : (Counter*) counter
    {
        NSString *name = [counter getCounterName];
        NSString *counterid = [counter getCounterId];
        NSString *creator = [counter getCreator];
        NSString *unit = [counter getUnit];
        double value = [counter getValue];
        double step = [counter getStep];
        int minus = [counter getMinus];
        char *errorMsg;
        NSString *sql = [[NSString alloc] initWithFormat : @"insert into info values('%@', '%@', '%@', '%@', %lf, %lf, %d)" , counterid, creator, name, unit, value, step, minus];
        const char *insertsql = [sql UTF8String];
        if (sqlite3_exec(database, insertsql, NULL, NULL, &errorMsg) != SQLITE_OK)
        {
            sqlite3_close(database);
            return -1;
        }
        return 0;
    }

    - (NSMutableArray*) getAllCounter : (NSString*) creator
    {
        NSMutableArray *data = [[NSMutableArray alloc] init];
        
        NSString *sql = [[NSString alloc] initWithFormat: @"select * from info where creator='%@'", creator];
        const char *selectsql = [sql UTF8String];
        sqlite3_stmt *statement = NULL;
        SingleUserCounterFactory *factory = [SingleUserCounterFactory getInstance];
        if (sqlite3_prepare_v2(database, selectsql, -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                NSString *counterid = [[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 0)];
                NSString *creator = [[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 1)];
                NSString *countername = [[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 2)];
                NSString *unit = [[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 3)];
                double value = sqlite3_column_double(statement, 4);
                double step = sqlite3_column_double(statement, 5);
                int minus = sqlite3_column_int(statement, 6);
                Counter *counter = [factory buildSingleUserCounter:counterid : countername :value :step :unit : minus];
                [data addObject:counter];
            }
        }
        return data;
    }






    
    
@end
