//
//  FirstViewController.h
//  blicket-mobile
//
//  Created by Marcus Bernales on 4/12/14.
//  Copyright (c) 2014 Marcus Bernales. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableCell.h"

@interface EventsViewController : UIViewController <UITableViewDataSource ,UITableViewDelegate, TableCellDelegate>{
    NSMutableArray *events;
}

@property (weak, nonatomic) IBOutlet UITableView *tview;
@property (strong, nonatomic) NSMutableArray *selectedEvents;

@end
