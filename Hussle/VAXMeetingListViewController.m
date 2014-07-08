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
                          Location:@"Conference room 3, " ];
    [self.meetings addObject:meeting1];
    
    VAXMeeting *meeting2 = [[VAXMeeting alloc] init];
    [meeting2 InitMeetingWithTitle:@"ODI Design Review"
                       Description:@"Review of key interfaces, mechanical, controls and software"
                          Location:@"Owens Design, Inc" ];    [self.meetings addObject:meeting2];
    
    VAXMeeting *meeting3 = [[VAXMeeting alloc] init];
    [meeting3 InitMeetingWithTitle:@"Mexican Happy Hour"
                       Description:@"Come enjoy happy hours at Pedro's with all your friends from work"
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.meetings count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Configure the cell...
    static NSString *CellIdentifier = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    VAXMeeting *meeting = [self.meetings objectAtIndex:indexPath.row];
    cell.textLabel.text = meeting.meetingTitle;
    
    /*
    if (meeting.isMeetingOrganizer) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    */
    
    return cell;
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
