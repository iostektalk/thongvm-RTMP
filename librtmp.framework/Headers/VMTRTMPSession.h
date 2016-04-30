/*
 librtmp
 Copyright (c) 2016 Greeleaf iOS group VMT
 */


#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

typedef enum
{
    RTMPConnectStateNone,
    RTMPConnectStateConnected,
    RTMPConnectStateStarted,
    RTMPConnectStateEnded,
    RTMPConnectStateError
}RTMPConnectState;

@protocol VMTRTMPSessionDelegate <NSObject>
@required
- (void) rtmpConnectionStatus: (RTMPConnectState) sessionState;
@end

@interface VMTRTMPSession : NSObject
- (void) openRtmpURL:(NSString*) rtmpUrl;
- (void) close;
- (instancetype) initWithSize:(CGRect)frame;

@property (nonatomic, assign) id<VMTRTMPSessionDelegate> delegate;
@property (nonatomic, strong, readonly) UIView* cameraView;

@end
