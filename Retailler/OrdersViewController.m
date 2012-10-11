//
//  OrdersViewController.m
//  Retailler
//
//  Created by Jorge Pardo on 01/10/12.
//  Copyright (c) 2012 Jorge Pardo. All rights reserved.
//

#import "OrdersViewController.h"
#import "DetailOrderViewController.h"
#import "OrdersDAO.h"
#import "Order.h"

@interface OrdersViewController ()

@end
NSArray *fechas;

@implementation OrdersViewController

@synthesize ordersTableView;
@synthesize ordersArray;


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
    return [ordersArray count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    Order *order = [ordersArray objectAtIndex:[indexPath row]];
    NSString *cellText;
    
    if ((NSNull *)order.closeDate == [NSNull null] || [order.closeDate length] == 0) {
        cellText = [order.orderId stringValue];
    
    } else {
        cellText = order.closeDate;
    }
    
    cell.textLabel.text = cellText;
    
    return cell;
}

#pragma mark ViewController's.

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.ordersArray = [OrdersDAO getAllOrders];
    
    fechas = [[NSArray alloc] initWithObjects:@"17/12/2012", @"01 de Septiembre 2012", @"18 de Agosto 1992", nil];
    
    UIBarButtonItem *newOrderButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(newOrder:)];
    self.navigationItem.rightBarButtonItem = newOrderButton;
    
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
