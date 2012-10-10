//
//  SQLiteManager.m
//  Retailler
//
//  Created by Jorge Pardo on 10/10/12.
//  Copyright (c) 2012 Jorge Pardo. All rights reserved.
//

#import "SQLiteManager.h"

sqlite3 *connection = nil;

@implementation SQLiteManager


+(void)openConnection {
    
    NSString *roothPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *dataBasePath = [roothPath stringByAppendingPathComponent:@"RetailerDB"];
    
    if (sqlite3_open([dataBasePath UTF8String], &connection) != SQLITE_OK) {
        NSLog(@"[SQLiteManager] No se pudo hacer la conexión con la base de datos: RetailerDB");
    }
}

+(void)closeConnection {
    
    if (connection != nil) {
        sqlite3_close(connection);
        connection = nil;
    }
}





+(sqlite3 *)getConnection {    
    
    if (connection == nil) {
        [self openConnection];
    }
    
    return  connection;
    
}

@end
