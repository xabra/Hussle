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
                         //Date: (NSDate *) meetingDate
                     Location: (NSString *) meetingLocation {
    self.meetingTitle = meetingTitle;
    self.meetingDescription = meetingDescription;
    //self.meetingDate = meetingDate;
    self.meetingLocation = meetingLocation;
    
}

@end
