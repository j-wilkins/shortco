//
//  ShortFetcher.m
//  ShortCo
//
//  Created by Chad Gulley on 3/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ShortFetcher.h"

@implementation ShortFetcher

- (NSString *)fetchShortUrl:(NSString *)url
{
    NSLog(@"fetching %@", url);
    return @"http://www.gunandrabbit.com/";
}

@end
