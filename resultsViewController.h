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


@interface resultsViewController : UIViewController {
	NSString *lastName;
	NSString *firstName;
	UIWebView *webView;
	detailedViewController *detailedView;
	UIButton *button;

}
- (IBAction)getDetails:(id)sender;

@property(nonatomic, retain) IBOutlet UIButton *button;
@property(nonatomic, retain) NSString *lastName;
@property(nonatomic, retain) NSString *firstName;
@property(nonatomic, retain) IBOutlet UIWebView *webView;
@property(nonatomic, retain) detailedViewController *detailedView;



@end
