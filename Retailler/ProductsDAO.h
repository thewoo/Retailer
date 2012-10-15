//
//  ProductsDAO.h
//  Retailler
//
//  Created by Jorge Pardo on 15/10/12.
//  Copyright (c) 2012 Jorge Pardo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQLiteManager.h"
#import "Product.h"

@interface ProductsDAO : NSObject


+(BOOL)addNewProduct:(Product *)product;



@end
