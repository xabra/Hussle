//
//  VAXMeetingDetailController.m
//  Hussle
//
//  Created by Adam Brailove on 7/12/14.
//  Copyright (c) 2014 Vaxis Technologies. All rights reserved.
//

#import "VAXMeetingDetailController.h"
#import "VAXEditMeetingController.h"

@interface VAXMeetingDetailController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *meetingStartLabel;
@property (weak, nonatomic) IBOutlet UILabel *meetingEndLabel; 

@end

// -----
@implementation VAXMeetingDetailController

- (IBAction)unwindToView:(UIStoryboardSegue *)segue
{
    //if ([segue.identifier isEqualToString:@"CalendarToMeetingDetailSegue"]) {
        
    //} else if ([segue.identifier isEqualToString:@"CalendarToEditMeetingSegue"]){
 
    //}
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}

-(void) updateUI
{
    // Date formatter
    // TODO - Put this in a less frequently accessed place so not constantly allocating it
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle: NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle: NSDateFormatterShortStyle];
    
    [self.titleLabel setText: self.meeting.meetingTitle];
    [self.descriptionLabel setText: self.meeting.meetingDescription];
    [self.locationLabel setText: self.meeting.meetingLocation];
    
    NSString *startDateString = [dateFormatter stringFromDate:self.meeting.meetingStart]; // Format the meeting's NSDate into a time string
    [self.meetingStartLabel setText: startDateString];
    
    NSString *endDateString = [dateFormatter stringFromDate:self.meeting.meetingEnd]; // Format the meeting's NSDate into a time string
    [self.meetingEndLabel setText: endDateString];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the destination view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"MeetingDetailToEditMeetingSegue"]) {     //If it is this particular segue and...
        if ([segue.destinationViewController isKindOfClass:[VAXEditMeetingController class]]) { // If the segue destination view controller is of the right type...
            VAXEditMeetingController* editMeetingController = (VAXEditMeetingController*)[segue destinationViewController]; // Get the destination view controller
            editMeetingController.meeting = self.meeting;   // SHALLOW COPY this meeting object (a reference to the object in the list) to the local meeting in destination
        }
    }
}


/*
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}
*/

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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





@end
