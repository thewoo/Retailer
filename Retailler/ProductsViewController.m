//
//  ProductsViewController.m
//  Retailler
//
//  Created by Jorge Pardo on 01/10/12.
//  Copyright (c) 2012 Jorge Pardo. All rights reserved.
//

#import "ProductsViewController.h"
#import "NewProductViewController.h"
#import "ProductsDAO.h"

@interface ProductsViewController ()

@end

@implementation ProductsViewController

@synthesize productsTableView;
@synthesize producstArray;

#pragma mark IBActions.

-(void)addNewProduc:(id)sender {
    
    NewProductViewController *newProductViewController = [[NewProductViewController alloc] initWithNibName:@"NewProductViewController" bundle:nil];
    [self.navigationController pushViewController:newProductViewController animated:YES];
    
}



#pragma mark UITableView's Deletega & DataSource.

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [producstArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
    }
    
    Product *p = [producstArray objectAtIndex:[indexPath row]];
    
    cell.textLabel.text = p.name;
    cell.detailTextLabel.text = p.model;
    
    return cell;

}



#pragma mark ViewController's.

-(void)viewWillAppear:(BOOL)animated {
    
    self.producstArray = [ProductsDAO getAllProducts];
    [self.productsTableView reloadData];
    
}


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
