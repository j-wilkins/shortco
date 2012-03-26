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

+ (void)initialize
{
    // Create a dictionary
    NSMutableDictionary *defaultValues = [NSMutableDictionary dictionary];
    // Archive the color object
    //NSData *colorAsData = [NSKeyedArchiver archivedDataWithRootObject:
    //                     [NSColor yellowColor]];
    // Put defaults in the dictionary
    //    [defaultValues setObject:YES forKey:BNRTableBgColorKey]; 
    [defaultValues setObject:[NSNumber numberWithBool:YES] 
                      forKey:GNROpenWithSafariKey];
    [defaultValues setObject:[NSNumber numberWithBool:NO]
                      forKey:GNRKeepPreviewOpen];
    
    [defaultValues setObject:@"http://shortener1.heroku.com" 
                      forKey:GNRShortenerUrlKey];
    
    // Register the dictionary of defaults 
    [[NSUserDefaults standardUserDefaults] registerDefaults: defaultValues]; 
    NSLog(@"registered defaults: %@", defaultValues);
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    fetcher = [[ShortFetcher alloc] init];
}

- (IBAction)shortenUrl:(id)sender 
{
    NSString *shortUrl;
    
    NSError *error = nil;
    shortUrl = [fetcher fetchShort:[_originalUrlTextField stringValue] withError:&error];
    NSLog(@"error %@", [error description]);
    NSLog(@"our new short url is %@", shortUrl);
    [_shortenedUrlTextField setStringValue:shortUrl];
    [_shortenedUrlTextField selectText:self];  // makes for easy copy/paste
}

- (IBAction)openUrl:(id)sender 
{
    if (!browserController) {
        browserController = [[BrowserController alloc] init];
    }
    NSLog(@"showing %@", browserController);
    [browserController showWindow:self];
}

- (IBAction)showPreferencePanel:(id)sender
{
    if (!preferenceController) {
        NSLog(@"createing new preference controller");
        preferenceController = [[PreferenceController alloc] init];
    }
    NSLog(@"showing %@", preferenceController);
    [preferenceController showWindow:self];
}

@end
