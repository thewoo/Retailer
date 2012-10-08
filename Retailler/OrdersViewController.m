//
//  OrdersViewController.m
//  Retailler
//
//  Created by Jorge Pardo on 01/10/12.
//  Copyright (c) 2012 Jorge Pardo. All rights reserved.
//

#import "OrdersViewController.h"
#import "DetailOrderViewController.h"

@interface OrdersViewController ()

@end

NSArray *fechas;

@implementation OrdersViewController

@synthesize ordersTableView;


#pragma mark Actions.

-(void)newOrder:(UIBarButtonItem *)button {
    
    DetailOrderViewController *detailOrderViewController = [[DetailOrderViewController alloc] initWithNibName:@"DetailOrderViewController" bundle:nil];
    [self.navigationController pushViewController:detailOrderViewController animated:YES];
    
}


#pragma mark UITableView's Delegate & DataSource.

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [fechas objectAtIndex:[indexPath row]];
    
    return cell;
}

#pragma mark ViewController's.

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    fechas = [[NSArray alloc] initWithObjects:@"17/12/2012", @"01 de Septiembre 2012", @"18 de Agosto 1992", nil];
    
    UIBarButtonItem *newOrderButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(newOrder:)];
    self.navigationItem.rightBarButtonItem = newOrderButton;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
    }
    return self;
}

@end
