//
//  PhotoModel.m
//  Classifieds
//
//  Created by Mujtaba Alam on 8/31/16.
//  Copyright © 2016 Mujtaba Alam. All rights reserved.
//

#import "PhotoModel.h"

@implementation PhotoModel

- (NSURL *)photoImageURL {
    
    NSString *photoImage = @"https://farm{farm}.staticflickr.com/{server}/{photoID}_{secret}_{size}.jpg";
    
    NSString *photoURL = [photoImage stringByReplacingOccurrencesOfString:@"{farm}" withString:self.farm];
    photoURL = [photoURL stringByReplacingOccurrencesOfString:@"{server}"
                                                   withString:self.server];
    photoURL = [photoURL stringByReplacingOccurrencesOfString:@"{photoID}"
                                                   withString:self.id];
    photoURL = [photoURL stringByReplacingOccurrencesOfString:@"{secret}"
                                                   withString:self.secret];
    photoURL = [photoURL stringByReplacingOccurrencesOfString:@"{size}"
                                                   withString:@"h"];
    return [NSURL URLWithString:photoURL];
}

@end
