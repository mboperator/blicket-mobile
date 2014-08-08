//
//  TableCell.h
//  blicket-mobile
//
//  Created by Marcus Bernales on 4/12/14.
//  Copyright (c) 2014 Marcus Bernales. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TableCellDelegate <NSObject>

@end

@interface TableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *label_artist;
@property (weak, nonatomic) IBOutlet UILabel *label_venue;
@property (weak, nonatomic) IBOutlet UILabel *label_price;

@end
