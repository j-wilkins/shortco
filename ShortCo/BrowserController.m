//
//  BrowserController.m
//  ShortCo
//
//  Created by Chad Gulley on 3/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BrowserController.h"

@implementation BrowserController

- (id)init {
    self = [super initWithWindowNibName:@"Browser"];
    return self;
}

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
}

@end
