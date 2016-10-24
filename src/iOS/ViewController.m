//
//  ViewController.m
//  Plus1
//
//  Created by ariya on 16/10/20.
//  Copyright © 2016年 ariya. All rights reserved.
//

#import "ViewController.h"
#import "PlusViewController.h"
#import "Plus1System.h"


@interface ViewController ()

@end

@implementation ViewController

    @synthesize textUserName;
    @synthesize textPassword;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

- (IBAction) UserLogin : (id) sender{

    NSLog(@"%@", textUserName.text);
    NSLog(@"%@", textPassword.text);
    if ([[Plus1System getInstance] signIn:textUserName.text :textPassword.text] == 0)
    {
        PlusViewController *plusViewController =[[PlusViewController alloc]initWithNibName:@"PlusViewController" bundle:nil];
    
        [self presentViewController:plusViewController animated:YES completion:^{
        }];
    }
}
    
- (IBAction) UserLogon : (id) sender {
    
    NSLog(@"%@", textUserName.text);
    NSLog(@"%@", textPassword.text);
    if ([[Plus1System getInstance] signOn:textUserName.text :textPassword.text] == 0)
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"注册成功" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    else
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"注册失败" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
}
    
- (IBAction) BGTouchDown : (id) sender {

    [textUserName resignFirstResponder];
    [textPassword resignFirstResponder];
    
}
    
- (IBAction) UserNameDidEndOnExit : (id) sender {
    [textPassword becomeFirstResponder];
}


@end
