//
//  VAXMeetingDetailController.h
//  Hussle
//
//  Created by Adam Brailove on 7/12/14.
//  Copyright (c) 2014 Vaxis Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VAXMeeting.h"

@interface VAXMeetingDetailController : UITableViewController

@property VAXMeeting *meeting;

- (IBAction)unwindToView:(UIStoryboardSegue *)segue;

@end
