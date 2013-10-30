//
//  VeloxTubeFolderView.mm
//  VeloxTube
//
//  Created by iHeroPhone on 11/09/13.
//  Copyright (c) 2013 iDevicesiT LLC. All rights reserved.
//  Special Thanks to " iMokhles "
//

#import "VeloxFolderViewProtocol.h"
/*Velox Folder Pugin*/


@interface VeloxTubeFolderView : UIView <VeloxFolderViewProtocol, UITextFieldDelegate> {
     UISearchBar *searchBar1;
     UITextField *textField1;
     UIWebView *webView1;
}
//Add properties, iVars here
@end

@implementation VeloxTubeFolderView

-(UIView *)initWithFrame:(CGRect)aFrame{
	self = [super initWithFrame:aFrame];
    if (self){

	     searchBar1 = [[UISearchBar alloc] init];
	[searchBar1 setText:@""];
	[searchBar1 setPrompt:@""];
	[searchBar1 setPlaceholder:@""];
	[searchBar1 setBarStyle:UIBarStyleDefault];
	[searchBar1 setTranslucent:NO];
	[searchBar1 setShowsCancelButton:NO];
	[searchBar1 setShowsBookmarkButton:NO];
	[searchBar1 setScopeButtonTitles:[NSArray arrayWithObjects:@"Scope", nil]];
	[searchBar1 setShowsScopeBar:NO];
	[searchBar1 setFrame:CGRectMake(0, 0, 320, 44)];
	[self addSubview:searchBar1];
	[searchBar1 release];
       
	textField1 = [[UITextField alloc] init];
	[textField1 setFont:[UIFont fontWithName:@"Helvetica" size:17]];
	[textField1 setText:@""];
	[textField1 setTextColor:[UIColor blackColor]];
	[textField1 setBackgroundColor:[UIColor clearColor]];
	[textField1 setTextAlignment:UITextAlignmentCenter];
	 textField1.delegate = self;
	[textField1 setPlaceholder:@"Youtube"];
	[textField1 setBorderStyle:UITextBorderStyleNone];
	[textField1 setKeyboardType:UIKeyboardTypeDefault];
	[textField1 setFrame:CGRectMake(36, 11.5, 241, 31)];
	[self addSubview:textField1];
	[textField1 release];
		//Add subviews, load data, etc.
	}
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
      if (textField == textField1) {

     [textField1 endEditing:YES];
      NSString *youtube = [textField1.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

	webView1 = [[UIWebView alloc] init];
	NSURL *webURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://m.youtube.com/results?q=%@", youtube]];
	NSURLRequest *webURLRequest = [NSURLRequest requestWithURL:webURL];
	[webView1 loadRequest:webURLRequest];
	[webView1 setScalesPageToFit:NO];
	[webView1 setFrame:CGRectMake(0, 44, 320, 372)];
	[self addSubview:webView1];
	[webView1 release];
      }
  return YES;
}

+(int)folderHeight{
	return 416; //Make folder bigger on i5 devices?
}
@end