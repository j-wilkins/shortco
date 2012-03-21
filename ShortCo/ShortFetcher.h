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
    SBJsonParser *_parser;
    SBJsonWriter *_writer;
}
- (NSString *)fetchShortUrl:(NSString *)url withError:(NSError **)outError;
@end
