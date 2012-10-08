//
//  DetailOrderViewController.h
//  Retailler
//
//  Created by Jorge Pardo on 03/10/12.
//  Copyright (c) 2012 Jorge Pardo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailOrderViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *detailTableView;

@end
