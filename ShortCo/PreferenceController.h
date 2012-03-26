//
//  PreferenceController.h
//  ShortCo
//
//  Created by Jake Wilkins on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

extern NSString * const GNROpenWithSafariKey;
extern NSString * const GNRKeepPreviewOpen;
extern NSString * const GNRShortenerUrlKey;

@interface PreferenceController : NSWindowController
{
    IBOutlet NSButton *openWithSafariCheckbox;
    IBOutlet NSButton *keepPreviewCheckbox;
    //IBOutlet NSTextField *setShortenerUrlField;
}

+ (BOOL)preferenceOpenSafari;
+ (void)setPreferenceOpenSafari:(BOOL)openSafari;
+ (BOOL)preferenceKeepPreviewOpen;
+ (void)setPreferenceKeepPreviewOpen:(BOOL)keepOpen;
+ (NSString *)preferenceShortenerUrl;
+ (void)setPreferenceShortenerUrl:(NSString *)url;

- (IBAction)changeOpenWithSafari:(id)sender;
- (IBAction)changeKeepPreviewOpen:(id)sender;
- (IBAction)updateShortenerUrl:(id)sender;

//@property (assign) IBOutlet NSTextField *setShortenerUrlField;
@property (weak) IBOutlet NSTextField *setShortenerUrlTextField;


@end
