//
//  VAXMeeting.h
//  Hussle
//
//  Created by Adam Brailove on 7/6/14.
//  Copyright (c) 2014 Vaxis Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VAXMeeting : NSObject

@property NSString *meetingTitle;
@property NSString *meetingDescription;
@property NSDate *meetingDate;
@property NSString *meetingLocation;    //Could use something better?
@property (strong) NSMutableArray *inviteeList;

- (void) InitMeetingWithTitle: (NSString *) meetingTitle
                  Description: (NSString *) meetingDescription
                         Date: (NSDate *) meetingDate
                     Location: (NSString *) meetingLocation;

@end
