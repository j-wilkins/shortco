//
//  ShortCoAppDelegate.m
//  ShortCo
//
//  Created by Chad Gulley on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ShortCoAppDelegate.h"
#import "BrowserController.h"

@implementation ShortCoAppDelegate
@synthesize originalUrlTextField = _originalUrlTextField;
@synthesize shortenedUrlTextField = _shortenedUrlTextField;

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)shortenUrl:(id)sender 
{
}

- (IBAction)openUrl:(id)sender 
{
    if (!browserController) {
        browserController = [[BrowserController alloc] init];
    }
    NSLog(@"showing %@", browserController);
    [browserController showWindow:self];
}

@end
