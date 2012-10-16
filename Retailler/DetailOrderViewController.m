//
//  DetailOrderViewController.m
//  Retailler
//
//  Created by Jorge Pardo on 03/10/12.
//  Copyright (c) 2012 Jorge Pardo. All rights reserved.
//

#import "DetailOrderViewController.h"
#import "Product.h"

@interface DetailOrderViewController ()

@end

@implementation DetailOrderViewController

@synthesize detailTableView;
@synthesize footerView;

NSMutableArray *detailsArray;
NSMutableDictionary *detailsDictionary;


#pragma mark Actions.

-(void)addProduct:(UIBarButtonItem *)barButton {
    
    NSLog(@"Add");
}



#pragma mark UITableView's DataSource / Delegate.

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [detailsArray count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    NSMutableDictionary *dict = [detailsArray objectAtIndex:section];
        
    return [[dict objectForKey:@"Productos"] count];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    NSMutableDictionary *dict = [detailsArray objectAtIndex:[indexPath section]];
    
    Product *p = [[dict objectForKey:@"Productos"] objectAtIndex:[indexPath row]];
    
    cell.textLabel.text = p.name;
    cell.textLabel.textAlignment = NSTextAlignmentRight;
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
        
    NSMutableDictionary *dict = [detailsArray objectAtIndex:section];    
    return [dict objectForKey:@"Nombre"];
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    if (section == [detailsArray count] -1) {
        return self.footerView;
    
    } else {
        return nil;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    if (section == [detailsArray count] -1) {
        return self.footerView.frame.size.height;

    } else {
        return 0.0;
    }
    
}

#pragma mark View Controller's.

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *addProduct = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addProduct:)];
    self.navigationItem.rightBarButtonItem = addProduct;

    
    
    detailsArray = [[NSMutableArray alloc] init];
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSMutableDictionary *diccionario = [[NSMutableDictionary alloc] init];
    
    Product *p = [[Product alloc] init];
    p.productId = [NSNumber numberWithInt:00001];
    p.name = @"MacBook Pro";
    
    [array addObject:p];
    
    p = [[Product alloc] init];
    p.productId = [NSNumber numberWithInt:00002];
    p.name = @"iPhone 5";
    
    [array addObject:p];
    
    [diccionario setObject:array forKey:@"Productos"];
    [diccionario setObject:[NSString stringWithFormat:@"Jorge"] forKey:@"Nombre"];
    
    [detailsArray addObject:diccionario];
    
    
    array = [[NSMutableArray alloc] init];
    diccionario = [[NSMutableDictionary alloc] init];

    
    p = [[Product alloc] init];
    p.productId = [NSNumber numberWithInt:00003];
    p.name = @"iPad";
    
    [array addObject:p];
    
    [diccionario setObject:array forKey:@"Productos"];
    [diccionario setObject:[NSString stringWithFormat:@"María"] forKey:@"Nombre"];
    
    [detailsArray addObject:diccionario];
    
    
    
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
