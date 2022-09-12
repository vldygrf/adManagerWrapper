//
//  AdBridgeUser.m
//  AdManagerWrapper
//
//  Created by Vladislav Garifulin on 12.09.2022.
//

#import "AdBridgeUser.h"
#import "Unity/AdBridge.h"

void didCompleteAdInitializationCallback() {
    [AdBridgeUser createBannerWithSize:200 orientation:PZBannerOrientationVertical leftTopAlignment:LeftTopAlignmentSame];
}

void didFinishLoadNativeCallback(const char *adFormat, const char *adUnitIdentifier, const char *network) {
    NSLog(@"didFinishLoadNative: adFormat = %@, adUnitIdentifier = %@", [NSString stringWithCString:adFormat encoding:NSUTF8StringEncoding], [NSString stringWithCString:adUnitIdentifier encoding:NSUTF8StringEncoding]);
}

void didFailToLoadNativeCallback(const char *adFormat, const char *adUnitIdentifier, const char *network, const char *error) {
    NSLog(@"didFailToLoadNative: adFormat = %@, adUnitIdentifier = %@", [NSString stringWithCString:adFormat encoding:NSUTF8StringEncoding], [NSString stringWithCString:adUnitIdentifier encoding:NSUTF8StringEncoding]);
}

void didClickOnNativeCallback(const char *adFormat, const char *adUnitIdentifier, const char *network) {
    NSLog(@"didClickOnNative: adFormat = %@, adUnitIdentifier = %@", [NSString stringWithCString:adFormat encoding:NSUTF8StringEncoding], [NSString stringWithCString:adUnitIdentifier encoding:NSUTF8StringEncoding]);
}

void didTrackImpressionNative(const char *adFormat, const char *adUnitIdentifier, const char *network, double revenue) {
    NSLog(@"didTrackImpression: adFormat = %@, adUnitIdentifier = %@", [NSString stringWithCString:adFormat encoding:NSUTF8StringEncoding], [NSString stringWithCString:adUnitIdentifier encoding:NSUTF8StringEncoding]);
}

@implementation AdBridgeUser

+ (void)initializeNativeAdUnitId:(NSString *)nativeAdUnitId nativeAdRefreshRate:(double)nativeAdRefreshRate {
    initialize([nativeAdUnitId cStringUsingEncoding:NSUTF8StringEncoding], nativeAdRefreshRate, true);
    setDidCompleteAdInitializationCallback(didCompleteAdInitializationCallback);
    setDidFinishLoadNativeCallback(didFinishLoadNativeCallback);
    setDidFailToLoadNativeCallback(didFailToLoadNativeCallback);
    setDidClickOnNativeCallback(didClickOnNativeCallback);
    setDidTrackImpressionNativeCallback(didTrackImpressionNative);
}

+ (void)createBannerWithSize:(CGFloat)bannerSize orientation:(PZBannerOrientation)orientation leftTopAlignment:(LeftTopAlignment)alignment {
    loadBanner(bannerSize, orientation, alignment);
}

+ (void)setBannerAlignment:(LeftTopAlignment)alignment {
    setBannerAlignment(alignment);
}

+ (void)clearBanner {
    clearBanner();
}

@end
