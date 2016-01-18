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
//#import "GoingCustomCell.h"

@interface EventDetailTableViewController ()

@end

@implementation EventDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.eventDetailTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    NSLog(@"check data in EventDetailTableViewController////////////////////////////////////////////////////////////");
    [self.event checkData];
    
    //self.eventDetailTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *returnCell;
    
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
            
            returnCell = cell;
        }
            break;
    }
    return returnCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
        return 177;
        
    }else if(indexPath.row == 3){
    
        return 249;
    
    }else{
        
        return 70;
    }
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
