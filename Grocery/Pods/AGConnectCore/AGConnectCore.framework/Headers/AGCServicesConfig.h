//
//  Copyright (c) Huawei Technologies Co., Ltd. 2020. All rights reserved
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 读取agc的配置文件信息
@interface AGCServicesConfig : NSObject<NSCopying>

/// App Gallery Connect 平台分配的产品ID，开发者可手动设置，默认返回plist文件中的值
@property(nonatomic,strong,nullable)NSString *productId;
/// App Gallery Connect 平台分配的应用ID，开发者可手动设置，默认返回plist文件中的值
@property(nonatomic,strong,nullable)NSString *appId;
/// App Gallery Connect 平台分配的cpID，开发者可手动设置，默认返回plist文件中的值
@property(nonatomic,strong,nullable)NSString *cpId;
/// App Gallery Connect 平台分配的设备ID，开发者可手动设置，默认返回plist文件中的值
@property(nonatomic,strong,nullable)NSString *clientId;
/// App Gallery Connect 平台分配的设备秘钥，开发者可手动设置，默认返回plist文件中的值
@property(nonatomic,strong,nullable)NSString *clientSecret;
/// App Gallery Connect 平台分配的apiKey，开发者可手动设置，默认返回plist文件中的值
@property(nonatomic,strong,nullable)NSString *apiKey;

/// 初始化默认配置，使用agconnect-services.plist文件
- (instancetype)initWithDefaultPlist;

/// 初始化默认配置
/// @param dictionary 开发者手动配置的资源，需要确保格式与agconnect-services.plist文件一致
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

/// 读取配置信息
/// @param path 配置的路径，路径格式为plist中的层级和名称,如获取packageName字段对应的路径为"/client/package_name"
- (NSString * _Nullable)getString:(NSString *)path;

/// 手动设置配置
/// @param value 配置值
/// @param path 配置的路径，路径格式为层级和名称,如设置packageName字段对应的路径为"/client/package_name"
- (void)setValue:(NSString *)value forPath:(NSString *)path;

+ (instancetype)sharedInstance DEPRECATED_MSG_ATTRIBUTE("Please use [AGCInstance sharedInstance].config");
- (BOOL)getBoolean:(NSString *)path DEPRECATED_ATTRIBUTE;
- (BOOL)getBoolean:(NSString *)path withDefault:(BOOL)def DEPRECATED_ATTRIBUTE;
- (NSInteger)getInt:(NSString *)path DEPRECATED_ATTRIBUTE;
- (NSInteger)getInt:(NSString *)path withDefault:(NSInteger)def DEPRECATED_ATTRIBUTE;
- (NSString *)getString:(NSString *)path withDefault:(nullable NSString *)def DEPRECATED_ATTRIBUTE;

@end

NS_ASSUME_NONNULL_END
