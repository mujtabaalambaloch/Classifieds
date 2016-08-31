//
//  FirstViewController.m
//  Classifieds
//
//  Created by Mujtaba Alam on 8/31/16.
//  Copyright © 2016 Mujtaba Alam. All rights reserved.
//

#import "FirstViewController.h"
#import "CategoryViewController.h"
#import "DetailViewController.h"
#import "CategoryModel.h"
#import "PhotoModel.h"
#import "UIImageView+WebCache.h"

@interface FirstViewController () {
    NSURL *photoURL;
}

@property (weak, nonatomic) IBOutlet UILabel *welcomeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cateogoryImageView;
@property (weak, nonatomic) IBOutlet UIButton *categoryButton;
@property (weak, nonatomic) IBOutlet UIButton *listingButton;
@property (weak, nonatomic) IBOutlet UILabel *quoteLabel;

@end

@implementation FirstViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    
    BOOL firstTime = true;
    
    if (firstTime) {
        PhotoModel *pModel = (PhotoModel *)self.randomCategory.categoryArray[0];
        photoURL = [pModel photoImageURL];
        [self.cateogoryImageView sd_setImageWithURL:photoURL];
    } else {
        self.quoteLabel.hidden = TRUE;
        self.listingButton.hidden = TRUE;
    }
    
    self.quoteLabel.text = self.quote;
}

#pragma mark - UIButton Actions

- (IBAction)categoryAction:(id)sender {
    [self performSegueWithIdentifier:@"CategoryView" sender:nil];
}

- (IBAction)listingAction:(id)sender {
    [self performSegueWithIdentifier:@"DetailView" sender:nil];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"CategoryView"]) {
         CategoryViewController *view = (CategoryViewController *)segue.destinationViewController;
        view.logic = self.logic;
        
    } else if ([segue.identifier isEqualToString:@"DetailView"]) {
        
        SDImageCache *cachedImage = [SDImageCache sharedImageCache];
        UIImage *image = [cachedImage imageFromDiskCacheForKey:photoURL.absoluteString];
        
        if (image != nil) {
            DetailViewController *details = (DetailViewController *)segue.destinationViewController;
            details.listingTitle = self.randomCategory.categoryName;
            details.listingQuote = self.quote;
            details.listingImage = image;
        }
    }
}

@end
