//
//  CategoryImagesViewController.h
//  Classifieds
//
//  Created by Mujtaba Alam on 8/31/16.
//  Copyright © 2016 Mujtaba Alam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonLogic.h"

@interface CategoryImagesViewController : UICollectionViewController

@property (nonatomic, assign) NSInteger categoryIndex;
@property (nonatomic, strong) CommonLogic *logic;

@end
