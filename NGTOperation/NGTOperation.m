//
//  RBOperation.m
//  XMCreditSDK2.0
//
//  Created by 徐洪斌 on 2016/12/6.
//  Copyright © 2016年 XM. All rights reserved.
//

#import "NGTOperation.h"

@implementation NGTOperation
@synthesize executing = _executing;
@synthesize finished = _finished;
- (instancetype)init
{
    self = [super init];
    if (self) {
        _autoFinish = YES;
    }
    return self;
}
+ (NGTOperation *)operationWithExecuteBlock:(void(^)(NGTOperation *))block{
    NGTOperation *operation = [[NGTOperation alloc] init];
    operation.executeBlock = [block copy];
    return operation;
}
- (void)setExecuting:(BOOL)executing {
    [self willChangeValueForKey:@"isExecuting"];
    _executing = executing;
    [self didChangeValueForKey:@"isExecuting"];
}
- (void)setFinished:(BOOL)finished{
    [self willChangeValueForKey:@"isFinished"];
    _finished = finished;
    [self didChangeValueForKey:@"isFinished"];
}
- (void)start{
    if ([self isCancelled]){
        return;
    }
    self.executing = YES;
    self.finished = NO;
    if (self.executeBlock) {
        self.executeBlock(self);
    }
    
    if (self.isAutoFinish) {
        [self finish];
    }
}
- (void)finish{
    self.executing = NO;
    self.finished = YES;
}
- (void)cancel{
    [super cancel];
    [self finish];
}
@end
