//
//  Network.h
//  Classifieds
//
//  Created by Mujtaba Alam on 8/31/16.
//  Copyright © 2016 Mujtaba Alam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Network : NSObject

typedef void (^CompletionHandler)(BOOL success, NSDictionary *response, NSError *error);

- (void)getRequestURL:(NSString *)url params:(NSDictionary *)params completion:(CompletionHandler)completion;

@end
