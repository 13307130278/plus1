//
//  PlusViewController.h
//  Plus1
//
//  Created by ariya on 16/10/20.
//  Copyright © 2016年 ariya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Plus1System.h"

#ifndef PlusViewController_h
#define PlusViewController_h

@class SettingViewController;
@class BackupTableViewController;


@interface PlusViewController : UIViewController
    {
        NSString *userName;
        NSString *password;
        
        double count;
        NSString *projectName;
        Plus1System *system;
        double step;
        
        SettingViewController *settingViewController;
        BackupTableViewController *logViewController;
        
    }
    

    @property (nonatomic, retain) IBOutlet UILabel *labelCount;
    

@end
#endif
