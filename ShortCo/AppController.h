//
//  AppController.h
//  ShortCo
//
//  Created by Jake Wilkins on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PreferenceController;

@interface AppController : NSObject
{
    PreferenceController *preferenceController;
}

- (IBAction)showPreferencePanel:(id)sender;

@end
