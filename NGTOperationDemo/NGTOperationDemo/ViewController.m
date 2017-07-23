//
//  ViewController.m
//  NGTOperationDemo
//
//  Created by JoeXu on 2017/7/23.
//  Copyright © 2017年 NightXu. All rights reserved.
//

#import "ViewController.h"

#import "NGTOperation.h"

@interface ViewController ()

@property (nonatomic,strong) NGTOperation *op;

@property (nonatomic,strong) NSOperationQueue *opQueue;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _opQueue = [[NSOperationQueue alloc] init];
    
    
    __weak typeof(self) weakSelf = self;
    _op = [NGTOperation operationWithExecuteBlock:^(NGTOperation *aOp) {
        

        NSLog(@"1");
    }];
//    _op.autoFinish = NO;
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"block");
    }];
    [op1 addDependency:_op];
    [_opQueue addOperation:op1];
    [_opQueue addOperation:_op];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
