//
//  ShortFetcher.m
//  ShortCo
//
//  Created by Chad Gulley on 3/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ShortFetcher.h"
#import "SBJson/SBJson.h"
#import "PreferenceController.h"

@implementation ShortFetcher

- (id)init
{
    self = [super init];
    if (self) {
        NSMutableDictionary *urlMappings = [[NSMutableDictionary alloc] init];
        [urlMappings setObject:@"add.json" forKey:@"ADD"];
        [urlMappings setObject:@"delete.json" forKey:@"DELETE"];
        
        _parser = [[SBJsonParser alloc] init];
        _writer = [[SBJsonWriter alloc] init];
        
        mappings = [[NSMutableDictionary alloc] init];
        [mappings setObject:urlMappings forKey:@"URL_MAPPINGS"];
        
        NSLog(@"CONFIGURING:: set URL_MAPPINGS[ADD]: %@", 
              [[mappings objectForKey:@"URL_MAPPINGS"] objectForKey:@"ADD"]);

    }
    return self;
}

- (NSString *)fetchShortUrl:(NSString *)urlString withError:(NSError **)outError
{
    
    NSData *parmsData = [self generatePostParamsForUrl:urlString];
    
    
    NSLog(@"fetching %@", urlString);
    
    NSString *urlActionString = [self generateURLStringForAction:@"ADD"];
    
    NSData *data = [self makeUrlRequest:@"POST" toUrl:urlActionString
                             withParams:parmsData withError:outError];

    NSDictionary *parsedDict = [_parser objectWithData:data];

    NSLog(@"data [%@]", [parsedDict valueForKey:@"shortened"]);

    if (parsedDict != nil) {
        return [self generateResultURLString:[parsedDict valueForKey:@"shortened"]];
    }
    return nil;
}

- (NSData *)generatePostParams:(NSString *)url 
                   withOptions:(NSMutableDictionary *)options
{
    NSLog(@"received url string %@", url);
    
    [options setObject:url forKey:@"url"];
    
    NSLog(@"set options key url to %@", [options objectForKey:@"url"]);

    NSString *jsonString = [_writer stringWithObject:options];
    
    NSLog(@"generated jsonString: %@", jsonString);

    NSString *postParamsString;    
    postParamsString = [NSString stringWithFormat:@"shortener=%@", jsonString];
    
    NSLog(@"generated postParamsString: %@", postParamsString);
    
    NSData *returnData = [postParamsString dataUsingEncoding:NSASCIIStringEncoding 
                                        allowLossyConversion:YES];
    return returnData;
}

- (NSData *)generatePostParamsForUrl:(NSString *)url
{
    NSMutableDictionary *emptyDict = [[NSMutableDictionary alloc] init];
    NSData *returnValue = [self generatePostParams:url withOptions:emptyDict];
    return returnValue;
}

- (NSData *)makeUrlRequest:(NSString *)ofType 
                     toUrl:(NSString *)urlString 
                withParams:(NSData *)params 
                 withError:(NSError *__autoreleasing *)outError
{
    
    NSData *returnData;
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    
    if (ofType == @"POST")
        [req setHTTPMethod:@"POST"];
    
    [req setHTTPBody:params];
    
    NSHTTPURLResponse *resp = nil;
    returnData = [NSURLConnection sendSynchronousRequest:req 
                                       returningResponse:&resp
                                                   error:outError];
    if ([resp statusCode] != 200) {
        NSLog(@"shortening not successful. Error Code %ld", [resp statusCode]);
        return nil;
    }
    
    return returnData;
}

- (NSString *)generateURLStringForAction:(NSString *)action
{
    NSString *actionUrl = [NSString stringWithFormat:@"%@/%@", 
        [PreferenceController preferenceShortenerUrl],
        [[mappings objectForKey:@"URL_MAPPINGS"] objectForKey:action]];
    
    NSLog(@"returning actionUrl %@", actionUrl);
    
    return actionUrl;
}

- (NSString *)generateResultURLString:(NSString *)shortened
{
    NSString *resultString = [NSString stringWithFormat:@"%@/%@",
                    [PreferenceController preferenceShortenerUrl], shortened];
    return resultString;
}


@end
