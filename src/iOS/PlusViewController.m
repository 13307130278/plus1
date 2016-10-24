//
//  PlusViewController.m
//  Plus1
//
//  Created by ariya on 16/10/20.
//  Copyright © 2016年 ariya. All rights reserved.
//

#import "PlusViewController.h"
#import "SettingViewController.h"
#import "BackupTableViewController.h"


@interface PlusViewController ()

@end

@implementation PlusViewController

    @synthesize labelCount;

- (void) refreshCounter{
    count = [system getNowValue];
    NSString *unit = [system getNowUnit];
    NSString *num = [[NSString alloc] initWithFormat: @"%d %@", (int)(count), unit];
    labelCount.text = num;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    system = [Plus1System getInstance];
    UITapGestureRecognizer *taprecognizer;

    taprecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleClick:)];
    taprecognizer.numberOfTouchesRequired = 1;
    taprecognizer.numberOfTapsRequired = 1;
    [[self view] addGestureRecognizer:taprecognizer];
    
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
    
    labelCount.adjustsFontSizeToFitWidth = YES;
    [self refreshCounter];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) SaveData{
    [system backup];
}
    
-(void)handleClick:(UITapGestureRecognizer *)recognizer{
    
    NSLog(@"Click");
    [system count];
    [self refreshCounter];
    
}
    
-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer{
    
    
    if(recognizer.direction==UISwipeGestureRecognizerDirectionDown) {
        
        NSLog(@"swipe down");
        NSString *counterid = [system getNowCounterId];
        [system changeCounterValue:counterid :0];
        [self refreshCounter];
        return;
    }
    if(recognizer.direction==UISwipeGestureRecognizerDirectionUp) {
        
        NSLog(@"swipe up");
        [self SaveData];
        NSString *counterid = [system getNowCounterId];
        [system changeCounterValue:counterid :0];
        [self refreshCounter];
        return;
    }
    
    
    if(recognizer.direction==UISwipeGestureRecognizerDirectionLeft) {
        
        NSLog(@"swipe left");
        settingViewController = [[SettingViewController alloc] initWithNibName : @"SettingViewController" bundle : nil];
        [self presentViewController:settingViewController animated:YES completion:^{
        }];
        return;
    }
    
    if(recognizer.direction==UISwipeGestureRecognizerDirectionRight) {
        
        NSLog(@"swipe right");
        logViewController = [[BackupTableViewController alloc] initWithNibName : @"BackupTableViewController" bundle : nil];
        [self presentViewController:logViewController animated:YES completion:^{
        }];
        return;
    }
    
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
