//
//  QYHTools.m
//  TableViewlear
//
//  Created by hao on 2017/11/2.
//  Copyright © 2017年 hao. All rights reserved.
//

#import "QYHTools.h"

@implementation QYHTools
+(instancetype)shareQYHTools{
    static QYHTools *tools = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        if (tools == nil) {
            tools = [[QYHTools alloc] init];
        }
        
    });
    return tools;
}
+(instancetype)shareObject{
    static QYHTools *tools = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (tools == nil) {
            tools = [[QYHTools alloc]init];
        }
    });
    return tools;
}
-(void)testAction{
    
    NSLog(@"ni ge sb");
}
@end
