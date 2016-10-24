//
//  ViewController.h
//  Plus1
//
//  Created by ariya on 16/10/20.
//  Copyright © 2016年 ariya. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifndef ViewController_h
#define ViewController_h


@interface ViewController : UIViewController
{
    UITextField* textUserName;
    UITextField* textPassword;
}
    
    @property (nonatomic, retain) IBOutlet UITextField* textUserName;
    @property (nonatomic, retain) IBOutlet UITextField* textPassword;

    - (IBAction) UserLogin : (id) sender;
    - (IBAction) UserLogon : (id) sender;
    - (IBAction) BGTouchDown : (id) sender;
    - (IBAction) UserNameDidEndOnExit : (id) sender;
    

@end

#endif

