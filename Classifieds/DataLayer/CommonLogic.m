//
//  CommonLogic.m
//  Classifieds
//
//  Created by Mujtaba Alam on 8/31/16.
//  Copyright © 2016 Mujtaba Alam. All rights reserved.
//

#import "CommonLogic.h"
#import <AFNetworking/AFNetworking.h>
#import "Constants.h"
#import "Network.h"
#import "PhotosModel.h"
#import "CategoryModel.h"
#import "MBProgressHUD.h"

@interface CommonLogic () {
    NSMutableArray *categories;
}

@end

@implementation CommonLogic

#pragma mark - API Call

- (void)apiCall:(Handler)completion {
    
    NSString *requestURL = [SearchPhoto stringByReplacingOccurrencesOfString:@"{apiKey}" withString:FlickrAPIKey];
    requestURL = [requestURL stringByReplacingOccurrencesOfString:@"{page}"
                                                 withString:@"1"];
    requestURL = [requestURL stringByReplacingOccurrencesOfString:@"{num}"
                                                 withString:@"10"];
    
    NSArray *cateogry = @[@"motors",@"properties",@"jobs", @"electronics", @"classifieds", @"tyranosaurus"];
    
    categories = [[NSMutableArray alloc] init];
    
    [self showLoadingIndicator];
    
    for (NSInteger i = 0; i < cateogry.count; i++) {
        
        NSString *request = [requestURL stringByReplacingOccurrencesOfString:@"{text}" withString:cateogry[i]];
        
        Network *network = [[Network alloc] init];
        [network getRequestURL:request params:nil completion:^(BOOL success, NSDictionary *response, NSError *error) {
           
            if (success) {
                
                PhotosModel *photosModel = [[PhotosModel alloc] initWithDictionary:response[@"photos"] error:nil];
                
                CategoryModel *cModel = [[CategoryModel alloc] init];
                cModel.categoryName = cateogry[i];
                cModel.categoryArray = photosModel.photo;
                
                [categories addObject:cModel];
                
                if (i == (cateogry.count - 1)) {
                    [self hideLoadingIndicator];
                    completion(TRUE, nil);
                }
            } else {
                completion(FALSE, nil);
            }
        }];
    }
}

#pragma mark - Random Quote
- (NSString *)randomQuote {
    NSArray *quotes = @[@"Quote One",@"Quote 2",@"Quote 3", @"Quote 4", @"Quote 5", @"Quote 6"];
    NSUInteger randomIndex = arc4random() % [quotes count];
    
    return quotes[randomIndex];
}

#pragma mark - Category Methods
- (NSMutableArray *)getCategoryArray {
    return categories;
}

- (CategoryModel *)randomCategory {
    NSUInteger randomIndex = arc4random() % [categories count];
    return (CategoryModel *)categories[randomIndex];
}

- (NSInteger)categoryCount {
    return categories.count;
}

- (NSString *)categoryNameIndex:(NSInteger)index {
    CategoryModel *cm = (CategoryModel *)categories[index];
    return cm.categoryName;
}

- (NSString *)categoryNameAtIndex:(NSIndexPath *)indexPath {
    return [self categoryNameIndex:indexPath.row];
}

- (NSURL *)categoryImageAtIndex:(NSIndexPath *)indexPath {
    CategoryModel *cm = (CategoryModel *)categories[indexPath.row];
    PhotoModel *pModel = (PhotoModel *)cm.categoryArray[0];
    return [pModel photoImageURL];
}

- (NSInteger)categoryCollecitonCount:(NSInteger)categoryIndex {
    CategoryModel *cm = (CategoryModel *)categories[categoryIndex];
    return cm.categoryArray.count;
}

- (NSURL *)categoryCollectionImageAtIndex:(NSIndexPath *)indexPath categoryIndex:(NSInteger)categoryIndex {
    CategoryModel *cm = (CategoryModel *)categories[categoryIndex];
    PhotoModel *pModel = (PhotoModel *)cm.categoryArray[indexPath.row];
    return [pModel photoImageURL];
}

#pragma mark - MBProgressHUD Show/Hide

- (void)showLoadingIndicator {
    [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
}

- (void)hideLoadingIndicator {
    [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow animated:YES];
}

@end
