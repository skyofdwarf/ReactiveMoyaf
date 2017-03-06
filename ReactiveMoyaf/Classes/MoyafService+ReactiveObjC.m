//
//  MoyafService+ReactiveObjC.m
//  Molla
//
//  Created by skyofdwarf on 2017. 3. 3..
//  Copyright © 2017년 dwarfini. All rights reserved.
//

#import "MoyafService+ReactiveObjC.h"



#pragma mark - MoyafService(ReactiveObjC)

@implementation MoyafService(ReactiveObjC)

- (nonnull RACSignal<MoyafResult *> *)requestWithApi:(nonnull id<MoyafApiProtocol>)api {
	typeof(self) __weak wself = self;
	return [[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
		MoyafRequestCanceller _Nullable canceller = [wself.requester requestWithApi:api completion:^(MoyafResult * _Nonnull result) {
			[subscriber sendNext:result];
			[subscriber sendCompleted];
		} failure:^(NSError * _Nonnull error) {
			[subscriber sendError:error];
		}];
		
		return [RACDisposable disposableWithBlock:^{
			if (canceller)
				canceller();
		}];
	}] replayLast];

}

@end

