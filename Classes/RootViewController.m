//
//  RootViewController.m
//  Purdue Dir
//
//  Created by Ryan on 3/3/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "RootViewController.h"
#import "Purdue_DirAppDelegate.h"


@implementation RootViewController
@synthesize lastNameField;
@synthesize firstNameField;
@synthesize secondView;


- (void)viewDidLoad {
	//set textField delegates to self so keyboard goes away when we hit Done...dont ask...
	lastNameField.delegate=self;
	firstNameField.delegate=self;
	[super viewDidLoad];

}



- (void)viewWillAppear:(BOOL)animated {
	//make sure the title is correct, since we change it when we push resultsView
	self.title=@"Purdue Directory";
    [super viewWillAppear:animated];
}

/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];



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
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
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


- (void)dealloc {
	[lastNameField release];
	[firstNameField release];
	[secondView release];
    [super dealloc];
}

- (IBAction)searchDirectory:(id)sender {
	//get search data from the textFields
	NSString *fn = firstNameField.text;
	NSString *ln = lastNameField.text;
	
	//call constructor for resultsView
	secondView = [[resultsViewController alloc] initWithNibName:@"resultsView" bundle:[NSBundle mainBundle]];
	
	//set attributes for php query
	secondView.lastName = ln;
	secondView.firstName = fn;
	
	Purdue_DirAppDelegate *delegate = [[UIApplication sharedApplication] delegate];	
	//temporarily change title, easy way to change backNavbutton
	self.title=@"Search";
	
	//push resultsView onto stack
	[delegate.navigationController pushViewController:secondView animated:YES];
	[fn release];
	[ln release];
	
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
	//more random keyboard behavior methods...dont ask...
    if (theTextField == lastNameField) {		
        [lastNameField resignFirstResponder];
    }
	if (theTextField == firstNameField) {		
        [firstNameField resignFirstResponder];
    }	
    return YES;
	
}


@end

