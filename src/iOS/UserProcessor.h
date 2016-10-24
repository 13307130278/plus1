//
//  UserProcessor.h
//  Plus1
//
//  Created by ariya on 16/10/22.
//  Copyright © 2016年 ariya. All rights reserved.
//

#ifndef UserProcessor_h
#define UserProcessor_h

@interface UserProcessor : NSObject
    {
        
    }
    
    + (UserProcessor*) getInstance;
    - (id) initialize;
    - (int) createUser : (NSString*) username : (NSString*) password;
    - (bool) isUsernameAvailable : (NSString*) username;
    - (int) signIn : (NSString*) username : (NSString*) password;
    
@end


#endif /* UserProcessor_h */
