//
//  ServerSearcher.h
//  gRemote
//
//  Created by 박찬순 on 12. 12. 24..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerHelper : NSObject<NSNetServiceBrowserDelegate, NSNetServiceDelegate>

@property (nonatomic, retain) NSMutableArray* services;
@property (nonatomic, retain) NSNetServiceBrowser* netServiceBrowser;
@property (nonatomic, retain) NSNetService* netService;

- (void)searchForServices;

@end
