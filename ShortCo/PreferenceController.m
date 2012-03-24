//
//  PreferenceController.m
//  ShortCo
//
//  Created by Jake Wilkins on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PreferenceController.h"

@implementation PreferenceController

+ (BOOL)preferenceOpenSafari;
{}

+ (void)setPreferenceOpenSafari:(BOOL)openSafari
{}

+ (NSString *)preferenceShortenerUrl
{}

+ (void)setPreferenceShortenerUrl:(NSString *)url
{}

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
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (IBAction)changeOpenWithSafari:(id)sender
{}

@end
