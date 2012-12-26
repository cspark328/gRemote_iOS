//
//  ServerSearcher.m
//  gRemote
//
//  Created by 박찬순 on 12. 12. 24..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import "ServerHelper.h"

@implementation ServerHelper

- (id)init
{
    self = [super init];
    if (self) {
        @autoreleasepool {
            _services = [[NSMutableArray alloc] init];
            
            _netServiceBrowser = [[NSNetServiceBrowser alloc] init];
            [_netServiceBrowser setDelegate:self];
            [_netServiceBrowser searchForServicesOfType:@"_http._tcp." inDomain:@""];
        }
    }
    return self;
}

- (void)searchForServices
{
//    [_netServiceBrowser stop];
//    [_netServiceBrowser searchForBrowsableDomains];
}

#pragma mark - NSNetServiceBrowser delegate

/* Sent to the NSNetServiceBrowser instance's delegate before the instance begins a search. The delegate will not receive this message if the instance is unable to begin a search. Instead, the delegate will receive the -netServiceBrowser:didNotSearch: message.
 */
- (void)netServiceBrowserWillSearch:(NSNetServiceBrowser *)aNetServiceBrowser
{
    NSLog(@"netServiceBrowserWillSearch");
}

/* Sent to the NSNetServiceBrowser instance's delegate when the instance's previous running search request has stopped.
 */
- (void)netServiceBrowserDidStopSearch:(NSNetServiceBrowser *)aNetServiceBrowser
{
    NSLog(@"netServiceBrowserDidStopSearch");
}

/* Sent to the NSNetServiceBrowser instance's delegate when an error in searching for domains or services has occurred. The error dictionary will contain two key/value pairs representing the error domain and code (see the NSNetServicesError enumeration above for error code constants). It is possible for an error to occur after a search has been started successfully.
 */
- (void)netServiceBrowser:(NSNetServiceBrowser *)aNetServiceBrowser didNotSearch:(NSDictionary *)errorDict
{
    NSLog(@"netServiceBrowser didNotSearch");
    NSLog(@"%@", errorDict);
}

/* Sent to the NSNetServiceBrowser instance's delegate for each domain discovered. If there are more domains, moreComing will be YES. If for some reason handling discovered domains requires significant processing, accumulating domains until moreComing is NO and then doing the processing in bulk fashion may be desirable.
 */
- (void)netServiceBrowser:(NSNetServiceBrowser *)aNetServiceBrowser didFindDomain:(NSString *)domainString moreComing:(BOOL)moreComing
{
    NSLog(@"netServiceBrowser didFindDomain");
}

/* Sent to the NSNetServiceBrowser instance's delegate for each service discovered. If there are more services, moreComing will be YES. If for some reason handling discovered services requires significant processing, accumulating services until moreComing is NO and then doing the processing in bulk fashion may be desirable.
 */
- (void)netServiceBrowser:(NSNetServiceBrowser *)aNetServiceBrowser didFindService:(NSNetService *)aNetService moreComing:(BOOL)moreComing
{
    NSLog(@"netServiceBrowser didFindService");
}

/* Sent to the NSNetServiceBrowser instance's delegate when a previously discovered domain is no longer available.
 */
- (void)netServiceBrowser:(NSNetServiceBrowser *)aNetServiceBrowser didRemoveDomain:(NSString *)domainString moreComing:(BOOL)moreComing
{
    NSLog(@"netServiceBrowser didRemoveDomain");
}

/* Sent to the NSNetServiceBrowser instance's delegate when a previously discovered service is no longer published.
 */
- (void)netServiceBrowser:(NSNetServiceBrowser *)aNetServiceBrowser didRemoveService:(NSNetService *)aNetService moreComing:(BOOL)moreComing
{
    NSLog(@"netServiceBrowser didRemoveService");
}

#pragma mark - NSNetService delegate

/* Sent to the NSNetService instance's delegate prior to advertising the service on the network. If for some reason the service cannot be published, the delegate will not receive this message, and an error will be delivered to the delegate via the delegate's -netService:didNotPublish: method.
 */
- (void)netServiceWillPublish:(NSNetService *)sender
{
    NSLog(@"netServiceWillPublish");
}

/* Sent to the NSNetService instance's delegate when the publication of the instance is complete and successful.
 */
- (void)netServiceDidPublish:(NSNetService *)sender
{
    NSLog(@"netServiceDidPublish");
}

/* Sent to the NSNetService instance's delegate when an error in publishing the instance occurs. The error dictionary will contain two key/value pairs representing the error domain and code (see the NSNetServicesError enumeration above for error code constants). It is possible for an error to occur after a successful publication.
 */
- (void)netService:(NSNetService *)sender didNotPublish:(NSDictionary *)errorDict
{
    NSLog(@"netService didNotPublish");
}

/* Sent to the NSNetService instance's delegate prior to resolving a service on the network. If for some reason the resolution cannot occur, the delegate will not receive this message, and an error will be delivered to the delegate via the delegate's -netService:didNotResolve: method.
 */
- (void)netServiceWillResolve:(NSNetService *)sender
{
    NSLog(@"netServiceWillResolve");
}

/* Sent to the NSNetService instance's delegate when one or more addresses have been resolved for an NSNetService instance. Some NSNetService methods will return different results before and after a successful resolution. An NSNetService instance may get resolved more than once; truly robust clients may wish to resolve again after an error, or to resolve more than once.
 */
- (void)netServiceDidResolveAddress:(NSNetService *)sender
{
    NSLog(@"netServiceDidResolveAddress");
}

/* Sent to the NSNetService instance's delegate when an error in resolving the instance occurs. The error dictionary will contain two key/value pairs representing the error domain and code (see the NSNetServicesError enumeration above for error code constants).
 */
- (void)netService:(NSNetService *)sender didNotResolve:(NSDictionary *)errorDict
{
    NSLog(@"netService didNotResolve");
}

/* Sent to the NSNetService instance's delegate when the instance's previously running publication or resolution request has stopped.
 */
- (void)netServiceDidStop:(NSNetService *)sender
{
    NSLog(@"netServiceDidStop");
}

/* Sent to the NSNetService instance's delegate when the instance is being monitored and the instance's TXT record has been updated. The new record is contained in the data parameter.
 */
- (void)netService:(NSNetService *)sender didUpdateTXTRecordData:(NSData *)data
{
    NSLog(@"netService didUpdateTXTRecordData");
}

@end
