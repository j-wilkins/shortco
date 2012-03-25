//
//  PreferenceController.m
//  ShortCo
//
//  Created by Jake Wilkins on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PreferenceController.h"

NSString * const GNROpenWithSafariKey = @"GNROpenShortWithSafari";
NSString * const GNRKeepPreviewOpen = @"GNRKeepPreviewOpen";
NSString * const GNRShortenerUrlKey = @"GNRShortenerUrl";

@implementation PreferenceController

@synthesize setShortenerUrlTextField;

+ (BOOL)preferenceOpenSafari;
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:GNROpenWithSafariKey];
}

+ (void)setPreferenceOpenSafari:(BOOL)openSafari
{
    [[NSUserDefaults standardUserDefaults]
     setBool:openSafari forKey:GNROpenWithSafariKey];
}

+ (BOOL)preferenceKeepPreviewOpen
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:GNRKeepPreviewOpen];
}

+ (void)setPreferenceKeepPreviewOpen:(BOOL)keepOpen
{
    [[NSUserDefaults standardUserDefaults]
     setBool:keepOpen forKey:GNRKeepPreviewOpen];
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
    self = [super initWithWindowNibName:@"Preference"];
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
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

-(IBAction)changeOpenWithSafari:(id)sender
{
    NSInteger state = [openWithSafariCheckbox state];
    
    [PreferenceController setPreferenceOpenSafari:state];
    
    NSLog(@"Checkbox changed %ld", state);
}

- (IBAction)changeKeepPreviewOpen:(id)sender 
{
    NSInteger state = [keepPreviewCheckbox state];
    
    [PreferenceController setPreferenceKeepPreviewOpen:state];
    
    NSLog(@"Checkbox changed %ld", state);
}

- (IBAction)updateShortenerUrl:(id)sender 
{
    NSString *url = [setShortenerUrlTextField stringValue];
    [PreferenceController setPreferenceShortenerUrl:url];
}
@end
