//
//  QYHstatuses.m
//  TableViewlear
//
//  Created by hao on 17/9/26.
//  Copyright © 2017年 hao. All rights reserved.
//

#import "QYHstatuses.h"

@implementation QYHstatuses

+(instancetype)initWithDictionary:(NSDictionary *)dict{
    QYHstatuses *statuses=[[self alloc]init];
    if (statuses) {
        [statuses setValuesForKeysWithDictionary:dict];
    }
    return  statuses;
}
@end
