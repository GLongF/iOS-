//
//  BaseHttpManager.h
//  Ykly
//
//  Created by zhaoyanqing on 16/4/29.
//  Copyright © 2016年 yonyou. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    
    GET = 1,
    POST,
    PUT,
    DELETE,
    
}BASE_HTTP_TYPE;

typedef void(^httpSuccessBlock)(NSURL * url, id data);
//成功时回调用的block 参数：请求的地址  回调的数据 id可以使字典也可以是数组

typedef void(^httpFailBlock)(NSURL * url, NSError *error);
//失败时回调用的block 参数：请求的地址  失败的错误信息


@interface BaseHttpManager : NSObject

//extern NSString *const myBaseURLStr;

+ (BaseHttpManager *)shareManager;

+ (NSURL *)httpType:(BASE_HTTP_TYPE)type andURL:(NSString *)url andParam:(NSDictionary *)param andSuccessBlock:(httpSuccessBlock)sucBlock andFailBlock:(httpFailBlock)failBlock;

+ (void)cancelHTTPRequestOperations;

@end
