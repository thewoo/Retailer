//
//  Product.h
//  Retailler
//
//  Created by Jorge Pardo on 08/10/12.
//  Copyright (c) 2012 Jorge Pardo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (nonatomic, strong) NSNumber *id_product;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *brand;
@property (nonatomic, strong) NSString *model;
@property (nonatomic, strong) NSNumber *price;


@end
