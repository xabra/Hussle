//
//  VAXAttendee.h
//  Hussle
//
//  Created by Adam Brailove on 7/4/14.
//  Copyright (c) 2014 Vaxis Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VAXAttendee : NSObject


@property NSString *attendeeName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;



@end
