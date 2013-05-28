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
- (IBAction)addButton:(id)sender;
@end

@implementation EIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)addButton:(id)sender {

    @try {
        Calculator *calculator = [[Calculator alloc] init];

        int sum = [calculator add:self.inputTextField.text];
        self.outputTextField.text = [NSString stringWithFormat:@"%d", sum];

    }

    @catch(NSException *e) {
        self.outputTextField.text = [NSString stringWithFormat:@"%@", e.name];
    }

}
@end