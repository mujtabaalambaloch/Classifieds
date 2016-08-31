//
//  FlickrSearchModel.h
//  Classifieds
//
//  Created by Mujtaba Alam on 8/31/16.
//  Copyright © 2016 Mujtaba Alam. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "PhotosModel.h"

@interface FlickrSearchModel : JSONModel

@property (nonatomic, strong) PhotosModel <Optional> * photos;
@property (nonatomic, strong) NSString <Optional> *stat;

@end
