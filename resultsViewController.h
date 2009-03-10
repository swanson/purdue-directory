//
//  resultsViewController.h
//  Purdue Dir
//
//  Created by Ryan on 3/3/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "detailedViewController.h"
#import "Person.h"
#import "alphaViewController.h"

@class Person;


@interface resultsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
	NSString *lastName;
	NSString *firstName;
	NSString *error;
	//detailedViewController *detailedView;
	alphaViewController *alphaView;
	UITableView *resultsTable;
	NSMutableArray *resultsArray;
	NSMutableString *currentPropertyValue;
	Person	*aPerson;

}
- (void)getDetails:(Person *)person;
- (void) addResult:(NSObject *)person;
- (id) locationForCell:(NSUInteger) cellNum;
- (void) alertView:(UIAlertView *)alert clickedButtonAtIndex:(NSInteger)buttonIndex;

@property(nonatomic, retain) NSMutableString * currentPropertyValue;
@property(nonatomic, retain) Person *aPerson;
@property(nonatomic, retain) NSMutableArray *resultsArray;
@property(nonatomic, retain) IBOutlet UITableView *resultsTable;
@property(nonatomic, retain) NSString *lastName;
@property(nonatomic, retain) NSString *firstName;
@property(nonatomic, retain) NSString *error;
//@property(nonatomic, retain) detailedViewController *detailedView;
@property(nonatomic, retain) alphaViewController *alphaView;



@end
