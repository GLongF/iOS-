//
//  BaseHttpManager.m
//  Ykly
//
//  Created by zhaoyanqing on 16/4/29.
//  Copyright © 2016年 yonyou. All rights reserved.
//

#import "BaseHttpManager.h"
#import "AFHTTPSessionManager.h"

@interface BaseHttpManager ()

@property (nonatomic, copy)NSString * baseUrl;

@property (nonatomic, strong)AFHTTPSessionManager *manager;


@end

@implementation BaseHttpManager


+ (BaseHttpManager *)shareManager {
    
    static BaseHttpManager * shareManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        shareManager = [[BaseHttpManager alloc] initWithBaseUrl:BASE_URL];
    });

    return shareManager;
}


- (instancetype)initWithBaseUrl:(NSString *)url {
    
    if (self = [super init]) {
        
        _baseUrl = url;
        
        _manager = [AFHTTPSessionManager manager];
        
        _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/plain",nil];
    }
    
    return self;
}

- (NSURL *)requestGETWithURL:(NSString *)url andParam:(NSDictionary *)param andSuccessBlock:(httpSuccessBlock)sucBlock andFailBlock:(httpFailBlock)failBlock {
    
    NSString * returnUrl = [NSString stringWithFormat:@"%@%@",_baseUrl, url];

    returnUrl = [returnUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
//    returnUrl = [returnUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL * returnURL = [NSURL URLWithString:returnUrl];
    
    [_manager GET:returnUrl parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
      
        if (responseObject == nil) {
            //数据请求失败
            NSError *error = [[NSError alloc]initWithDomain:@"网络请求数据为空!" code:9999 userInfo:nil];
            
            failBlock(returnURL, error);
        }else {
            
            id obejct = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            
            if (obejct != nil) {
                
                sucBlock(returnURL, obejct);
            }else{
                
                if ([responseObject isKindOfClass:[NSData class]]) {
                    
                    NSString * dataStr =  [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                    
                    sucBlock(returnURL, dataStr);
                }
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failBlock(returnURL, error);
    }];
    
    return returnURL;
}

- (NSURL *)requestPOSTWithURL:(NSString *)url andParam:(NSDictionary *)param andSuccessBlock:(httpSuccessBlock)sucBlock andFailBlock:(httpFailBlock)   failBlock {
    
    NSString * returnUrl = [NSString stringWithFormat:@"%@%@",_baseUrl, url];
    
    NSURL * returnURL = [NSURL URLWithString:returnUrl];
    NSLog(@"-------------%@",returnURL);
    NSLog(@"---------------%@",param);
    [_manager POST:returnUrl parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (responseObject == nil) {
            
            //数据请求失败
            NSError *error = [[NSError alloc]initWithDomain:@"网络请求数据为空!" code:9999 userInfo:nil];
            failBlock(returnURL, error);
        }else {
            
            id obejct = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            sucBlock(returnURL, obejct);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failBlock(returnURL, error);
//        NSLog(@"------ERROR   %@",error[@"_domain"]);
    }];
    
    return returnURL;
}


- (NSURL *)requestDELETEWithURL:(NSString *)url andParam:(NSDictionary *)param andSuccessBlock:(httpSuccessBlock)sucBlock andFailBlock:(httpFailBlock)   failBlock {
    
    NSString * returnUrl = [NSString stringWithFormat:@"%@%@",_baseUrl, url];
    
    NSURL * returnURL = [NSURL URLWithString:returnUrl];
    
    [_manager DELETE:returnUrl parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject == nil) {
            
            //数据请求失败
            NSError *error = [[NSError alloc]initWithDomain:@"网络请求数据为空!" code:9999 userInfo:nil];
            
            failBlock(returnURL, error);
            
        }else {
            
            id obejct = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            
            
          
            
            sucBlock(returnURL, obejct);
            
            
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
         failBlock(returnURL, error);
        
    }];
    
    return returnURL;
}

- (NSURL *)requestPUTWithURL:(NSString *)url andParam:(NSDictionary *)param andSuccessBlock:(httpSuccessBlock)sucBlock andFailBlock:(httpFailBlock)failBlock {
    
    NSString * returnUrl = [NSString stringWithFormat:@"%@%@",_baseUrl, url];
    
    NSURL * returnURL = [NSURL URLWithString:returnUrl];
    
    [self.manager PUT:returnUrl parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (responseObject == nil) {
            
            //数据请求失败
            NSError *error = [[NSError alloc]initWithDomain:@"网络请求数据为空!" code:9999 userInfo:nil];
            
            failBlock(returnURL, error);
            
        }else {
            
            id obejct = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            
            sucBlock(returnURL, obejct);
            
            
        }

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
         failBlock(returnURL, error);
        
    }];
    
    return returnURL;


}


#pragma mark -- 公共的请求方法
+ (NSURL *)httpType:(BASE_HTTP_TYPE)type andURL:(NSString *)url andParam:(NSDictionary *)param andSuccessBlock:(httpSuccessBlock)sucBlock andFailBlock:(httpFailBlock)failBlock{

    BaseHttpManager * manager = [BaseHttpManager shareManager];
    
    
        if(type == GET){
            
            return   [manager requestGETWithURL:url andParam:param andSuccessBlock:sucBlock andFailBlock:failBlock];
            
        }else if (type == POST){
            
            return [manager requestPOSTWithURL:url andParam:param andSuccessBlock:sucBlock andFailBlock:failBlock];
            
        }else if(type == PUT){
            
            return [manager requestPUTWithURL:url andParam:param andSuccessBlock:sucBlock andFailBlock:failBlock];
        }else{
            
            return [manager requestDELETEWithURL:url andParam:param andSuccessBlock:sucBlock andFailBlock:failBlock];
        }
        
    
    return nil;
}

#pragma mark -- 取消请求
//取消所有请求
+ (void)cancelHTTPRequestOperations {
    
    BaseHttpManager * manager = [BaseHttpManager shareManager];
    
    [manager.manager.operationQueue cancelAllOperations];

}




@end
