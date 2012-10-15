//
//  ProductsDAO.m
//  Retailler
//
//  Created by Jorge Pardo on 15/10/12.
//  Copyright (c) 2012 Jorge Pardo. All rights reserved.
//

#import "ProductsDAO.h"
#import "Product.h"
#import "SQLiteManager.h"

@implementation ProductsDAO


+(BOOL)addNewProduct:(Product *)product {
    
    BOOL succes = NO;
    NSString *queryString = [NSString stringWithFormat:@"Insert into Products values (null, '%@', '%@', '%@', '%@')", product.name, product.brand, product.model, product.price];
    
    const char *sql = [queryString UTF8String];
    sqlite3_stmt *sqlStatement;
    
    if (sqlite3_prepare([SQLiteManager getConnection], sql, -1, &sqlStatement, NULL) == SQLITE_OK) {
        succes = YES;
    
    } else {
        NSLog(@"[ProductsDAO] addNewProduct. Error: %s", sqlite3_errmsg([SQLiteManager getConnection]));
    }
    
    return succes;
}


@end
