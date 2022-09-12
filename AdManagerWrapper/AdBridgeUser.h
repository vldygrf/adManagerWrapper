//
//  AdBridgeUser.h
//  AdManagerWrapper
//
//  Created by Vladislav Garifulin on 12.09.2022.
//

#ifndef AdBridgeUser_h
#define AdBridgeUser_h

#import <UIKit/UIKit.h>
#import <AdManager/AdManager-Swift.h>

@interface AdBridgeUser : NSObject

+ (void)initializeNativeAdUnitId:(NSString *)nativeAdUnitId nativeAdRefreshRate:(double)nativeAdRefreshRate;
+ (void)createBannerWithSize:(CGFloat)bannerSize orientation:(PZBannerOrientation)orientation leftTopAlignment:(LeftTopAlignment)alignment;
+ (void)setBannerAlignment:(LeftTopAlignment)alignment;
+ (void)clearBanner;

@end


#endif /* AdBridgeUser_h */
