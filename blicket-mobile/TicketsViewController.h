//
//  SecondViewController.h
//  blicket-mobile
//
//  Created by Marcus Bernales on 4/12/14.
//  Copyright (c) 2014 Marcus Bernales. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FYX/FYX.h"
#import "FYX/FYXVisitManager.h"
#import "SocketIO.h"

@interface TicketsViewController : UIViewController <UITableViewDataSource ,UITableViewDelegate, FYXServiceDelegate, FYXVisitDelegate, SocketIODelegate>{
    
}
@property (strong, nonatomic) NSMutableArray *selectedEvents;
@property (nonatomic) FYXVisitManager *visitManager;
@property (strong, nonatomic) SocketIO *socketIO;
@property (weak, nonatomic) IBOutlet UILabel *range_indicator;
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UITableView *tview;
@end
