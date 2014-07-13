//
//  VAXEditMeetingController.h
//  Hussle
//
//  Created by Adam Brailove on 7/4/14.
//  Copyright (c) 2014 Vaxis Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VAXMeeting.h"

@interface VAXEditMeetingController : UITableViewController 

@property VAXMeeting *meeting;
@property BOOL isNewMeeting;

@end
