//
//  ShortFetcher.h
//  ShortCo
//
//  Created by Chad Gulley on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SBJsonParser;
@class SBJsonWriter;

@interface ShortFetcher : NSObject {
    NSMutableDictionary *_urlMappings;
    SBJsonParser *_parser;
    SBJsonWriter *_writer;
}

- (NSString *)fetchShort:(NSString *)url withError:(NSError **)outError;

- (NSData *)generatePostParamsFor:(NSString *)url 
                      withOptions:(NSMutableDictionary *)options;

- (NSData *)generatePostParamsFor:(NSString *)url;

- (NSData *)makeRequestTo:(NSString *)url ofType:(NSString *)type 
               withParams:(NSData *)params withError:(NSError **)outError;

- (NSString *)generateUrlStringForAction:(NSString *)action;

- (NSString *)generateResultUrlString:(NSString *)shortened;

@end
