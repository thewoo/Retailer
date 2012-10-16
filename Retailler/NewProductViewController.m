//
//  NewProductViewController.m
//  Retailler
//
//  Created by Jorge Pardo on 15/10/12.
//  Copyright (c) 2012 Jorge Pardo. All rights reserved.
//

#import "NewProductViewController.h"
#import "ProductsDAO.h"
#import "Product.h"

@interface NewProductViewController ()

@end

@implementation NewProductViewController


#pragma mark IBActions.

-(IBAction)addProductButtonPressed:(id)sender {
    
    if ([self.nameTextField.text length] > 0 && [self.brandTextField.text length] > 0 &&
        [self.modelTextField.text length] > 0 && [self.priceTextField.text length] > 0) {
        
        Product *product = [[Product alloc] init];
        
        product.name = self.nameTextField.text;
        product.brand = self.brandTextField.text;
        product.model = self.modelTextField.text;
        product.price = [NSNumber numberWithInt:[self.priceTextField.text intValue]];
        
        if ([ProductsDAO addNewProduct:product]) {
            [self.navigationController popViewControllerAnimated:YES];
        }
        
        
    } else {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"newProductViewController.alert.title", nil)
                                                  message:NSLocalizedString(@"newProductViewController.alert.message", nil)
                                                  delegate:self cancelButtonTitle:NSLocalizedString(@"newProductViewController.alert.button", nil)
                                                  otherButtonTitles:nil, nil];
        
        
        [alert show];
    }
}


#pragma mark UITextField's Delegate.

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}


#pragma mark UIViewController's.

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.nameTextField.placeholder = NSLocalizedString(@"newProductViewController.textField.name", nil);
    self.brandTextField.placeholder = NSLocalizedString(@"newProductViewController.textField.brand", nil);
    self.modelTextField.placeholder = NSLocalizedString(@"newProductViewController.textField.model", nil);
    self.priceTextField.placeholder = NSLocalizedString(@"newProductViewController.textField.price", nil);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {}
    return self;
}


@end
