//
//  RBOperation.h
//  XMCreditSDK2.0
//
//  Created by 徐洪斌 on 2016/12/6.
//  Copyright © 2016年 XM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NGTOperation : NSOperation

@property (assign, nonatomic, getter = isExecuting) BOOL executing;

@property (assign, nonatomic, getter = isFinished) BOOL finished;

@property (copy, nonatomic) void(^executeBlock)(NGTOperation *);

+ (NGTOperation *)operationWithExecuteBlock:(void(^)(NGTOperation *))block;

- (void)finish;


@end
