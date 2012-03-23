//
//  PreferenceControler.m
//  ShortCo
//
//  Created by Jake Wilkins on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PreferenceController.h"

NSString * const GNROpenWithSafariKey = @"GNROpenShortWithSafari";
NSString * const GNRShortenerUrlKey = @"GNRShortenerUrl";

@implementation PreferenceController

@synthesize setShortenerUrlField;

+ (BOOL)preferenceOpenSafari
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:GNROpenWithSafariKey];
}

+ (void)setPreferenceOpenSafari:(BOOL)openSafari
{
    [[NSUserDefaults standardUserDefaults] setBool:openSafari
                                            forKey:GNROpenWithSafariKey];
}

+ (NSString *)preferenceShortenerUrl
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults stringForKey:GNRShortenerUrlKey];
}

+ (void)setPreferenceShortenerUrl:(NSString *)url
{
    [[NSUserDefaults standardUserDefaults] setObject:url 
                                              forKey:GNRShortenerUrlKey];
}

- (id)init {
    self = [super initWithWindowNibName:@"Preferences"];
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
    
    [checkbox setState: [PreferenceController preferenceOpenSafari]];
    [setShortenerUrlField setStringValue: [PreferenceController preferenceShortenerUrl]];
}

- (IBAction)changeOpenWithSafari:(id)sender
{
    NSInteger state = [checkbox state];

    [PreferenceController setPreferenceOpenSafari:state];

    NSLog(@"Checkbox changed %ld", state);
}

- (IBAction)changeShortenerUrl:(id)sender
{
    NSString *url = [setShortenerUrlField stringValue];
    [PreferenceController setPreferenceShortenerUrl:url];
    //NSString *url = [shortenerUrl
}

@end
