//
//  OrdersDAO.m
//  Retailler
//
//  Created by Jorge Pardo on 11/10/12.
//  Copyright (c) 2012 Jorge Pardo. All rights reserved.
//

#import "OrdersDAO.h"
#import "SQLiteManager.h"
#import "Order.h"

@implementation OrdersDAO

+(NSMutableArray *)getAllOrders {
    
    NSMutableArray *ordersArray = [[NSMutableArray alloc] init];
    Order *order;
    
    char *sql = "Select * from Orders ORDER BY id_order desc";
    sqlite3_stmt *sqlStatement;
    
    if (sqlite3_prepare_v2([SQLiteManager getConnection], sql, -1, &sqlStatement, NULL) == SQLITE_OK) {
        
        while (sqlite3_step(sqlStatement) == SQLITE_ROW) {
            
            order = [[Order alloc] init];
            order.orderId = [NSNumber numberWithInt:(sqlite3_column_int(sqlStatement, 0))];
            
            if (sqlite3_column_text(sqlStatement, 1) != NULL) {
                order.closeDate = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 1)];
            }
            
            [ordersArray addObject:order];
        }
        
    } else {
        
        NSLog(@"[OrdersDAO] GetAllOrders - Error: %s", sqlite3_errmsg([SQLiteManager getConnection]));
    }
    
    [SQLiteManager closeConnection];
    
    NSLog(@"%@", ordersArray);
    
    return ordersArray;
}


+(NSMutableArray *)getClientsForOrderWithId:(NSNumber *)orderId {
    
    NSMutableArray *clientsIDs = [[NSMutableArray alloc] init];
    
    NSString *sqlString = [NSString stringWithFormat:@"Select distinct id_client from ClientOrders where id_order = %@", orderId];
    
    
    
    return clientsIDs;
    
}








+(NSMutableArray *)getClientsOrdersWithOrderId:(NSNumber *)orderId {
    
    NSMutableArray *clientsOrders = [[NSMutableArray alloc] init];
    
    NSString *sqlString = [NSString stringWithFormat:@"Select * from ClientOrders where id_order=%@", orderId];
    sqlite3_stmt *sqlStatement;
    
    const char *sql = [sqlString UTF8String];
    
    if (sqlite3_prepare([SQLiteManager getConnection], sql, -1, &sqlStatement, NULL) == SQLITE_OK) {
        
        
    } else {
        
        NSLog(@"[OrdersDAO] getClientsOrdersWithOrderId - Error: %s", sqlite3_errmsg([SQLiteManager getConnection]));
    }
    
    return clientsOrders;
}






































@end
