//
//  AppController.m
//  ShortCo
//
//  Created by Jake Wilkins on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"
#import "PreferenceController.h"

@implementation AppController

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

    [defaultValues setObject:@"http://shortener1.heroku.com" 
                      forKey:GNRShortenerUrlKey];
    
    // Register the dictionary of defaults 
    [[NSUserDefaults standardUserDefaults] registerDefaults: defaultValues]; 
    NSLog(@"registered defaults: %@", defaultValues);
}

- (IBAction)showPreferencePanel:(id)sender
{
    if (!preferenceController) {
        preferenceController = [[PreferenceController alloc] init];
    }
    NSLog(@"showing %@", preferenceController);
    [preferenceController showWindow:self];
}

@end
