//
//  ClientOrder.h
//  Retailler
//
//  Created by Jorge Pardo on 11/10/12.
//  Copyright (c) 2012 Jorge Pardo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Client.h"

@interface ClientOrder : NSObject

@property (nonatomic, strong) NSNumber *idClientOrder;
@property (nonatomic, strong) NSString *clientName;
@property (nonatomic, strong) NSString *productName;
@property (nonatomic, strong) NSNumber *orderPrice;

@end
