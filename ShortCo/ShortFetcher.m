//
//  ShortFetcher.m
//  ShortCo
//
//  Created by Chad Gulley on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBJson/SBJson.h"

#import "ShortFetcher.h"
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
        
        _urlMappings = [[NSMutableDictionary alloc] init];
        [_urlMappings setObject:urlMappings forKey:@"URL_MAPPINGS"];
        
        NSLog(@"CONFIGURING:: set URL_MAPPINGS[ADD]: %@", 
              [urlMappings objectForKey:@"ADD"]);
        
    }
    return self;
}

- (NSString *)fetchShort:(NSString *)url 
               withError:(NSError **)outError
{
    NSData *parmsData = [self generatePostParamsFor:url];
    
    
    NSLog(@"fetching %@", url);
    
    NSString *urlActionString = [self generateUrlStringForAction:@"ADD"];
    
    NSData *data = [self makeRequestTo:urlActionString 
                                   ofType:@"POST"
                               withParams:parmsData 
                                withError:outError];
    
    NSDictionary *parsedDict = [_parser objectWithData:data];
    
    NSLog(@"data [%@]", [parsedDict valueForKey:@"shortened"]);
    
    if (parsedDict != nil) {
        return [self generateResultUrlString:[parsedDict valueForKey:@"shortened"]];
    }
    return nil;
}

- (NSData *)generatePostParamsFor:(NSString *)url 
                   withOptions:(NSMutableDictionary *)options
{
    NSLog(@"received url string %@", url);
    
    [options setObject:url forKey:@"url"];
    
    NSLog(@"set options key url to %@", 
          [options objectForKey:@"url"]);
    
    NSString *jsonString = [_writer stringWithObject:options];
    
    NSLog(@"generated jsonString: %@", jsonString);
    
    NSString *postParamsString;    
    postParamsString = [NSString stringWithFormat:@"shortener=%@", jsonString];
    
    NSLog(@"generated postParamsString: %@", postParamsString);
    
    NSData *returnData = [postParamsString
                          dataUsingEncoding:NSASCIIStringEncoding 
                       allowLossyConversion:YES];

    return returnData;
} 

- (NSData *)generatePostParamsFor:(NSString *)url
{
    NSMutableDictionary *emptyDict = [[NSMutableDictionary alloc] init];
    NSData *returnValue = [self generatePostParamsFor:url withOptions:emptyDict];
    return returnValue;
}

- (NSData *)makeRequestTo:(NSString *)url 
                   ofType:(NSString *)type
                withParams:(NSData *)params 
                 withError:(NSError *__autoreleasing *)outError
{
    
    NSData *returnData;
    NSURL *urlObj = [NSURL URLWithString:url];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:urlObj];
    
    if (type == @"POST")
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

- (NSString *)generateUrlStringForAction:(NSString *)action
{
    NSString *actionUrl = [NSString stringWithFormat:@"%@/%@", 
                           [PreferenceController preferenceShortenerUrl],
        [[_urlMappings objectForKey:@"URL_MAPPINGS"] objectForKey:action]];
    
    NSLog(@"returning actionUrl %@", actionUrl);
    
    return actionUrl;
}

- (NSString *)generateResultUrlString:(NSString *)shortened
{
    NSString *resultString = [NSString stringWithFormat:@"%@/%@",
                              [PreferenceController preferenceShortenerUrl], shortened];
    return resultString;
}

@end
