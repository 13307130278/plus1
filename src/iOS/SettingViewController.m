//
//  SettingViewController.m
//  Plus1
//
//  Created by ariya on 16/10/21.
//  Copyright © 2016年 ariya. All rights reserved.
//

#import "SettingViewController.h"
#import "Plus1System.h"

@interface SettingViewController ()

@end

@implementation SettingViewController
    @synthesize textCounterName;
    @synthesize textStep;
    @synthesize textShareID;
    @synthesize textUnit;
    @synthesize labelShareID;
    @synthesize switchSharing;
    @synthesize switchMinus;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    system = [Plus1System getInstance];
    
    UISwipeGestureRecognizer *recognizer;
    
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [[self view] addGestureRecognizer:recognizer];
    
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [[self view] addGestureRecognizer:recognizer];
    
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionUp)];
    [[self view] addGestureRecognizer:recognizer];
    
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionDown)];
    [[self view] addGestureRecognizer:recognizer];
    
    NSString *nowname = [system getNowName];
    NSString *nowunit = [system getNowUnit];
    double nowstep = [system getNowStep];
    int nowminus = [system getNowMinus];
    
    textCounterName.text = [[NSString alloc] initWithString:nowname];
    textStep.text = [[NSString alloc] initWithFormat:@"%d", (int)(nowstep)];
    textUnit.text = [[NSString alloc] initWithString:nowunit];
    if (nowminus)
    {
        [switchMinus setOn:true];
    }

}

- (void) refreshSetting{
    NSString *newname = textCounterName.text;
    NSString *unit = textUnit.text;
    //NSString *newShareId = textShareID.text;
    double newstep = [textStep.text floatValue];
    int minus = 0;
    if ([switchMinus isOn])
    {
        minus = 1;
    }
    NSString *counterid = [system getNowCounterId];
    [system changeCounterName:counterid :newname];
    [system changeCounterStep:counterid :newstep];
    [system changeCounterMinus:counterid :minus];
    [system changeCounterUnit:counterid :unit];
}


-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer{
    
    
    if(recognizer.direction==UISwipeGestureRecognizerDirectionDown) {
        
        NSLog(@"swipe down");
        return;
    }
    if(recognizer.direction==UISwipeGestureRecognizerDirectionUp) {
        
        NSLog(@"swipe up");
        return;
    }
    
    
    if(recognizer.direction==UISwipeGestureRecognizerDirectionLeft) {
        
        NSLog(@"swipe left");
        return;
    }
    
    if(recognizer.direction==UISwipeGestureRecognizerDirectionRight) {
        
        NSLog(@"swipe right");
        
        [self refreshSetting];
        
        mainViewController = [[PlusViewController alloc] initWithNibName : @"PlusViewController" bundle : nil];
        
        [self presentViewController:mainViewController animated:YES completion:^{
        }];
        return;
    }
    
}
    


- (IBAction) BGTouchDown : (id) sender {
    
    [textCounterName resignFirstResponder];
    [textShareID resignFirstResponder];
    [textStep resignFirstResponder];
    [textUnit resignFirstResponder];
    
}
    
- (IBAction) SharingSwitch : (UISwitch *)sender{
    if ([sender isOn])
    {
        [labelShareID setHidden:false];
        [textShareID setHidden:false];
    }
    else
    {
        [labelShareID setHidden:true];
        [textShareID setHidden:true];
    }
    
}

- (IBAction)MinusSwitch:(UISwitch *)sender{
    if ([sender isOn])
    {
        ;
    }
    else
    {
        ;
    }
    
    
}
    
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
