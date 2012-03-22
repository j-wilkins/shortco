//
//  ShortFetcher.h
//  ShortCo
//
//  Created by Chad Gulley on 3/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SBJsonParser;
@class SBJsonWriter;

@interface ShortFetcher : NSObject <NSXMLParserDelegate> {
    NSString *shortenedUrl;
    NSString *shortenerUrl;
    NSMutableDictionary *configuration;
    SBJsonParser *_parser;
    SBJsonWriter *_writer;
}

- (NSString *)fetchShortUrl:(NSString *)url withError:(NSError **)outError;


- (NSData *)generatePostParams:(NSString *)url withOptions:(NSMutableDictionary *)options;

- (NSData *)generatePostParamsForUrl:(NSString *)url;


- (NSData *)makeUrlRequest:(NSString *)ofType toUrl:(NSString *)url withParams:
    (NSData *)params withError:(NSError **)outError;



- (NSString *)generateURLStringForAction:(NSString *)action;

- (NSString *)generateResultURLString:(NSString *)shortened;



- (void)defineConfigurations;

@end
