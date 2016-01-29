//
//  EventDetailTableViewController.m
//  LParty
//
//  Created by guild on 1/14/2559 BE.
//  Copyright © 2559 guild. All rights reserved.
//

#import "EventDetailTableViewController.h"
#import "InfoCustomCell.h"
#import "DateTimeCustomCell.h"
#import "ImageViewCustomCell.h"
#import "MapInfoCustomCell.h"
#import "GoingCustomCell.h"
#import "NotGoingCustomCell.h"

@interface EventDetailTableViewController ()
{
    Boolean join;
    Boolean notInterested;
}
@end

@implementation EventDetailTableViewController

@synthesize delegate = _delegate;
//@synthesize sectionEvent = _sectionEvent;
//@synthesize event = _event;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.eventDetailTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
  
    [self.event checkData];
    join = false;
    notInterested = false;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *titleForHeader = [[NSArray alloc] initWithObjects:@"Going", @"Not Going", nil];
    if (section == 0) {
        return nil;
    }else{
        return [titleForHeader objectAtIndex:section-1];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if(section == 1){
        NSLog(@"ON GOING COUNT = %lul",(unsigned long)[[self.event getMemberOnGoing] count]);
        return [[self.event getMemberOnGoing] count];
    }else if(section == 2){
        return [[self.event getMemberNotGoing] count];
    }else{
        return 4;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *returnCell;
    
    if(indexPath.section == 0){
        
        switch (indexPath.row) {
            case 0:
            {
                cellIdentifier = @"ImageViewCustomCell";
                ImageViewCustomCell *cell = (ImageViewCustomCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
                if(cell == nil){
                    NSArray *nib =[[NSBundle mainBundle] loadNibNamed:@"ImageViewCustomCell" owner:self options:nil];
                    cell = [nib objectAtIndex:0];
                }
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                cell.title.text = self.event.name;
                returnCell = cell;
            }
                break;
            case 1:
            {
                cellIdentifier = @"DateTimeCustomCell";
                DateTimeCustomCell *cell = (DateTimeCustomCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
                if(cell == nil){
                    NSArray *nib =[[NSBundle mainBundle] loadNibNamed:@"DateTimeCustomCell" owner:self options:nil];
                    cell = [nib objectAtIndex:0];
                }
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                cell.time.text = self.event.time;
                cell.date.text = self.event.date;
                
                returnCell = cell;
            }
                break;
            case 2:
            {
                cellIdentifier = @"MapInfoCustomCell";
                MapInfoCustomCell *cell = (MapInfoCustomCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
                if(cell == nil){
                    NSArray *nib =[[NSBundle mainBundle] loadNibNamed:@"MapInfoCustomCell" owner:self options:nil];
                    cell = [nib objectAtIndex:0];
                }
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                cell.host.text = self.event.host.name;
                cell.locationDetail.text = self.event.location;
                
                returnCell = cell;
            }
                break;
            case 3:
            {
                cellIdentifier = @"InfoCustomCell";
                InfoCustomCell *cell = (InfoCustomCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
                if(cell == nil){
                    NSArray *nib =[[NSBundle mainBundle] loadNibNamed:@"InfoCustomCell" owner:self options:nil];
                    cell = [nib objectAtIndex:0];
                }
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                cell.information.text = self.event.infomation;
                
                cell.joinButton.tag = indexPath.row;
                cell.notJoinButton.tag = indexPath.row;
                [cell.joinButton addTarget:self action:@selector(addCheckedMark:) forControlEvents:UIControlEventTouchUpInside];
                [cell.notJoinButton addTarget:self action:@selector(addNotInterested:) forControlEvents:UIControlEventTouchUpInside];
                
                if (join) {
                    cell.notJoinButton.hidden = true;
                }
                returnCell = cell;
            }
                break;
        }
    
    }else if(indexPath.section == 1){
        cellIdentifier = @"GoingCustomCell";
        GoingCustomCell *cell = (GoingCustomCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if(cell == nil){
            NSArray *nib =[[NSBundle mainBundle] loadNibNamed:@"GoingCustomCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        Member *memberObj = [[self.event getMemberOnGoing] objectAtIndex:indexPath.row];
        cell.name.text = memberObj.name;
        returnCell = cell;
        
    }else if(indexPath.section == 2){
        cellIdentifier = @"NotGoingCustomCell";
        NotGoingCustomCell *cell = (NotGoingCustomCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if(cell == nil){
            NSArray *nib =[[NSBundle mainBundle] loadNibNamed:@"NotGoingCustomCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        Member *memberObj = [[self.event getMemberNotGoing] objectAtIndex:indexPath.row];
        cell.name.text = memberObj.name;
        returnCell = cell;
    }
    
    return returnCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float height = 0.0;
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0) {
                height = 178;
            }else if(indexPath.row == 3){
                height = 248;
            }else{
                height = 70.0;
            }
            break;
            
        case 1:
            height = 44;
            
        case 2:
            height = 44;

    }    
    return height;
}

- (void)addCheckedMark:(id)sender
{
    //manual canceling
    if(join){
        join = false;
        self.event.checkMark = NO;
    }else{
        join = true;
        self.event.checkMark = YES;
    }
    
    
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonPosition];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
    [self.delegate addCheckPoint:self atSection:self.sectionEvent andAtEvent:self.event];
}

- (void)addNotInterested:(id)sender
{
    notInterested = true;
    [self.delegate addNotInterested:self didFinishPressedButtonNotInterest:notInterested];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
