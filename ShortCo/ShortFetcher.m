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

    NSString *post = [NSString stringWithFormat:@"shortener=%@", [_writer stringWithObject:urlDict]];
    NSData *parmsData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    
    NSLog(@"fetching %@", urlString);
//    NSURL *url = [NSURL URLWithString:@"http://localhost:9292/add.json"];
    NSURL *url = [NSURL URLWithString:@"http://shortener1.heroku.com/add.json"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody:parmsData];
    
    NSHTTPURLResponse *resp = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:req 
                                         returningResponse:&resp
                                                     error:outError];
    NSDictionary *parsedDict = [_parser objectWithData:data];
    NSLog(@"data [%@]", [parsedDict valueForKey:@"shortened"]);
    NSLog(@"response code %ld", [resp statusCode ]);
    if (parsedDict != nil) {
        return [NSString stringWithFormat:@"http://shortener1.heroku.com/%@",
                [parsedDict valueForKey:@"shortened"]];
    }
    return nil;
}

@end
