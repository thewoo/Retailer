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
    NSString *queryString = [NSString stringWithFormat:@"Insert into Products values (null, '%@', '%@', '%@', %@)", product.name, product.brand, product.model, product.price];
    
    const char *sql = [queryString UTF8String];
    sqlite3_stmt *insertStmt;
    
    if (sqlite3_prepare_v2([SQLiteManager getConnection], sql, -1, &insertStmt, NULL) != SQLITE_OK) {
        NSLog(@"[ProductsDAO] addNewProduct. Error with Statement: %s", sqlite3_errmsg([SQLiteManager getConnection]));
    }
    
    if (sqlite3_step(insertStmt) == SQLITE_DONE) {
        succes = YES;
        sqlite3_finalize(insertStmt);
        
    } else {
        NSLog(@"[ProductsDAO] addNewProduct. Error with Insertion: %s", sqlite3_errmsg([SQLiteManager getConnection]));
    }
    
    

    [SQLiteManager closeConnection];
    
    return succes;
}


@end
