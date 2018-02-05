//
//  JSONService.m
//  StorecastApp
//
//  Created by Andrey Martynenko on 10/3/16.
//  Copyright © 2016 Andrey Martynenko. All rights reserved.
//

#import "JSONService.h"
#import "ServicesHub.h"

static NSString * const devServerStaging = @"https://api.gettyimages.com:443/v3/";
static NSString * const apiKey = @"ases5k2w53xbuftt7tfjqy3j";

@interface JSONService()

@end

@implementation JSONService

+ (NSURL *)baseServiceURL {
    return [[NSURL alloc] initWithString:devServerStaging];
}

+ (AFHTTPRequestSerializer<AFURLRequestSerialization> *)requestSerializer {
    AFHTTPRequestSerializer<AFURLRequestSerialization> *requestSerializer = [AFJSONRequestSerializer serializer];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
    [requestSerializer setValue:apiKey forHTTPHeaderField:@"Api-Key"];

    return requestSerializer;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupSessionManager];
    }
    
    return self;
}

- (void)setupSessionManager {
    self.sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[[self class] baseServiceURL]];
    [self.sessionManager setRequestSerializer:[[self class] requestSerializer]];
    [self.sessionManager setResponseSerializer:[[JSONResponseSerializerWithData alloc] init]];
    
    self.sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"application/javascript", nil];
    self.sessionManager.session.configuration.timeoutIntervalForRequest = 10.0f;
}

- (void)request:(NSString *)path parameters:(NSDictionary *)parameters success:(RequestSuccessBlock)successBlock failure:(FailureBlock)failureBlock {
    if (self.sessionManager.baseURL == nil)
        [self setupSessionManager];
    
    [self.sessionManager GET:path parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        ;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}

@end

@implementation JSONResponseSerializerWithData

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing *)error {
    if (![self validateResponse:(NSHTTPURLResponse *)response data:data error:error]) {
        if (*error != nil) {
            NSMutableDictionary *userInfo = [(*error).userInfo mutableCopy];
            NSError *jsonError = nil;
            NSDictionary *errors = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
            if (jsonError) {
                userInfo[JSONResponseSerializerWithDataKey] = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                NSError *newError = [NSError errorWithDomain:(*error).domain code:(*error).code userInfo:userInfo];
                (*error) = newError;
            }
            else {
                userInfo[JSONResponseSerializerWithDataKey] = errors;
                NSError *newError = [NSError errorWithDomain:(*error).domain code:(*error).code userInfo:userInfo];
                (*error) = newError;
            }
        }
        
        return (nil);
    }
    
    return ([super responseObjectForResponse:response data:data error:error]);
}

@end
