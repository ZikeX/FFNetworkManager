//
//  IANViewController.m
//  FFNetworkManager
//
//  Created by xjq on 12/06/2016.
//  Copyright (c) 2016 xjq. All rights reserved.
//

#import "IANViewController.h"
#import "FFBaseNetworkManager.h"

@implementation IANViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"FFNetworkManager demo";

    FFBaseNetworkManager *manager = [FFBaseNetworkManager new];
    [manager setBaseURL:^NSString *{
       return @"";
    }];
    [manager setParametersWithToken:^NSDictionary *(NSDictionary *parameters) {
        return parameters;
    }];
    [manager supportCache:NO];
    [manager supportIdentifier:@"desId"];
    [manager postURL:@"" parameters:nil result:^(FFBaseNetworkModel *responseObject) {
        
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
