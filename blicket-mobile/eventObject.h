//
//  eventObject.h
//  TeemUp
//
//  Created by Gerard Edward Gonzalez on 2/3/14.
//  Copyright (c) 2014 Gerard Edward Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface eventObject : NSObject

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *event_name;
@property (nonatomic, strong) NSString *venue_name;
@property (nonatomic, strong) NSNumber *price;
@property double latitude;
@property double longitude;

+ (NSMutableArray *) generateEvents;

@end
