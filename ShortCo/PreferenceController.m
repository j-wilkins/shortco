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
@synthesize openWithSafariCheckbox;
@synthesize keepPreviewCheckbox;

+ (BOOL)preferenceOpenSafari;
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:GNROpenWithSafariKey];
}

+ (void)setPreferenceOpenSafari:(BOOL)openSafari
{
    NSLog(@"setting preference open with safari %d", openSafari);
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
    NSLog(@"setting preference keepopen %d", keepOpen);
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
    
    NSLog(@"setting openWithSafariCheckbox %d",
          [PreferenceController preferenceOpenSafari]);
    NSLog(@"setting keepPreviewCheckbox %d",
          [PreferenceController preferenceKeepPreviewOpen]);
    
    [openWithSafariCheckbox setState: 
      [PreferenceController preferenceOpenSafari]];
    [keepPreviewCheckbox setState: 
     [PreferenceController preferenceKeepPreviewOpen]];
    
    [setShortenerUrlTextField setStringValue: 
      [PreferenceController preferenceShortenerUrl]];
    [self willChangeValueForKey:@"openWithSafariIsChecked"];
    openWithSafariIsChecked = [PreferenceController preferenceOpenSafari];
    [self didChangeValueForKey:@"openWithSafariIsChecked"];
}

-(IBAction)changeOpenWithSafari:(id)sender
{
    NSLog(@"open with sf cb = %@", openWithSafariCheckbox);
    NSInteger state = [openWithSafariCheckbox state];
    
    [PreferenceController setPreferenceOpenSafari:state];
    [self willChangeValueForKey:@"openWithSafariIsChecked"];
    openWithSafariIsChecked = [PreferenceController preferenceOpenSafari];
    [self didChangeValueForKey:@"openWithSafariIsChecked"];
    NSLog(@"Checkbox changeOpenWithSafari %ld", state);
}

- (IBAction)changeKeepPreviewOpen:(id)sender 
{
    NSInteger state = [keepPreviewCheckbox state];
    
    [PreferenceController setPreferenceKeepPreviewOpen:state];

    
    NSLog(@"Checkbox changeKeepPreviewOpen %ld", state);
}

- (IBAction)updateShortenerUrl:(id)sender 
{
    NSString *url = [setShortenerUrlTextField stringValue];
    NSLog(@"setting shortenerUrl to %@", url);
    [PreferenceController setPreferenceShortenerUrl:url];
}
@end
