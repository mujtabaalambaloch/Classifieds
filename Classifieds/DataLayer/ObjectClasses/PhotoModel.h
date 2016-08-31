//
//  PhotoModel.h
//  Classifieds
//
//  Created by Mujtaba Alam on 8/31/16.
//  Copyright © 2016 Mujtaba Alam. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol PhotoModel
@end

@interface PhotoModel : JSONModel

@property (nonatomic, strong) NSString <Optional> * farm;
@property (nonatomic, strong) NSString <Optional> * id;
@property (nonatomic, assign) BOOL isfamily;
@property (nonatomic, assign) BOOL isfriend;
@property (nonatomic, assign) BOOL ispublic;
@property (nonatomic, strong) NSString <Optional> * owner;
@property (nonatomic, strong) NSString <Optional> * secret;
@property (nonatomic, strong) NSString <Optional> * server;
@property (nonatomic, strong) NSString <Optional> * title;

- (NSURL *)photoImageURL;

@end
