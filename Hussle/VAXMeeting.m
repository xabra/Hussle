//
//  VAXMeeting.m
//  Hussle
//
//  Created by Adam Brailove on 7/6/14.
//  Copyright (c) 2014 Vaxis Technologies. All rights reserved.
//

#import "VAXMeeting.h"

@implementation VAXMeeting


- (void) InitMeetingWithTitle: (NSString *) meetingTitle
                  Description: (NSString *) meetingDescription
                    StartDate: (NSDate *) meetingStart
                      EndDate: (NSDate *) meetingEnd
                     Location: (NSString *) meetingLocation {
    self.meetingTitle = meetingTitle;
    self.meetingDescription = meetingDescription;
    self.meetingStart = meetingStart;
    self.meetingEnd = meetingEnd;
    self.meetingLocation = meetingLocation;
    
}

@end
