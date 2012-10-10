//
//  SQLiteManager.h
//  Retailler
//
//  Created by Jorge Pardo on 10/10/12.
//  Copyright (c) 2012 Jorge Pardo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface SQLiteManager : NSObject


+(void)openConnection;
+(void)closeConnection;

+(sqlite3 *)getConnection;




@end
