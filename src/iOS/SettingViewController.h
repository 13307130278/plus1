//
//  SettingViewController.h
//  Plus1
//
//  Created by ariya on 16/10/21.
//  Copyright © 2016年 ariya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlusViewController.h"
#import "Plus1System.h"

#ifndef SettingViewController_h
#define SettingViewController_h
@interface SettingViewController : UIViewController

    {
        Plus1System *system;
        PlusViewController *mainViewController;
    }
    
    @property (nonatomic, retain) IBOutlet UITextField* textCounterName;
    @property (nonatomic, retain) IBOutlet UITextField* textStep;
    @property (nonatomic, retain) IBOutlet UITextField* textShareID;
    @property (nonatomic, retain) IBOutlet UITextField* textUnit;
    @property (nonatomic, retain) IBOutlet UILabel* labelShareID;
    @property (nonatomic, retain) IBOutlet UISwitch* switchSharing;
    @property (nonatomic, retain) IBOutlet UISwitch* switchMinus;

    - (IBAction) BGTouchDown : (id) sender;
    - (IBAction) SharingSwitch : (UISwitch *)sender;
    - (IBAction) MinusSwitch : (UISwitch*)sender;
@end
#endif
