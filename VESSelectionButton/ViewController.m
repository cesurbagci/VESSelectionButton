//
//  ViewController.m
//  VESSelectionButton
//
//  Created by developer on 21/02/17.
//  Copyright © 2017 developer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.btn1 setMultipleSelectionEnabled:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnTest_tap:(id)sender {
    NSLog(@"%@", self.btn1.selectedButtons);
    [self.btn1 setMultipleSelectionEnabled:!self.btn1.multipleSelectionEnabled];
}
@end
