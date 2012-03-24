//
//  PreferenceController.h
//  ShortCo
//
//  Created by Jake Wilkins on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PreferenceController : NSWindowController
{
    IBOutlet NSButton *checkbox;
    //IBOutlet NSTextField *setShortenerUrlField;
}

+ (BOOL)preferenceOpenSafari;
+ (void)setPreferenceOpenSafari:(BOOL)openSafari;
+ (NSString *)preferenceShortenerUrl;
+ (void)setPreferenceShortenerUrl:(NSString *)url;

- (IBAction)changeOpenWithSafari:(id)sender;

//@property (assign) IBOutlet NSTextField *setShortenerUrlField;

@end
