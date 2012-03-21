//
//  ShortFetcher.h
//  ShortCo
//
//  Created by Chad Gulley on 3/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShortFetcher : NSObject <NSXMLParserDelegate> {
    NSString *shortenedUrl;
}
- (NSString *)fetchShortUrl:(NSString *)url withError:(NSError **)outError;
@end
