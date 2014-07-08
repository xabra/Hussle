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
NSString *const TripStateNotStarted;
NSString *const TripStateDeparted;
NSString *const TripStateArrived;
NSString *const TripStateUnknown;



@interface VAXInvitee : NSObject  // Should person be a separate object from invitee?

// Standard contact info
@property NSString *firstName;
@property NSString *lastName;
@property NSString *emailAddress;
@property NSString *mobilePhoneNumber;

// Meeting-specific properties of invitee
@property NSString *meetingInviteResponse;
@property NSString *travelPhase;
@property BOOL isMeetingOrganizer;

@end
