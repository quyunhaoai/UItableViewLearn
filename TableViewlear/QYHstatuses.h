//
//  QYHstatuses.h
//  TableViewlear
//
//  Created by hao on 17/9/26.
//  Copyright © 2017年 hao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYHstatuses : NSObject
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *conten;
@property (nonatomic,assign) NSInteger age;
@property (nonatomic,strong) NSString *icon;
+(instancetype)initWithDictionary:(NSDictionary *)dict;
@end
