//
//  VAXMeetingListViewController.m
//  Hussle
//
//  Created by Adam Brailove on 7/4/14.
//  Copyright (c) 2014 Vaxis Technologies. All rights reserved.
//

#import "VAXMeetingListViewController.h"
//#import "VAXInvitee.h"      // Delete...
#import "VAXMeeting.h"
#import "VAXMeetingViewController.h"

@interface VAXMeetingListViewController ()

@property NSMutableArray *meetings;

@end

//----------------------

@implementation VAXMeetingListViewController

- (IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    VAXMeetingViewController *source = [segue sourceViewController];
    VAXMeeting *_meeting = source.meeting;
    if (_meeting != nil) {
        [self.meetings addObject:_meeting];
        [self.tableView reloadData];
    }
}

- (void)loadInitialData {
    VAXMeeting *meeting1 = [[VAXMeeting alloc] init];
    [meeting1 InitMeetingWithTitle:@"Customer B meeting"
                       Description:@"Discussion of process issues with customer B"
                              Date: [NSDate dateWithTimeIntervalSinceReferenceDate:162000]
                          Location:@"Conference room 3, " ];
    [self.meetings addObject:meeting1];
    
    VAXMeeting *meeting2 = [[VAXMeeting alloc] init];
    [meeting2 InitMeetingWithTitle:@"ODI Design Review"
                       Description:@"Review of key interfaces, mechanical, controls and software"
                              Date: [NSDate dateWithTimeIntervalSinceReferenceDate:172000]
                          Location:@"Owens Design, Inc" ];    [self.meetings addObject:meeting2];
    
    VAXMeeting *meeting3 = [[VAXMeeting alloc] init];
    [meeting3 InitMeetingWithTitle:@"Mexican Happy Hour"
                       Description:@"Come enjoy happy hours at Pedro's with all your friends from work"
                              Date: [NSDate dateWithTimeIntervalSinceReferenceDate:182000]
                          Location:@"Pedro's Mexican Restaurant" ];
    [self.meetings addObject:meeting3];
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    // Kludged for now
    int cnt;
    if (section == 0){
        cnt = 2;
    } else {
        cnt = [self.meetings count]- (int) 2;
    }
    return cnt;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Date formatter
    // TODO - Put this in a less frequently accessed place so not constantly allocating it
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle: NSDateFormatterNoStyle];
    [dateFormatter setTimeStyle: NSDateFormatterShortStyle];
    
    // Configure the cell...
    static NSString *CellIdentifier = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSInteger cumulativeIndex = [self tableView:tableView cumulativeIndexFromIndexPath:indexPath];
    VAXMeeting *meeting = [self.meetings objectAtIndex:cumulativeIndex];        // Find the meeting object...
    NSString *formattedTimeString = [dateFormatter stringFromDate:meeting.meetingDate];     // Format the meeting's NSDate into a time string
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
    NSString *sectionLabelString = [NSString stringWithFormat:@"Section %d", section];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    //VAXMeeting *tappedItem = [self.meetings objectAtIndex:indexPath.row];
    //tappedItem.isMeetingOrganizer = !tappedItem.isMeetingOrganizer;
    //[tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}
@end
