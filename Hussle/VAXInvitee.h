//
//  VAXInvitee.h
//  Hussle
//
//  Created by Adam Brailove on 7/4/14.
//  Copyright (c) 2014 Vaxis Technologies. All rights reserved.
//  Edited some comments...

#import <Foundation/Foundation.h>
#import "VAXPerson.h"


// Constants to define meeting invite response from this invitee
NSString *const MeetingInviteAccepted;
NSString *const MeetingInviteDeclined;
NSString *const MeetingInviteTentativelyAccepted;
NSString *const MeetingInviteNoResponse;

// Constants to define phase of travel for each invitee
NSString *const TripPhaseNotStarted;
NSString *const TripPhaseDeparted;
NSString *const TripPhaseArrived;
NSString *const TripPhaseUnknown;



@interface VAXInvitee : NSObject  // Should person be a separate object from invitee?

// Standard contact info
@property NSString *firstName;
@property NSString *lastName;
@property NSString *emailAddress;
@property NSString *mobilePhoneNumber;

// Meeting-specific properties of invitee
@property NSString *meetingInviteResponse;
@property NSString *tripPhase;
@property BOOL isMeetingOrganizer;

- (void)SetfirstName:(NSString *)firstName
            lastName:(NSString *)lastName
               email:(NSString *)emailAddress
         mobilePhone:(NSString *)mobilePhoneNumber;


@end
