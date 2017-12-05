//
//  QYHcustomTableViewCell.h
//  TableViewlear
//
//  Created by hao on 17/9/26.
//  Copyright © 2017年 hao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QYHstatuses.h"
@interface QYHcustomTableViewCell : UITableViewCell
@property (nonatomic,strong)QYHstatuses *statuses;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *name;

@end
