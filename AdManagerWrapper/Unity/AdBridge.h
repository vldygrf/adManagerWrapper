//
//  AdBridge.h
//  AdManagerWrapper
//
//  Created by Vladislav Garifulin on 08.09.2022.
//

#ifndef AdBridge_h
#define AdBridge_h

#import <UIKit/UIKit.h>
#import <AdManager/AdManager-Swift.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef void (*ParamlessCallback)();
typedef void (*DidFinishLoadNativeCallback)(const char *adFormat, const char *adUnitIdentifier, const char *network);
typedef void (*DidFailToLoadNativeCallback)(const char *adFormat, const char *adUnitIdentifier, const char *network, const char *error);
typedef void (*DidClickOnNativeCallback)(const char *adFormat, const char *adUnitIdentifier, const char *network);
typedef void (*DidTrackImpressionNativeCallback)(const char *adFormat, const char *adUnitIdentifier, const char *network, double revenue);

void initialize(const char* nativeAdUnitId, double nativeAdRefreshRate, bool gdprConsentGranted);
void setDidCompleteAdInitializationCallback(ParamlessCallback _didCompleteAdInitializationCallback);
void setDidFinishLoadNativeCallback(DidFinishLoadNativeCallback _didFinishLoadNativeCallback);
void setDidFailToLoadNativeCallback(DidFailToLoadNativeCallback _didFailLoadNativeCallback);
void setDidClickOnNativeCallback(DidClickOnNativeCallback _didClickOnNativeCallback);
void setDidTrackImpressionNativeCallback(DidTrackImpressionNativeCallback _didTrackImpressionNativeCallback);
void loadBanner(CGFloat bannerSize, PZBannerOrientation orientation, LeftTopAlignment alignment);
void clearBanner();
void setBannerAlignment(LeftTopAlignment leftTopAlignment);
void setGDPRConsentStatus(BOOL granted);

#ifdef __cplusplus
}
#endif


#endif /* AdBridge_h */
