//
//  CommonLogic.h
//  Classifieds
//
//  Created by Mujtaba Alam on 8/31/16.
//  Copyright © 2016 Mujtaba Alam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CategoryModel.h"

@interface CommonLogic : NSObject

typedef void (^Handler)(BOOL success, NSError *error);

#pragma mark - API Call
- (void)apiCall:(Handler)completion;
#pragma mark - Random Quote
- (NSString *)randomQuote;

#pragma mark - Category Methods
- (NSMutableArray *)getCategoryArray;
- (CategoryModel *)randomCategory;
- (NSInteger)categoryCount;

- (NSString *)categoryNameIndex:(NSInteger)index;
- (NSString *)categoryNameAtIndex:(NSIndexPath *)indexPath;
- (NSURL *)categoryImageAtIndex:(NSIndexPath *)indexPath;

- (NSInteger)categoryCollecitonCount:(NSInteger)categoryIndex;
- (NSURL *)categoryCollectionImageAtIndex:(NSIndexPath *)indexPath categoryIndex:(NSInteger)categoryIndex;

@end
