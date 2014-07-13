//
//  VAXEditMeetingController.m
//  Hussle
//
//  Created by Adam Brailove on 7/4/14.
//  Copyright (c) 2014 Vaxis Technologies. All rights reserved.
//

#import "VAXEditMeetingController.h"

// Define Cell Rows
#define kTitleCell          1
#define kDescriptionCell    2
#define kLocationCell       3

// ------------------------------------

@interface VAXEditMeetingController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *locationTextField;
@property (weak, nonatomic) IBOutlet UITextField *meetingStartTextField;
@property (weak, nonatomic) IBOutlet UITextField *meetingEndTextField;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

// ------------------------------------

@implementation VAXEditMeetingController


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    if (sender != self.doneButton) return;  
    if (self.titleTextField.text.length > 0) {
        self.meeting.meetingTitle = self.titleTextField.text;
        self.meeting.meetingDescription = self.descriptionTextField.text;
        self.meeting.meetingLocation = self.locationTextField.text;
        self.meeting.meetingStart = [NSDate dateWithTimeIntervalSinceReferenceDate: [[numberFormatter numberFromString:self.meetingStartTextField.text] doubleValue]];
        self.meeting.meetingEnd = [NSDate dateWithTimeIntervalSinceReferenceDate: [[numberFormatter numberFromString:self.meetingEndTextField.text] doubleValue]];
    }
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];    // Call super
    
    // Make this an outlet instead??
    if(self.isNewMeeting == YES){
        [self.navigationItem setTitle:@"New Meeting"];// Set the title to be New Meeting"
    } else {
        [self.navigationItem setTitle:@"Edit Meeting"];// Set the title to be New Meeting"
    }
    
    [self updateUI];
}

- (void) updateUI
{
    // Date formatter
    // TODO - Put this in a less frequently accessed place so not constantly allocating it
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle: NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle: NSDateFormatterShortStyle];
    
    // Stuff the current values from the meeting object into the text fields as starting values
    self.titleTextField.text = self.meeting.meetingTitle;
    self.descriptionTextField.text = self.meeting.meetingDescription;
    self.locationTextField.text = self.meeting.meetingLocation;

    NSString *startDateString = [dateFormatter stringFromDate:self.meeting.meetingStart]; // Format the meeting's NSDate into a time string
    self.meetingStartTextField.text = startDateString;
    
    NSString *endDateString = [dateFormatter stringFromDate:self.meeting.meetingEnd]; // Format the meeting's NSDate into a time string
    self.meetingEndTextField.text = endDateString;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    if(self.isNewMeeting == YES){
        self.meeting = [[VAXMeeting alloc] init];       // Alloc a new meeting object for the meeting property
    }

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
