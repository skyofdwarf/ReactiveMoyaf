//
//  MoyafService+ReactiveObjC.h
//  Molla
//
//  Created by skyofdwarf on 2017. 3. 3..
//  Copyright © 2017년 dwarfini. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Moyaf/Moyaf.h>
#import <ReactiveObjC/ReactiveObjC.h>


#pragma mark - ReactiveMoyafServiceProtocol

@protocol ReactiveMoyafServiceProtocol <MoyafServiceProtocol>
- (nonnull RACSignal *)requestWithApi:(nonnull id<MoyafApiProtocol>)api;
@end



#pragma mark - MoyafService(ReactiveObjC)

@interface MoyafService(ReactiveObjC) <ReactiveMoyafServiceProtocol>
- (nonnull RACSignal<MoyafResult *> *)requestWithApi:(nonnull id<MoyafApiProtocol>)api;
@end


