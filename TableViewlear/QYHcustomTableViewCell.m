//
//  QYHcustomTableViewCell.m
//  TableViewlear
//
//  Created by hao on 17/9/26.
//  Copyright © 2017年 hao. All rights reserved.
//

#import "QYHcustomTableViewCell.h"

@implementation QYHcustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    self.layoutMargins = UIEdgeInsetsZero;
    
}
-(void)setFrame:(CGRect)frame
{
    frame.size.height -= 1;
    [super setFrame:frame];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setStatuses:(QYHstatuses *)statuses{
    self.name.text = statuses.name;
    self.content.text = statuses.conten;
}
@end
