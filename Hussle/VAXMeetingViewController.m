//
//  VAXInviteeViewController.m
//  Hussle
//
//  Created by Adam Brailove on 7/4/14.
//  Copyright (c) 2014 Vaxis Technologies. All rights reserved.
//

#import "VAXMeetingViewController.h"

// Define Cell Rows
#define kTitleCell          1
#define kDescriptionCell    2
#define kLocationCell       3

@interface VAXMeetingViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *locationTextField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation VAXMeetingViewController


// LAST ADD
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender != self.doneButton) return;
    if (self.titleTextField.text.length > 0) {
        self.meeting = [[VAXMeeting alloc] init];
        self.meeting.meetingTitle = self.titleTextField.text;
        self.meeting.meetingDescription = self.descriptionTextField.text;
        self.meeting.meetingLocation = self.locationTextField.text;
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
