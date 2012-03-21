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
    _parser = [[SBJsonParser alloc] init];
    _writer = [[SBJsonWriter alloc] init];
    
    // yikes. all this seems to be the equivalent of:
    // parmsDict = {"shortener" => {"url" => urlString}} in ruby...
    NSMutableDictionary *urlDict = [[NSMutableDictionary alloc] init];
    [urlDict setObject:urlString forKey:@"url"];
    NSMutableDictionary *parmsDict = [[NSMutableDictionary alloc] init];
    //[parmsDict setObject:urlDict forKey:@"shortener"];
    //NSLog(@"parmsDict.shortener = %@", [parmsDict description]);
    
    
    NSMutableData *parmsData = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:parmsData];
    [archiver encodeObject:parmsDict forKey:@"shortener"];
    [archiver finishEncoding];

    //= [_writer dataWithObject:parmsDict];
    
    
    NSLog(@"parmsData = %@", [parmsData description]);
    NSLog(@"fetching %@", urlString);
    NSURL *url = [NSURL URLWithString:@"http://localhost:9292/add.json"];
    // TODO
    // - make args json like below
    //   {"shortener"=>"{\"url\":\"http://www.google.com\"}"}
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody:parmsData];
    NSLog(@"body is %@", [[req HTTPBody] description]);
    
    NSHTTPURLResponse *resp = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:req 
                                         returningResponse:&resp
                                                     error:outError];
    //NSLog(@"data %@ - resp %@", [data description], [resp description]);
    NSLog(@"response code %ld", [resp statusCode]);
    //NSLog(@"response body %@", [resp )
    
    return @"http://www.gunandrabbit.com/";
}

@end
