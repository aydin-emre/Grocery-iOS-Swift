//
//  HiAnalytics.h
//  HiAnalytics
//
//  Created by cbg_bigdata on 2019/12/27.
//  Copyright © 2019 cbg_bigdata. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HAEventType.h"
#import "HAParamType.h"

@interface HiAnalytics : NSObject

/**
 * 初始化配置
 */
+ (void)config;

/**
 * 记录自定义事件。
 *
 * @param eventId 事件标识符。非空，长度不超过256字符，不支持空格和不可见字符。不能使用自动采集事件ID。
 * @params params 事件携带的信息。key值不支持空格和不可见字符。
 */
+ (void)onEvent:(nonnull NSString *)eventId setParams:(nonnull NSDictionary<NSString *, id> *)params;

/**
 * 设置用户属性。用户属性值将在整个应用程序生命周期和会话期间保持不变。最多支持25个用户属性名称，如果后面设置属性有重复的name，则刷新。
 *
 * @param name 用户属性的标识符。非空，长度不超过256字符，不支持空格和不可见字符。
 * @param value 属性值。非空，长度不超过256字符。
 */
+ (void)setUserProfile:(nonnull NSString *)name setValue:(nonnull NSString *)value;

/**
 * 支持AB test特性，获取预定义或者自定义的用户属性。
 *
 * @param preDefined 是否获取预定义用户属性。
 * @return 预定义或者自定义的用户属性。
 */
+ (nullable NSDictionary<NSString *, id> *)userProfiles:(BOOL)preDefined;

/**
 * 是否打开打点采集能力。关闭后将不再记录任何数据。
 *
 * @param enabled 是否打开采集开关。默认打开。YES：打开； NO：关闭。
 */
+ (void)setAnalyticsEnabled:(BOOL)enabled;

/**
 * 从AGC服务中获取App Instance ID.
 *
 * @return AAID
 */
+ (nonnull NSString *)AAID;

/**
 * 设置用户ID。
 * 调用setUserId接口时，如果旧userId不为空字符串且和新userId不同，会重新生成新的session会话。若您不希望使用setUserId标识用户（如用户退出时），必须将userId设为NULL。
 * id: 用于应用标识用户的ID，在分析的服务侧通过此标识进行关联用户数据。使用userId需要遵守相关隐私规范，请在您应用的隐私声明中进行声明。
 *
 * @param userId 用户id，非空，长度不超过256字符。
 */
+ (void)setUserId:(nullable NSString *)userId;

/**
 * 设置Session超时时长。App一直在前台运行，当两个相邻事件的时间间隔超过此方法设置的阈值时，将生成一个新的会话。默认30分钟。
 *
 * @param milliseconds Session超时时长。单位：毫秒
 */
+ (void)setSessionDuration:(NSTimeInterval)milliseconds;

/**
 * 清除本地缓存的所有采集数据，包括发送失败的缓存数据。
 */
+ (void)clearCachedData;

@end
