//
//  AppDelegate.h
//  Retailler
//
//  Created by Jorge Pardo on 01/10/12.
//  Copyright (c) 2012 Jorge Pardo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) UITabBarController *tabBarController;

@property (nonatomic, strong) UINavigationController *ordersNavController;
@property (nonatomic, strong) UINavigationController *productsNavController;


+(void)checkAndCopyFileWithName:(NSString *)name ofType:(NSString *)type;



@end
