//
//  resultsViewController.m
//  Purdue Dir
//
//  Created by Ryan on 3/3/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "resultsViewController.h"
#import "Purdue_DirAppDelegate.h"
#import "PersonCell.h"
#import "Person.h"


@implementation resultsViewController
@synthesize firstName;
@synthesize lastName;
@synthesize alphaView;
@synthesize resultsTable;
@synthesize	resultsArray, aPerson, currentPropertyValue;



// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        //set navbar title
		self.title = @"Results";

    }
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	//generate php query string
	self.resultsArray = [NSMutableArray array];
	self.currentPropertyValue=nil;
	NSString *query = [[NSString alloc] initWithFormat:@"http://web.ics.purdue.edu/~mdswanso/dir.php?ln=%@&fn=%@", lastName, firstName];
	NSURL *url = [NSURL URLWithString:query];
		
	NSXMLParser * parser = [NSXMLParser alloc];
	[parser setDelegate:self];
	[parser initWithContentsOfURL:url];
		
	if([parser parse])
		NSLog(@"Parsing was successful");
	else
		NSLog(@"Parsing was unsuccessful");
		
	[parser dealloc];
		
    [super viewDidLoad];
}


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

- (void)getDetails:(Person *)person{
	//call detailedView constructor, which will call Person constructor for us
	alphaView = [[alphaViewController alloc] initWithNibName:@"alphaView" bundle:[NSBundle mainBundle]];
	
	//TODO: fix this when we add the parser!!
	//fill in the person attributes to display
	alphaView.person.name=[person.name capitalizedString];
	alphaView.person.email=person.email;
	alphaView.person.phone=person.phone;
	alphaView.person.addr=[person.addr capitalizedString];
	alphaView.person.univ=[person.univ capitalizedString];	
	//push the detailed contact info view onto the stack
	Purdue_DirAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
	[delegate.navigationController pushViewController:alphaView animated:YES];
}

- (void) addResult:(NSObject *)person {
	[self.resultsArray addObject:person];
}

- (id) locationForCell:(NSUInteger) cellNum {
	return [self.resultsArray objectAtIndex:cellNum];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   /* geowikiAppDelegate * appDelegate = (geowikiAppDelegate *) [[UIApplication sharedApplication] delegate];
    return [appDelegate numberOfLocations]; */
	
	//
	//return 2;
	return [resultsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
   // geowikiAppDelegate * appDelegate = (geowikiAppDelegate *) [[UIApplication sharedApplication] delegate];
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[PersonCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
	}
    
	NSString * test = [(Person *)[self locationForCell:indexPath.row] getName];
	test = [test capitalizedString];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	//cell.text = [NSString stringWithFormat:@"%@ %g", locationTitle, [(Location *)[appDelegate locationForCell:indexPath.row] getDistance]];
    cell.text = [NSString stringWithFormat:@"%@", test];
	// Set up the cell
    return cell;

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	/*
    // Navigation logic -- create and push a new view controller
	
	geowikiViewController * viewController = [geowikiViewController sharedInstance];
	geowikiAppDelegate * appDelegate = (geowikiAppDelegate *) [[UIApplication sharedApplication] delegate];
	[appDelegate setMode:geoLocationBased];
	[viewController loadURL:[(Location *)[appDelegate locationForCell:indexPath.row] getURL]];
	[[self navigationController] pushViewController:viewController animated:YES];	
	
	
	*/
	[self getDetails:(Person *)[self locationForCell:indexPath.row]];
}


- (void)parserDidStartDocument:(NSXMLParser *)parser {
	//NSLog(@"Parsing started");
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
	//NSLog(@"Parsing ended");
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
	
	// why is this done...
	if(qualifiedName) elementName = qualifiedName;
	
	if([elementName isEqualToString:@"person"])
	{
		self.aPerson = [[Person alloc] init];
		[self addResult:aPerson];
		//[[(id)[UIApplication sharedApplication] delegate] performSelectorOnMainThread:@selector(addLocation:) withObject:self.currentLocation waitUntilDone:YES];
		//[(geowikiAppDelegate *)[[UIApplication sharedApplication] delegate] addLocation:self.currentLocation];
		
		// from seismicxml
		//[(id)[[UIApplication sharedApplication] delegate] performSelectorOnMainThread:@selector(addToEarthquakeList:) withObject:self.currentEarthquakeObject waitUntilDone:YES];
        //return;
	}
	
	// prepare the values for setting
	// self.currentPropertyValue = [NSMutableString string];
	else if([elementName isEqualToString:@"name"])
		self.currentPropertyValue = [NSMutableString string];
	else if([elementName isEqualToString:@"email"])
		self.currentPropertyValue = [NSMutableString string];
	else if([elementName isEqualToString:@"phone"])
		self.currentPropertyValue = [NSMutableString string];
	else if([elementName isEqualToString:@"addr"])
		self.currentPropertyValue = [NSMutableString string];
	else if([elementName isEqualToString:@"univ"])
		self.currentPropertyValue = [NSMutableString string];
	else currentPropertyValue = nil;
	
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	
	
	if(qName) elementName = qName;
	
	NSLog(currentPropertyValue);
	NSLog(@"NULL?");
	// set the values of the location
	if([elementName isEqualToString:@"name"])
		self.aPerson.name=self.currentPropertyValue;
		//[self.aPerson setName:self.currentPropertyValue];
		//[self.currentLocation setTitle:self.currentPropertyValue];
	else if([elementName isEqualToString:@"email"])
		aPerson.email=self.currentPropertyValue;
		//[self.currentLocation setURL:[NSURL URLWithString:self.currentPropertyValue]];
	else if([elementName isEqualToString:@"phone"])
		aPerson.phone=self.currentPropertyValue;
		//[self.currentLocation setLatitude:[self.currentPropertyValue doubleValue]];
	else if([elementName isEqualToString:@"addr"])
		aPerson.addr=self.currentPropertyValue;
		//[self.currentLocation setLongitude:[self.currentPropertyValue doubleValue]];
	else if([elementName isEqualToString:@"univ"])
		aPerson.univ=self.currentPropertyValue;
		//[self.currentLocation setDistance:[self.currentPropertyValue doubleValue]];
	
	 
}


- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
	// handle parsing error
	NSLog(@"parse error: parsing aborted");
	[parser abortParsing];
}

- (void)parser:(NSXMLParser *)parser validationErrorOccurred:(NSError *)validError {
	// handle validation error
	NSLog(@"validation error: parsing aborted");
	[parser abortParsing];
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
   if (self.currentPropertyValue) {
        // If the current element is one whose content we care about, append 'string'
        // to the property that holds the content of the current element.
        [self.currentPropertyValue appendString:string];
	}

}


- (void)dealloc {
	[firstName release];
	[lastName release];
	[alphaView release];
    [super dealloc];
}


@end
