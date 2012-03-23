//
//  ShortCoAppDelegate.h
//  ShortCo
//
//  Created by Chad Gulley on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ShortCoAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
- (IBAction)shortenUrl:(id)sender;
- (IBAction)openUrl:(id)sender;
@property (weak) IBOutlet NSTextField *originalUrlTextField;
@property (weak) IBOutlet NSTextField *shortenedUrlTextField;

@end
