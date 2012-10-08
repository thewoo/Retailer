//
//  DetailOrderViewController.m
//  Retailler
//
//  Created by Jorge Pardo on 03/10/12.
//  Copyright (c) 2012 Jorge Pardo. All rights reserved.
//

#import "DetailOrderViewController.h"

@interface DetailOrderViewController ()

@end

@implementation DetailOrderViewController

@synthesize detailTableView;

NSArray *detailsArray;

#pragma mark UITableView's DataSource / Delegate.

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    
    
    
    
    return cell;
}




#pragma mark View Controller's.

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
