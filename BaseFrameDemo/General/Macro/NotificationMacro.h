
//
//  NotificationMacro.h
//  CHBaseFrame
//  通知的宏定义
//  Created by Jimmy on 2017/6/27.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#ifndef NotificationMacro_h
#define NotificationMacro_h

//Common Notificaitons
static NSString *kNotificationRefreshRequired = @"RefreshRequiredNotification";
static NSString *kNotificationOnLogin = @"kOnLoginNotification";
static NSString *kNotificationOnLogout = @"kOnLogoutNotification";
static NSString *kNotificationReLoginRequired = @"kNotificationReLoginRequired";
static NSString *kNotificationForceLogout = @"kNotificationForceLogout";
static NSString *kNotificationServerMaintance = @"kNotificationServerMaintance";
static NSString *kNotificationNetworkReachabilityStatus = @"kNetworkReachabilityStatusNotification";
static NSString *kNotificationSetCity = @"kNotificationSetCity";
static NSString *kNotificationCityChanged = @"kNotificationCityChanged";
static NSString *kNotificationLocating = @"kNotificationLocating";
static NSString *kNotificationLocationSuccess = @"kNotificationLocationSuccess";
static NSString *kNotificationAppDidBecomeActive = @"kNotificationAppDidBecomeActive";
static NSString *kNotificationWXLoginSuccess = @"kNotificationWXLoginSuccess";
static NSString *kNotificationWXLoginFailure = @"kNotificationWXLoginFailure";
static NSString *kNotificationWXPay = @"kNotificationWXPay";
static NSString *kNotificationTabbarChanged = @"kNotificationTabbarChanged";
static NSString *kNotificationTabChanged = @"kNotificationTabChanged";

//Comment Event Name
static NSString *kServiceCellServiceEvent = @"kServiceCellServiceEvent";
static NSString *kSetMealStoreServiceEvent = @"kSetMealStoreServiceEvent";
static NSString *kMyServiceAccessEvent = @"kMyServiceAccessEvent";
static NSString *kMyServiceValicationEvent = @"kMyServiceValicationEvent";
static NSString *kMyServicePhoneEvent = @"kMyServicePhoneEvent";

static NSString *kSearchGoodsAccessEvent = @"kSearchGoodsAccessEvent";
static NSString *kSearchStoresAccessEvent = @"kSearchStoresAccessEvent";

//Home
static NSString *kHomeMoreEvent = @"kHomeMoreEvent";
static NSString *kHomeBannerEvent = @"kHomeBannerEvent";
static NSString *kHomeRecommendGoodsEvent = @"kHomeRecommendGoodsEvent";
static NSString *kHomeCityLocationEvent = @"kHomeCityLocationEvent";

//Order
static NSString *kOrderStoreDetailEvent = @"kOrderStoreDetailEvent";
static NSString *kOrderDeleteOrderEvent = @"kOrderDeleteOrderEvent";
static NSString *kOrderRechangeEvent = @"kOrderRechangeEvent";
static NSString *kOrderCancelOrderEvent = @"kOrderCancelOrderEvent";
static NSString *kOrderPaymentEvent = @"kOrderPaymentEvent";
static NSString *kOrderConfirmOrderEvent = @"kOrderConfirmOrderEvent";
static NSString *kOrderCommentOrderEvent = @"kOrderCommentOrderEvent";
static NSString *kOrderUserServiceEvent = @"kOrderUserServiceEvent";
static NSString *kOrderUpdateTimeEvent = @"kOrderUpdateTimeEvent";
static NSString *kOrderUseCouponEvent = @"kOrderUseCouponEvent";

//Store
static NSString *kStoreServieOrderEvent = @"kStoreServieOrderEvent";
static NSString *kStoreRescueNavigationEvent = @"kStoreRescueNavigationEvent";
static NSString *kStoreRescuePhoneEvent = @"kStoreRescuePhoneEvent";
static NSString *kStoreRescueLocationEvent = @"kStoreRescueLocationEvent";

//Mine
static NSString *kMineFooterPhoneEvent = @"kMineFooterPhoneEvent";
static NSString *kMineHeaderCheckEvent = @"kMineHeaderCheckEvent";
static NSString *kMineRechargeEvent = @"kMineRechargeEvent";
static NSString *kMineTransferEvent = @"kMineTransferEvent";
static NSString *kMineMySetmealEvent = @"kMineMySetmealEvent";
static NSString *kMineMyPointEvent = @"kMineMyPointEvent";
static NSString *kMineMyMoneyEvent = @"kMineMyMoneyEvent";
static NSString *kMineMyProfityEvent = @"kMineMyProfityEvent";
static NSString *kMineMyCouponEvent = @"kMineMyCouponEvent";
static NSString *kMineMySetMealStoreEvent = @"kMineMySetMealStoreEvent";
static NSString *kMineMySetMealServiceEvent = @"kMineMySetMealServiceEvent";
static NSString *kMineHeaderSettingEvent = @"kMineHeaderSettingEvent";
static NSString *kMineHeaderMessageEvent = @"kMineHeaderMessageEvent";
static NSString *kMineImageSelecteEvent = @"kMineImageSelecteEvent";

//ShoppingCart
static NSString *kShoppingCartAllSelectedEvent = @"kShoppingCartAllSelectedEvent";
static NSString *kShoppingCartSelectedEvent = @"kShoppingCartSelectedEvent";
static NSString *kShoppingCartSubmitEvent = @"kShoppingCartSubmitEvent";
static NSString *kShoppingCartDeleteEvent = @"kShoppingCartDeleteEvent";
static NSString *kShoppingCartUpdateCountOfGoodsEvent = @"kShoppingCartUpdateCountOfGoodsEvent";

//UserDefault
static NSString *kCurrentSelectedCity = @"kCurrentSelectedCity";
static NSString *kLastSelectedCity = @"kLastSelectedCity";
static NSString *kLocalSettingsKeyVersionIgnored = @"kLocalSettingsKeyVersionIgnored";
static NSString *kLocalSettingsKeyUserToken = @"kLocalSettingsKeyUserToken";
static NSString *kLocalSettingsKeyUserInfo = @"kLocalSettingsKeyUserInfo";
static NSString *kLocalSettingsKeySetCity = @"kLocalSettingsKeySetCity";
static NSString *kLocalSettingsKeyWXLoginInfo = @"kLocalSettingsKeyWXLoginInfo";
static NSString *kLocalSettingsKeyLoginName = @"kLocalSettingsKeyLoginName";

#endif /* NotificationMacro_h */
