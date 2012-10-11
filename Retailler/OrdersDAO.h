//
//  OrdersDAO.h
//  Retailler
//
//  Created by Jorge Pardo on 11/10/12.
//  Copyright (c) 2012 Jorge Pardo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQLiteManager.h"

@interface OrdersDAO : NSObject


+(NSMutableArray *)getAllOrders;
+(NSMutableArray *)getClientsOrdersWithOrderId:(NSNumber *)orderId;
+(NSMutableArray *)getClientsForOrderWithId:(NSNumber *)orderId;


@end
