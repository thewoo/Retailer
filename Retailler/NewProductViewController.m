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

@synthesize product;


#pragma mark IBActions.

-(IBAction)addProductButtonPressed:(id)sender {
    
    if ([self.nameTextField.text length] > 0 && [self.brandTextField.text length] > 0 &&
        [self.modelTextField.text length] > 0 && [self.priceTextField.text length] > 0) {
        
        self.product = [[Product alloc] init];
        
        self.product.name = self.nameTextField.text;
        self.product.brand = self.brandTextField.text;
        self.product.model = self.modelTextField.text;
        self.product.price = [NSNumber numberWithInt:[self.priceTextField.text intValue]];
        
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

-(IBAction)updateProductButtonPressed:(id)sender {
    
    if ([self.nameTextField.text length] > 0 && [self.brandTextField.text length] > 0 &&
        [self.modelTextField.text length] > 0 && [self.priceTextField.text length] > 0) {
        
        self.product.name = self.nameTextField.text;
        self.product.brand = self.brandTextField.text;
        self.product.model = self.modelTextField.text;
        self.product.price = [NSNumber numberWithInt:[self.priceTextField.text intValue]];
        
        if ([ProductsDAO updateProduct:product]) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    
    } else {
        
        // Aquí un PopUp o algo.
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
    
    [self.addProductButton setTitle:NSLocalizedString(@"newProductViewController.button.add", nil) forState:UIControlStateNormal];
    [self.updateProductButton setTitle:NSLocalizedString(@"newProductViewController.button.update", nil) forState:UIControlStateNormal];
    
    if (self.product != nil) {
        
        [self.addProductButton setHidden:YES];
        [self.addProductButton setEnabled:NO];
        
        self.nameTextField.text = product.name;
        self.brandTextField.text = product.brand;
        self.modelTextField.text = product.model;
        self.priceTextField.text = [NSString stringWithFormat:@"%@", product.price];
        
    } else {
                
        [self.updateProductButton setHidden:YES];
        [self.updateProductButton setEnabled:NO];
    }

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
