//
//  ViewController.m
//  Classifieds
//
//  Created by Mujtaba Alam on 8/31/16.
//  Copyright © 2016 Mujtaba Alam. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "CommonLogic.h"

@interface ViewController () {
    CommonLogic *logic;
}

@end

@implementation ViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    logic = [[CommonLogic alloc] init];
    [logic apiCall:^(BOOL success, NSError *error) {
        if (success) {
            [self performSegueWithIdentifier:@"First" sender:nil];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"First"]) {
        FirstViewController *view = (FirstViewController *)segue.destinationViewController;
        view.logic = logic;
        view.randomCategory = [logic randomCategory];
        view.quote = [logic randomQuote];
    }
}

@end
