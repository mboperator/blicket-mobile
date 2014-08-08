//
//  FirstViewController.m
//  blicket-mobile
//
//  Created by Marcus Bernales on 4/12/14.
//  Copyright (c) 2014 Marcus Bernales. All rights reserved.
//

#import "EventsViewController.h"
#import "eventObject.h"
#import "TableCell.h"
#import "TicketsViewController.h"

@interface EventsViewController ()

@end

@implementation EventsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    events = [[NSMutableArray alloc] initWithArray:[eventObject generateEvents]];
    [self.tview reloadData];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [events count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"EventCell";
    TableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    eventObject *event;
    event = [events objectAtIndex:indexPath.row];
    cell.label_artist.text = event.event_name;
    cell.label_venue.text = event.venue_name;
    cell.label_price.text = [event.price stringValue];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.selectedEvents addObject:[events objectAtIndex:indexPath.row]];

    [self.tview deselectRowAtIndexPath:[self.tview indexPathForSelectedRow] animated:YES];
}


@end
