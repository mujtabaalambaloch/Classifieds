//
//  CategoryModel.h
//  Classifieds
//
//  Created by Mujtaba Alam on 8/31/16.
//  Copyright © 2016 Mujtaba Alam. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface CategoryModel : JSONModel

@property (nonatomic, strong) NSString <Optional> * categoryName;
@property (nonatomic, strong) NSArray <Optional> *categoryArray;

@end
