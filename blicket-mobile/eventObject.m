//
//  eventObject.m
//  TeemUp
//
//  Created by Gerard Edward Gonzalez on 2/3/14.
//  Copyright (c) 2014 Gerard Edward Gonzalez. All rights reserved.
//

#import "eventObject.h"

@implementation eventObject

+ (NSMutableArray *)generateEvents{
    NSMutableArray *events = [[NSMutableArray alloc] init];
    eventObject *event = [[eventObject alloc] init];
    eventObject *event2 = [[eventObject alloc] init];
    eventObject *event3 = [[eventObject alloc] init];
    
    event.venue_name = @"The Music Box";
    event.event_name = @"James Blake";
    event.price = [[NSNumber alloc]initWithInt:35];
    NSLog(@"%@", event.event_name);
    [events addObject:event];
    
    event2.venue_name = @"Palladium";
    event2.event_name = @"Haxwell";
    event2.price = [[NSNumber alloc]initWithInt:25];
    NSLog(@"%@", event2.event_name);
    [events addObject:event2];
    
    event3.venue_name = @"Staples Center";
    event3.event_name = @"Kanye West";
    event3.price = [[NSNumber alloc] initWithInt:40];
    NSLog(@"%@", event3.event_name);
    [events addObject:event3];
    
    return events;
}

@end
