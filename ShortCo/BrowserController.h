//
//  BrowserController.h
//  ShortCo
//
//  Created by Chad Gulley on 3/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "WebKit/WebKit.h"


@interface BrowserController : NSWindowController {
//    WebView *webView;
}

@property (weak) IBOutlet WebView *webView;

- (void)openWebPageInPanel:(NSString *)url;

@end
