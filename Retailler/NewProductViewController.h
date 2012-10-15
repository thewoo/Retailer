//
//  NewProductViewController.h
//  Retailler
//
//  Created by Jorge Pardo on 15/10/12.
//  Copyright (c) 2012 Jorge Pardo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewProductViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *nameTextField;
@property (nonatomic, strong) IBOutlet UITextField *brandTextField;
@property (nonatomic, strong) IBOutlet UITextField *modelTextField;
@property (nonatomic, strong) IBOutlet UITextField *priceTextField;

@property (nonatomic, strong) IBOutlet UIButton *addProductButton;


-(IBAction)addProductButtonPressed:(id)sender;

@end
