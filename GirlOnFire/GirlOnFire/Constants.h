//
//  Constants.h
//  HydePark
//
//  Created by Ahmed Sadiq on 14/05/2015.
//  Copyright (c) 2015 TxLabz. All rights reserved.
//

#ifndef ServiceDesk_Constants_h
#define ServiceDesk_Constants_h

#define SERVER_URL @"http://gamelootnetwork.com/loot_hub/functions/api/page.php"
#define SERVER_SIGNUP @"userSignup"
#define SERVER_UPGRADE @"upgradeMembership"
#define SERVER_LOGIN @"userLogin"
#define SERVER_FORGOT @"forgotPassword"
#define SERVER_GET_PROFILE @"getProfile"
#define SERVER_LOGOUT @"userLogout"
#define SERVER_GET_GAMES @"getGamesList"
#define SERVER_GET_DEEPLINK @"generateDeepLinks"
#define SERVER_GET_RESULTS @"getResult"
#define SERVER_UPDATE_TOKENS @"selectGameById"
#define SERVER_UPDATE_HIDDEN_STATUS @"updateHiddenStatus"

#pragma mark-
#pragma mark Screen Sizes
#define IS_IPHONE_6 ([[UIScreen mainScreen] bounds].size.height == 667)
#define IS_IPHONE_5 ([[UIScreen mainScreen] bounds].size.height == 568)
#define IS_IPHONE_4 ([[UIScreen mainScreen] bounds].size.height == 480)
#define IS_IPAD ([[UIScreen mainScreen] bounds].size.height == 1024)

#endif
