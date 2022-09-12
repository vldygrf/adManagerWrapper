//
//  AdBridge.m
//  AdManagerWrapper
//
//  Created by Vladislav Garifulin on 08.09.2022.
//

#import <UIKit/UIKit.h>
#import "AdBridge.h"

#ifdef __cplusplus
extern "C" {
#endif

ParamlessCallback didCompleteAdInitializationCallback;
DidFinishLoadNativeCallback didFinishLoadNativeCallback;
DidFailToLoadNativeCallback didFailToLoadNativeCallback;
DidClickOnNativeCallback didClickOnNativeCallback;
DidTrackImpressionNativeCallback didTrackImpressionNativeCallback;

@interface AdManagerListener : NSObject <AdManagerDelegate>
@end

@implementation AdManagerListener

- (void)didCompleteAdInitialization {
    didCompleteAdInitializationCallback();
}

- (void)didFinishLoadNativeAdWithAdFormat:(NSString * _Nonnull)adFormat adUnitIdentifier:(NSString * _Nonnull)adUnitIdentifier network:(NSString * _Nonnull)network {
    didFinishLoadNativeCallback([adFormat cStringUsingEncoding:NSUTF8StringEncoding], [adUnitIdentifier cStringUsingEncoding:NSUTF8StringEncoding], [network cStringUsingEncoding:NSUTF8StringEncoding]);
}

- (void)didFailToLoadNativeAdWithAdFormat:(NSString * _Nonnull)adFormat adUnitIdentifier:(NSString * _Nonnull)adUnitIdentifier network:(NSString * _Nonnull)network error:(NSString * _Nullable)error {
    didFailToLoadNativeCallback([adFormat cStringUsingEncoding:NSUTF8StringEncoding], [adUnitIdentifier cStringUsingEncoding:NSUTF8StringEncoding], [network cStringUsingEncoding:NSUTF8StringEncoding], [error cStringUsingEncoding:NSUTF8StringEncoding]);
}

- (void)didClickOnNativeWithAdFormat:(NSString * _Nonnull)adFormat adUnitIdentifier:(NSString * _Nonnull)adUnitIdentifier network:(NSString * _Nonnull)network {
    didClickOnNativeCallback([adFormat cStringUsingEncoding:NSUTF8StringEncoding], [adUnitIdentifier cStringUsingEncoding:NSUTF8StringEncoding], [network cStringUsingEncoding:NSUTF8StringEncoding]);
}

- (void)didTrackImpressionNativeAdWithAdFormat:(NSString * _Nonnull)adFormat adUnitIdentifier:(NSString * _Nonnull)adUnitIdentifier network:(NSString * _Nonnull)network revenue:(double)revenue {
    didTrackImpressionNativeCallback([adFormat cStringUsingEncoding:NSUTF8StringEncoding], [adUnitIdentifier cStringUsingEncoding:NSUTF8StringEncoding], [network cStringUsingEncoding:NSUTF8StringEncoding], revenue);
}

@end

AdManager *adManager;
AdManagerListener *adManagerListener;

void initialize(const char *nativeAdUnitId, double nativeAdRefreshRate, bool gdprConsentGranted) {
    adManager = [[AdManager alloc] initWithNativeAdUnitId:[NSString stringWithCString:nativeAdUnitId encoding:NSUTF8StringEncoding] nativeAdRefreshRate:nativeAdRefreshRate gdprConsentGranted:gdprConsentGranted];
    adManagerListener = [[AdManagerListener alloc] init];
    adManager.delegate = adManagerListener;
    [adManager initializeWithUserId:nil];
}

void setDidCompleteAdInitializationCallback(ParamlessCallback _didCompleteAdInitializationCallback) {
    didCompleteAdInitializationCallback = _didCompleteAdInitializationCallback;
}

void setDidFinishLoadNativeCallback(DidFinishLoadNativeCallback _didFinishLoadNativeCallback) {
    didFinishLoadNativeCallback = _didFinishLoadNativeCallback;
}

void setDidFailToLoadNativeCallback(DidFailToLoadNativeCallback _didFailToLoadNativeCallback) {
    didFailToLoadNativeCallback = _didFailToLoadNativeCallback;
}

void setDidClickOnNativeCallback(DidClickOnNativeCallback _didClickOnNativeCallback) {
    didClickOnNativeCallback = _didClickOnNativeCallback;
}

void setDidTrackImpressionNativeCallback(DidTrackImpressionNativeCallback _didTrackImpressionNativeCallback) {
    didTrackImpressionNativeCallback = _didTrackImpressionNativeCallback;
}

void loadBanner(CGFloat bannerSize, PZBannerOrientation orientation, LeftTopAlignment alignment) {
    AlignedView *containerView = [[AlignedView alloc] initWithSize:bannerSize orientation:orientation leftTopAlignment:alignment];
    [adManager createBannerAdIn:containerView bannerSize:bannerSize orientation:orientation callback:^(UIView * _Nullable) {
        
    }];
}

void clearBanner() {
    [adManager destroyBannerAd];
}

void setBannerAlignment(LeftTopAlignment leftTopAlignment) {
    [adManager setBannerWithAlignment:leftTopAlignment];
}

void setGDPRConsentStatus(BOOL granted) {
    [adManager updateGDPRConsentWithStatus:granted];
}

#ifdef __cplusplus
}
#endif
