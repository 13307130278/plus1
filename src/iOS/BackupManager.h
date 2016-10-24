//
//  BackupManager.h
//  Plus1
//
//  Created by ariya on 16/10/22.
//  Copyright © 2016年 ariya. All rights reserved.
//

#ifndef BackupManager_h
#define BackupManager_h

#import "Counter.h"
#import <sqlite3.h>

@interface BackupManager : NSObject
    {
        sqlite3* database;
    }
    + (BackupManager*) getInstance;
    - (id) initialize;
    - (int) backup;
    - (int) backup : (Counter*) counter;
    - (NSMutableArray*) getAllCounter : (NSString*) creator;

@end

#endif /* BackupManager_h */
