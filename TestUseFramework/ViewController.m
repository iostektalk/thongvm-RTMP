//
//  ViewController.m
//  TestUseFramework
//
//  Created by Minh Thong on 4/25/16.
//  Copyright © 2016 Minh Thong. All rights reserved.
//

#import "ViewController.h"
#import <librtmp/VMTRTMPSession.h>
@interface ViewController () <VMTRTMPSessionDelegate>
@property (nonatomic, strong) VMTRTMPSession* rtmp;
@property (weak, nonatomic) IBOutlet UIView *cameraView;

@end

@implementation ViewController
-(void)rtmpConnectionStatus:(RTMPConnectState)sessionState{
    if (sessionState == RTMPConnectStateStarted) {
        NSLog(@"Stream is starting");
    }
    if (sessionState == RTMPConnectStateConnected) {
        NSLog(@"Connected");
    }
}
-(IBAction)didTouchedConnect:(id)sender{
    [self.rtmp openRtmpURL:@"rtmp://127.0.0.1/app/folder"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect rect = [[UIScreen mainScreen] bounds];
    self.rtmp = [[VMTRTMPSession alloc] initWithSize:rect];
    [self.cameraView addSubview:self.rtmp.cameraView];
    self.rtmp.cameraView.frame = self.cameraView.bounds;
    self.rtmp.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
