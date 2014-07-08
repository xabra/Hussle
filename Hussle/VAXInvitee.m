//
//  VAXInvitee.m
//  Hussle
//
//  Created by Adam Brailove on 7/4/14.
//  Copyright (c) 2014 Vaxis Technologies. All rights reserved.
//

#import "VAXInvitee.h"

@implementation VAXInvitee

- (void)SetfirstName:(NSString *)firstName
            lastName:(NSString *)lastName
               email:(NSString *)emailAddress
         mobilePhone:(NSString *)mobilePhoneNumber {
    self.firstName=firstName;
    self.lastName = lastName;
    self.emailAddress = emailAddress;
    self.mobilePhoneNumber = mobilePhoneNumber;
    self.meetingInviteResponse = MeetingInviteNoResponse;
    self.tripPhase = TripPhaseNotStarted;
    self.isMeetingOrganizer = NO;
}

@end
