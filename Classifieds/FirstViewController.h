//
//  FirstViewController.h
//  Classifieds
//
//  Created by Mujtaba Alam on 8/31/16.
//  Copyright © 2016 Mujtaba Alam. All rights reserved.
//

#import "ViewController.h"
#import "CategoryModel.h"
#import "CommonLogic.h"

@interface FirstViewController : UIViewController

@property (nonatomic, strong) CommonLogic *logic;
@property (nonatomic, strong) CategoryModel *randomCategory;
@property (nonatomic, strong) NSString *quote;

@end
