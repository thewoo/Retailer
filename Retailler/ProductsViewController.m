//
//  ProductsViewController.m
//  Retailler
//
//  Created by Jorge Pardo on 01/10/12.
//  Copyright (c) 2012 Jorge Pardo. All rights reserved.
//

#import "ProductsViewController.h"
#import "NewProductViewController.h"

@interface ProductsViewController ()

@end

@implementation ProductsViewController


#pragma mark IBActions.

-(void)addNewProduc:(id)sender {
    
    NewProductViewController *newProductViewController = [[NewProductViewController alloc] initWithNibName:@"NewProductViewController" bundle:nil];
    [self.navigationController pushViewController:newProductViewController animated:YES];
    
}


#pragma mark ViewController's.

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *newProductButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewProduc:)];
    self.navigationItem.rightBarButtonItem = newProductButton;    
    
    
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
