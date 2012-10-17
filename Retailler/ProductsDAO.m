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

+(NSMutableArray *)getAllProducts {
    
    NSMutableArray *productsArray = [[NSMutableArray alloc] init];
    Product *product;
    
    char *sql = "Select * from Products";
    sqlite3_stmt *sqlStatement;
    
    
    if (sqlite3_prepare([SQLiteManager getConnection], sql, -1, &sqlStatement, NULL) == SQLITE_OK) {
        
        while (sqlite3_step(sqlStatement) == SQLITE_ROW) {
            
            product = [[Product alloc] init];
            product.productId = [NSNumber numberWithInt:(sqlite3_column_int(sqlStatement, 0))];
            product.name = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 1)];
            product.brand = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 2)];
            product.model = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 3)];
            product.price = [NSNumber numberWithInt:(sqlite3_column_int(sqlStatement, 4))];
            
            [productsArray addObject:product];
            
        }
        
    }
    
    [SQLiteManager closeConnection];
    
    return productsArray;
}



+(BOOL)addNewProduct:(Product *)product {
    
    BOOL success = NO;
    NSString *queryString = [NSString stringWithFormat:@"Insert into Products values (null, '%@', '%@', '%@', %@)", product.name, product.brand, product.model, product.price];
    
    const char *sql = [queryString UTF8String];
    sqlite3_stmt *insertStmt;
    
    if (sqlite3_prepare_v2([SQLiteManager getConnection], sql, -1, &insertStmt, NULL) == SQLITE_OK) {
        
        if (sqlite3_step(insertStmt) == SQLITE_DONE) {
            success = YES;
            sqlite3_finalize(insertStmt);
            
        } else {
            NSLog(@"[ProductsDAO] addNewProduct. Error with Insertion: %s", sqlite3_errmsg([SQLiteManager getConnection]));
        }
        
    } else {        
        NSLog(@"[ProductsDAO] addNewProduct. Error with Statement: %s", sqlite3_errmsg([SQLiteManager getConnection]));
    }
    

    [SQLiteManager closeConnection];
    
    return success; 
}


+(BOOL)updateProduct:(Product *)product {
    
    BOOL success = NO;
    
    NSString *queryString = [NSString stringWithFormat:@"Update Products set name='%@', brand='%@', model='%@', price='%@' where id_product=%@", product.name, product.brand, product.model, product.price, product.productId];
    
    const char *sql = [queryString UTF8String];
    sqlite3_stmt *updateStmt;
    
    
    if (sqlite3_prepare_v2([SQLiteManager getConnection], sql, -1, &updateStmt, NULL) == SQLITE_OK) {
        
        if (sqlite3_step(updateStmt) == SQLITE_DONE) {
            success = YES;
            sqlite3_finalize(updateStmt);
            
        } else {
            NSLog(@"[ProductsDAO] updateProduct. Error while Updating: %s", sqlite3_errmsg([SQLiteManager getConnection]));
        }
        
    } else {        
        NSLog(@"[ProductsDAO] updateProduct: Error with Statement: %s", sqlite3_errmsg([SQLiteManager getConnection]));
    }
    
    
    [SQLiteManager closeConnection];
    
    return success;
}


@end
