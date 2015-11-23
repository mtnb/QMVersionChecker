//
//  ViewController.m
//  versionUpChecker
//
//  Created by Muto Nobuhito on 2015/11/22.
//  Copyright © 2015年 Muto Nobuhito. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    QMVersionUpChecker *checker = [[QMVersionUpChecker alloc]init];
    
    @try {
        [checker isNeedUpdate:@"1.0" :@"1.0"];
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception);
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
