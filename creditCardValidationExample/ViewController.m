//
//  ViewController.m
//  creditCardValidationExample
//
//  Created by Mario Vizcaino on 23/10/16.
//  Copyright © 2016 Mario Vizcaino. All rights reserved.
//

#import "ViewController.h"
#import "Luhn.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *cardTypeLabel;
@property (weak, nonatomic) IBOutlet UITextField *cardNumberTextField;
@property (weak, nonatomic) IBOutlet UIButton *validateCardButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self buttonStyle];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)validateCard {
    NSString * cardNumber = self.cardNumberTextField.text;
    if (![cardNumber isEqualToString:@""]) {
        [self setTextStyle:[UIColor whiteColor] borderWidth:0.0f];
        
        BOOL isValid = [Luhn validateString:cardNumber];
        if (isValid) {
            // process payment
            [self callAlert:@"VALID CARD"];
            //OLCreditCardType cardType = [Luhn typeFromString:cardNumber];
            // TODO
            // GET THE CARD TYPE NAME
        }
        else {
            [self callAlert:@"INVALID CARD"];
            [self setTextStyle:[UIColor redColor] borderWidth:2.0f];
        }
        
    }else{
        [self callAlert:@"YOU MUST FILL ALL THE FIELDS"];
        [self setTextStyle:[UIColor redColor] borderWidth:2.0f];
    }
}
/// BUTTON STYLE
-(void)buttonStyle{
    UIButton * button = self.validateCardButton;
    [button.layer setBorderWidth:1.0f];
    [button.layer setCornerRadius:20.0f];
    [button.layer setBorderColor:[[UIColor whiteColor] CGColor]];
}
-(void)setTextStyle: (UIColor*)color borderWidth: (double)width{
    UITextField * field = self.cardNumberTextField;
    [field.layer setBorderWidth:width];

    [field.layer setBorderColor:[color CGColor]];
}
// ALERT VIEW CLASS
-(void)callAlert: (NSString*)message{
    
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"CARD VALIDATOR"
                                  message:message
                                  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];

}
@end
