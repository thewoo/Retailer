//
//  ProductsViewController.h
//  Retailler
//
//  Created by Jorge Pardo on 01/10/12.
//  Copyright (c) 2012 Jorge Pardo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *productsTableView;
@property (nonatomic, strong) NSMutableArray *producstArray;


@end
