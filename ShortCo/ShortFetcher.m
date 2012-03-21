//
//  ShortFetcher.m
//  ShortCo
//
//  Created by Chad Gulley on 3/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ShortFetcher.h"
#import "SBJson/SBJson.h"

@implementation ShortFetcher

- (NSString *)fetchShortUrl:(NSString *)urlString withError:(NSError **)outError
{
    NSLog(@"fetching %@", urlString);
    NSURL *url = [NSURL URLWithString:@"http://shortener1.heroku.com/add.json"];
    // TODO
    // - make args json like below
    //   {"shortener"=>"{\"url\":\"http://www.google.com\"}"}
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    [req setHTTPMethod:@"POST"];
    NSHTTPURLResponse *resp = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:req 
                                         returningResponse:&resp
                                                     error:outError];
    NSLog(@"data %@ - resp %@", [data description], [resp description]);
    NSLog(@"response code %ld", [resp statusCode]);
    
    return @"http://www.gunandrabbit.com/";
}

@end
