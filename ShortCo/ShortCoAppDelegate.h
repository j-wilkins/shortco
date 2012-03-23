//
//  ShortCoAppDelegate.h
//  ShortCo
//
//  Created by Chad Gulley on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ShortFetcher.h"

@interface ShortCoAppDelegate : NSObject <NSApplicationDelegate> {
    ShortFetcher *fetcher;
}

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *originalUrlTextField;
@property (weak) IBOutlet NSTextField *shortenedUrlTextField;

- (IBAction)shortenUrl:(id)sender;
- (IBAction)openUrl:(id)sender;

@end
