//
//  RootViewController.h
//  Purdue Dir
//
//  Created by Ryan on 3/3/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "resultsViewController.h"



@interface RootViewController : UIViewController <UITextFieldDelegate> {
	UITextField *lastNameField;
	UITextField *firstNameField;
	resultsViewController *secondView;
}
@property (nonatomic, retain) IBOutlet UITextField *lastNameField;
@property (nonatomic, retain) IBOutlet UITextField *firstNameField;
@property (nonatomic, retain) resultsViewController *secondView;
- (IBAction)searchDirectory:(id)sender;

@end
