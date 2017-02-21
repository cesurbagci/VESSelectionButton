//
//  ViewController.h
//  VESSelectionButton
//
//  Created by developer on 21/02/17.
//  Copyright © 2017 developer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VESSelectionButton.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet VESSelectionButton *btn1;
@property (weak, nonatomic) IBOutlet VESSelectionButton *btn2;
@property (weak, nonatomic) IBOutlet VESSelectionButton *btn3;
@property (weak, nonatomic) IBOutlet VESSelectionButton *btn4;

- (IBAction)btnTest_tap:(id)sender;
@end

