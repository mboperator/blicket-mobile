//
//  SecondViewController.m
//  blicket-mobile
//
//  Created by Marcus Bernales on 4/12/14.
//  Copyright (c) 2014 Marcus Bernales. All rights reserved.
//

#import "TicketsViewController.h"
#import "EventsViewController.h"
#import "eventObject.h"
#import "FYX/FYX.h"
#import "FYX/FYXSightingManager.h"
#import "FYX/FYXVisitManager.h"

@interface TicketsViewController ()
@end

@implementation TicketsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [FYX startService:self];
    self.visitManager = [FYXVisitManager new];
    self.visitManager.delegate = self;
    self.selectedEvents = [eventObject generateEvents];
    [self.selectedEvents removeObjectAtIndex:0];
    
    NSMutableDictionary *options = [NSMutableDictionary new];
    [options setObject:[NSNumber numberWithInt:3] forKey:FYXVisitOptionDepartureIntervalInSecondsKey];
    [options setObject:[NSNumber numberWithInt:FYXSightingOptionSignalStrengthWindowNone] forKey:FYXSightingOptionSignalStrengthWindowKey];
    [options setObject: [NSNumber numberWithInt: -55] forKey: FYXVisitOptionArrivalRSSIKey];
    [options setObject: [NSNumber numberWithInt: -60] forKey: FYXVisitOptionDepartureRSSIKey];

    self.socketIO = [[SocketIO alloc] initWithDelegate:self];
    [self.socketIO connectToHost:@"dev.itsmarc.us" onPort:3000];
    [self.visitManager startWithOptions:options];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark- Gimbal

- (void)serviceStarted
{
    // this will be invoked if the service has successfully started
    // bluetooth scanning will be started at this point.
    NSLog(@"FYX Service Successfully Started");
}

- (void)startServiceFailed:(NSError *)error
{
    // this will be called if the service has failed to start
    NSLog(@"%@", error);
}

- (void)didArrive:(FYXVisit *)visit;
{
    // this will be invoked when an authorized transmitter is sighted for the first time
//    NSLog(@"I arrived at a Gimbal Beacon!!! %@", visit.transmitter.name);
}
- (void)receivedSighting:(FYXVisit *)visit updateTime:(NSDate *)updateTime RSSI:(NSNumber *)RSSI;
{
    // this will be invoked when an authorized transmitter is sighted during an on-going visit
//    NSLog(@"I received a sighting!!! %@", visit.transmitter.name);
//        NSLog(@"We're in scanning range");
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    
        if ([visit.transmitter.name isEqualToString:@"Kanye"]) {
            self.range_indicator.text = @"Ticket Redeemed";
            self.view.backgroundColor = [UIColor greenColor];
            [dict setObject: @"Kanye" forKey:@"message"];

        }
        else if ([visit.transmitter.name isEqualToString:@"Haxwell"]){
            self.range_indicator.text = @"Ticket Redeemed";
            self.view.backgroundColor = [UIColor greenColor];
            [dict setObject: @"Haxwell" forKey:@"message"];

        }
        else if ([visit.transmitter.name isEqualToString:@"James"]){
            self.range_indicator.text = @"Ticket Not Available";
            self.view.backgroundColor = [UIColor yellowColor];
            [dict setObject: @"James" forKey:@"message"];

        }
    
        self.range_indicator.textColor = [UIColor whiteColor];
        
        [self.socketIO sendEvent:@"message_to_server" withData:dict];
//        [dict setObject: visit.transmitter.name forKey: @"message"];
//        [self.socketIO sendEvent:@"message_to_server" withData:dict];

}
- (void)didDepart:(FYXVisit *)visit;
{
    // this will be invoked when an authorized transmitter has not been sighted for some time
//    NSLog(@"I left the proximity of a Gimbal Beacon!!!! %@", visit.transmitter.name);
//    NSLog(@"I was around the beacon for %f seconds", visit.dwellTime);
    self.range_indicator.text = @"Out of scanning range";
    self.range_indicator.textColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor redColor];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setObject: @"no" forKey:@"message"];
    
    
    [self.socketIO sendEvent:@"message_to_server" withData:dict];

}

#pragma mark- Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.selectedEvents count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ticketCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    eventObject *event;
    event = [self.selectedEvents objectAtIndex:indexPath.row];
    cell.textLabel.text = event.event_name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self.tview deselectRowAtIndexPath:[self.tview indexPathForSelectedRow] animated:YES];
}



@end
