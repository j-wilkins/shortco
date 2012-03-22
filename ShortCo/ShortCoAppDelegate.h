//
//  ShortCoAppDelegate.h
//  ShortCo
//
//  Created by Chad Gulley on 3/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ShortFetcher.h"

@interface ShortCoAppDelegate : NSObject <NSApplicationDelegate> {
    ShortFetcher *fetcher;
}

@property (assign) IBOutlet NSWindow *window;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)saveAction:(id)sender;
- (IBAction)shortenURL:(id)sender;
- (IBAction)openInBrowser:(id)sender;

@property (weak) IBOutlet NSTextField *urlTextField;
@property (weak) IBOutlet NSTextField *shortUrlTextField;

@end
