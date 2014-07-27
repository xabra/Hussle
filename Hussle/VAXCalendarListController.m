//
//  VAXCalendarListController.m
//  Hussle
//
//  Created by Adam Brailove on 7/4/14.
//  Copyright (c) 2014 Vaxis Technologies. All rights reserved.
//

#import "VAXCalendarListController.h"
#import "VAXMeeting.h"
#import "VAXEditMeetingController.h"
#import "VAXMeetingDetailController.h"

@interface VAXCalendarListController ()

@property NSMutableArray *meetings;
@property NSMutableArray *dateSections;
@end

//----------------------

@implementation VAXCalendarListController

- (IBAction)unwindToView:(UIStoryboardSegue *)segue
{
    if  ([segue.sourceViewController isKindOfClass:[VAXEditMeetingController class]]) { //If we came from the edit meeting controller...69
        VAXEditMeetingController *source = [segue sourceViewController];        // Get the view controller it is segueing FROM
        VAXMeeting *_meeting = source.meeting;      // Grab its meeting property
        if (_meeting != nil) {      // If it is returning a valid meeting
            [self.meetings addObject:_meeting]; //Add the meeting to the list of meetings in THIS view controler
            [self updateCalendarList];      //Sort and update list sections
            [self.tableView reloadData];        //Reload the data into the table
        }
    }

    if  ([segue.sourceViewController isKindOfClass:[VAXMeetingDetailController class]]) {
        [self updateCalendarList];      //Sort and update list sections
        [self.tableView reloadData];        //Reload the data into the table
    }
}


- (void)loadInitialData {
    VAXMeeting *meeting1 = [[VAXMeeting alloc] init];
    [meeting1 InitMeetingWithTitle:@"Customer B meeting"
                       Description:@"Discussion of process issues with customer B"
                         StartDate: [NSDate dateWithTimeIntervalSinceReferenceDate:692000]
                           EndDate: [NSDate dateWithTimeIntervalSinceReferenceDate:692100]
                          Location:@"Conference room 3, " ];
    [self.meetings addObject:meeting1];
    
    VAXMeeting *meeting2 = [[VAXMeeting alloc] init];
    [meeting2 InitMeetingWithTitle:@"ODI Design Review"
                       Description:@"Review of key interfaces, mechanical, controls and software"
                         StartDate: [NSDate dateWithTimeIntervalSinceReferenceDate:372000]
                           EndDate: [NSDate dateWithTimeIntervalSinceReferenceDate:372100]
                          Location:@"Owens Design, Inc" ];
    [self.meetings addObject:meeting2];
    
    VAXMeeting *meeting3 = [[VAXMeeting alloc] init];
    [meeting3 InitMeetingWithTitle:@"Mexican Happy Hour"
                       Description:@"Come enjoy happy hours at Pedro's with all your friends from work"
                         StartDate: [NSDate dateWithTimeIntervalSinceReferenceDate:28801]   //
                           EndDate: [NSDate dateWithTimeIntervalSinceReferenceDate:28900]
                          Location:@"Pedro's Mexican Restaurant" ];
    [self.meetings addObject:meeting3];
    
    VAXMeeting *meeting4 = [[VAXMeeting alloc] init];
    [meeting4 InitMeetingWithTitle:@"Fourth of July fireworks"
                       Description:@"Ohhh....Ahhh"
                         StartDate: [NSDate dateWithTimeIntervalSinceReferenceDate:383000]
                           EndDate: [NSDate dateWithTimeIntervalSinceReferenceDate:383100]
                          Location:@"Half Moon Bay" ];
    [self.meetings addObject:meeting4];
    
    VAXMeeting *meeting5 = [[VAXMeeting alloc] init];
    [meeting5 InitMeetingWithTitle:@"Strategic planning"
                       Description:@"Set high level goals for 2525"
                         StartDate: [NSDate dateWithTimeIntervalSinceReferenceDate:382000]
                           EndDate: [NSDate dateWithTimeIntervalSinceReferenceDate:382100]
                          Location:@"Tahiti Hilton" ];
    [self.meetings addObject:meeting5];
    
    VAXMeeting *meeting6 = [[VAXMeeting alloc] init];
    [meeting6 InitMeetingWithTitle:@"Dinner at the Slated Door"
                       Description:@"Get together"
                         StartDate: [NSDate dateWithTimeIntervalSinceReferenceDate:381000]
                           EndDate: [NSDate dateWithTimeIntervalSinceReferenceDate:381100]
                          Location:@"Slanted Door restaurant, San Francisco" ];
    [self.meetings addObject:meeting6];

    VAXMeeting *meeting7 = [[VAXMeeting alloc] init];
    [meeting7 InitMeetingWithTitle:@"Lunch with Geoff"
                       Description:@"Lunch with Geoff"
                         StartDate: [NSDate dateWithTimeIntervalSinceReferenceDate:695000]
                           EndDate: [NSDate dateWithTimeIntervalSinceReferenceDate:695100]
                          Location:@"Cygnet restaurant, Manchester, MA" ];
    [self.meetings addObject:meeting7];

    VAXMeeting *meeting8 = [[VAXMeeting alloc] init];
    [meeting8 InitMeetingWithTitle:@"Another Happy Hour"
                       Description:@"Beer !"
                         StartDate: [NSDate dateWithTimeIntervalSinceReferenceDate:783500]
                           EndDate: [NSDate dateWithTimeIntervalSinceReferenceDate:783600]
                          Location:@"Faultline Restaurant" ];
    [self.meetings addObject:meeting8];

    VAXMeeting *meeting9 = [[VAXMeeting alloc] init];
    [meeting9 InitMeetingWithTitle:@"Semicon/Intersolar"
                       Description:@"Leave early.  Check the program before leaving"
                         StartDate: [NSDate dateWithTimeIntervalSinceReferenceDate:928500]
                           EndDate: [NSDate dateWithTimeIntervalSinceReferenceDate:928600]
                          Location:@"Moscone Convention Center, San Francisco" ];
    [self.meetings addObject:meeting9];
    
    [self updateCalendarList];
}

-(void) updateCalendarList {
    [self sortCalendarList];
    [self updateCalendarListSections];
}

-(void) sortCalendarList{
    NSSortDescriptor *dateDescriptor = [[NSSortDescriptor alloc] initWithKey:@"meetingStart" ascending:YES ];        // Create a sort descriptor
    NSArray *sortDescriptors = @[dateDescriptor];   // Create a single element array of sort descriptors for the sort method
    NSArray *sortedMeetings = [self.meetings sortedArrayUsingDescriptors:sortDescriptors];  // Sort array by meeting date
    self.meetings = [NSMutableArray arrayWithArray:sortedMeetings];     // Copy sorted array back to meetings
}

-(void) updateCalendarListSections {
    // Date formatter
    // TODO - Cache this in a less frequently accessed place so not constantly allocating it
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle: NSDateFormatterShortStyle];
    [dateFormatter setTimeStyle: NSDateFormatterNoStyle];
    
    
    VAXMeeting *meeting = [self.meetings objectAtIndex:0];        // Find the first (Oth) meeting object...
    if(meeting){    // If it is not nil...
        [self.dateSections removeAllObjects];
        [self.dateSections addObject:[NSNumber numberWithInt:0]];    //First (0th) section starts at first (Oth)meeting
        NSString *savedFormattedDateString = [dateFormatter stringFromDate:meeting.meetingStart];     // Format the meeting's NSDate into a date-only string (no time component)
        for(int i=1; i<self.meetings.count; i++) {    // loop over all meetings in meetings array...
            meeting = [self.meetings objectAtIndex:i];      // Get the ith meeting
            NSString *newFormattedDateString = [dateFormatter stringFromDate:meeting.meetingStart];  //Get the date for the ith meeting
            if (![savedFormattedDateString isEqualToString:newFormattedDateString]) {  //If the new and saved strings are not equal...
                [self.dateSections addObject:[NSNumber numberWithInt:i]];    //First (0th) section starts at first (Oth)meeting
                savedFormattedDateString = newFormattedDateString;
            }
        }
    }
}

/*
 - (void)loadInitialData {
    VAXInvitee *invitee1 = [[VAXInvitee alloc] init];
    [invitee1 SetfirstName:@"Jack"
                  lastName:@"Yao"
                     email:@"jyao@yahoo.com"
               mobilePhone:@"+1 (408) 555-1212" ];
    [self.invitees addObject:invitee1];
    
    VAXInvitee *meeting2 = [[VAXInvitee alloc] init];
    [invitee2 SetfirstName:@"Adam"
                  lastName:@"Brailove"
                     email:@"adam.brailove@gmail.com"
               mobilePhone:@"+1 (408) 386-4771" ];
    [self.invitees addObject:invitee2];
    
    VAXInvitee *invitee3 = [[VAXInvitee alloc] init];
    [invitee3 SetfirstName:@"Mick"
                  lastName:@"Jagger"
                     email:@"mick_stones@yahoo.com"
               mobilePhone:@"+35 665 5559 1242" ];
    [self.invitees addObject:invitee3];
}
 */

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.meetings = [[NSMutableArray alloc] init];
    self.dateSections = [[NSMutableArray alloc] init];
    [self loadInitialData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    // Kludged for now
    
    NSInteger nSections = [self.dateSections count];
    //NSLog(@"--> Number of sections = %d", nSections);

    return nSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
     NSInteger cnt;
    
    if(section == [self numberOfSectionsInTableView:tableView]-1){      // If it is the LAST section the number of elements in the last section is...
        cnt = [self.meetings count] - [[self.dateSections objectAtIndex:section] intValue]; //  ... the number of meetings - index of meeting in last section
    } else {    // Otherwise the number of elements in the section is...
        cnt = (NSInteger) [[self.dateSections objectAtIndex:section+1] intValue] - [[self.dateSections objectAtIndex:section] intValue]; // the index of the next section - index of the section
    }
    
    return cnt;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Date formatter
    // TODO - Put this in a less frequently accessed place so not constantly allocating it
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle: NSDateFormatterNoStyle];       // No date
    [dateFormatter setTimeStyle: NSDateFormatterShortStyle];    // Time only
    
    // Configure the cell...
    static NSString *CellIdentifier = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSInteger cumulativeIndex = [self tableView:tableView cumulativeIndexFromIndexPath:indexPath];
    VAXMeeting *meeting = [self.meetings objectAtIndex:cumulativeIndex];        // Find the meeting object...
    NSString *formattedTimeString = [dateFormatter stringFromDate:meeting.meetingStart];     // Format the meeting's NSDate into a time string
    NSString *label = [NSString stringWithFormat:@"%@ - %@",formattedTimeString, meeting.meetingTitle ]; // Append the meeting title to the time string, with a space
    cell.textLabel.text = label;        // Stuff the string into the cell's label
    cell.detailTextLabel.text = meeting.meetingDescription;     //Stuff the meeting description into the cell's detail test
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView cumulativeIndexFromIndexPath:(NSIndexPath *)indexPath
{
    // Helper function to calculate the cumulative index into a 1-D array given an indexPath
    // Need some error trapping here...
    
    NSInteger cumIndex = 0;
    NSInteger nRowsInSection;
    
    for (NSInteger iSection=0; iSection<indexPath.section; iSection++) {// Loop over sections up to but not include the current section
        nRowsInSection = [self tableView:tableView numberOfRowsInSection:iSection];
        cumIndex += nRowsInSection;
    }
    cumIndex +=indexPath.row;   // Add the offset in the current section
    return cumIndex;
}

// ----- Setup the section header (none)
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.0;        // TODO - Not good to hard code number?
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    // Date formatter
    // TODO - Put this in a less frequently accessed place so not constantly allocating it
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle: NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle: NSDateFormatterNoStyle];
    
    NSInteger iMeeting = [[self.dateSections objectAtIndex:section] intValue];        // Find the meeting object index for the first meeting in this section...
    VAXMeeting *meeting = [self.meetings objectAtIndex:iMeeting];        // Find the meeting object...
    NSString *formattedDateString = [dateFormatter stringFromDate:meeting.meetingStart];     // Format the meeting's NSDate into a time string
    
    NSString *sectionLabelString = formattedDateString; //[NSString stringWithFormat:@"Section %d", section];
    return sectionLabelString;
}

/*
 TODO - Implement a custom section header with smaller font and smaller height
 - (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
 {
 UILabel *headerLabel = [[UILabel init] alloc];
 headerLabel.text = @"hello";
 return headerLabel;
 }
 */


// ----- Setup the section footer (no footer)
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001;    // Must be non-zero otherwise a default footer height is used
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// Preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"CalendarToMeetingDetailSegue"]) {        // If this is the segue and...
        if ([segue.destinationViewController isKindOfClass:[VAXMeetingDetailController class]]) {   // If the destination view controller is of the correct type...
            VAXMeetingDetailController* detailViewController = (VAXMeetingDetailController*)[segue destinationViewController]; // Get the destination view controller
            
            NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];  // Get the indexPath of the cell that was touched
            NSInteger index = [self tableView:self.tableView cumulativeIndexFromIndexPath:indexPath];   // Calculate the cumulative index of that row
            detailViewController.meeting = [self.meetings objectAtIndex:index];        // Find the meeting object at that index and set the destination controller to REFERENCE it.
            
        }
    } else if([segue.identifier isEqualToString:@"CalendarToEditMeetingSegue"]) {        // If this is the segue and...
        if ([segue.destinationViewController isKindOfClass:[VAXEditMeetingController class]]) {   // If the destination view controller is of the correct type...
            VAXEditMeetingController* editMeetingController = (VAXEditMeetingController*)[segue destinationViewController]; // Get the destination view controller
            //editMeetingController.isNewMeeting = YES;
            //VAXMeeting* meeting = [[VAXMeeting alloc] init];    // Allocate a new meeting object
            editMeetingController.meeting = nil; //meeting;          // Set the destination meeting to be nil
            
        }
    }
    
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    //VAXMeeting *tappedItem = [self.meetings objectAtIndex:indexPath.row];
    //tappedItem.isMeetingOrganizer = !tappedItem.isMeetingOrganizer;
    //[tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}
@end
