//
//  HAEventType.h
//  HiAnalytics
//
//  Created by cbg_bigdata on 2020/2/19.
//  Copyright © 2020 cbg_bigdata. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 添加支付信息
static NSString *const kCreatePaymentInfo = @"$CreatePaymentInfo";
/// 加入购物车
static NSString *const kAddProduct2Cart = @"$AddProduct2Cart";
/// 加入收藏夹
static NSString *const kAddProduct2WishList = @"$AddProduct2WishList";
/// 打开应用
static NSString *const kStartApp = @"$StartApp";
/// 开始结算
static NSString *const kStartCheckout = @"$StartCheckout";
/// 参与营销
static NSString *const kViewCampaign = @"$ViewCampaign";
/// 结算过程
static NSString *const kViewCheckoutStep = @"$ViewCheckoutStep";
/// 获取虚拟币
static NSString *const kWinVirtualCoin = @"$WinVirtualCoin";
/// 购买商品
static NSString *const kCompletePurchase = @"$CompletePurchase";
/// 获取线索
static NSString *const kObtainLeads = @"$ObtainLeads";
/// 加入群组
static NSString *const kJoinUserGroup = @"$JoinUserGroup";
/// 开启关卡
static NSString *const kCompleteLevel = @"$CompleteLevel";
/// 完成关卡
static NSString *const kStartLevel = @"$StartLevel";
/// 等级提升
static NSString *const kUpgradeLevel = @"$UpgradeLevel";
/// 登录
static NSString *const kSignIn = @"$SignIn";
/// 提交分数
static NSString *const kSubmitScore = @"$SubmitScore";
/// 展示订单
static NSString *const kCreateOrder = @"$CreateOrder";
/// 退款
static NSString *const kRefundOrder = @"$RefundOrder";
/// 移除购物车中商品
static NSString *const kDelProductFromCart = @"$DelProductFromCart";
/// 搜索
static NSString *const kSearch = @"$Search";
/// 点击内容
static NSString *const kViewContent = @"$ViewContent";
/// 填写结算选项
static NSString *const kUpdateCheckoutOption = @"$UpdateCheckoutOption";
/// 分享
static NSString *const kShareContent = @"$ShareContent";
/// 注册
static NSString *const kRegisterAccount = @"$RegisterAccount";
/// 消费虚拟币
static NSString *const kConsumeVirtualCoin = @"$ConsumeVirtualCoin";
/// 开启教程
static NSString *const kStartTutorial = @"$StartTutorial";
/// 完成教程
static NSString *const kCompleteTutorial = @"$CompleteTutorial";
/// 解锁成就
static NSString *const kObtainAchivement = @"$ObtainAchivement";
/// 查看商品
static NSString *const kViewProduct = @"$ViewProduct";
/// 查看商品列表
static NSString *const kViewProductList = @"$ViewProductList";
/// 查看搜索结果
static NSString *const kViewSearchResult = @"$ViewSearchResult";
/// 更新会员等级
static NSString *const kUpdateMembershipLevel = @"$UpdateMembershipLevel";
/// 筛选商品
static NSString *const kFiltrateProduct = @"$FiltrateProduct";
/// 查看商品分类
static NSString *const kViewCategory = @"$ViewCategory";
/// 更新订单
static NSString *const kUpdateOrder = @"$UpdateOrder";
/// 取消订单
static NSString *const kCancelOrder = @"$CancelOrder";
/// 订单完成
static NSString *const kCompleteOrder = @"$CompleteOrder";
/// 取消支付
static NSString *const kCancelCheckout = @"$CancelCheckout";
/// 领取优惠券
static NSString *const kObtainVoucher = @"$ObtainVoucher";
