//
//  EIViewController.m
//  iOSCalculatorKataRoot
//
//  Created by Douglass Turner on 05/25/13.
//  Copyright (c) 2013 Elastic Image Software. All rights reserved.
//

#import "EIViewController.h"
#import "Calculator.h"

@interface EIViewController ()
@property (strong, nonatomic) IBOutlet UITextField *inputTextField;
@property (strong, nonatomic) IBOutlet UITextField *outputTextField;
- (IBAction)addNumbersButton:(id)sender;

@end

@implementation EIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)addNumbersButton:(id)sender {

    Calculator *calculator = [[Calculator alloc] init];
    int sum = [calculator add:self.inputTextField.text];

    self.outputTextField.text = [NSString stringWithFormat:@"%d", sum];
//    NSLog(@"Yo! Raiz Labs.");
}
@end