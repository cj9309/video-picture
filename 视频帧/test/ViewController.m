//
//  ViewController.m
//  test
//
//  Created by apple on 2017/4/6.
//  Copyright © 2017年 Cola. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVAsset.h>

#import <AVFoundation/AVAssetImageGenerator.h>

#import <AVFoundation/AVTime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    for (int i = 250; i<300; i++) {
        NSString *path = @"/Users/apple/Downloads/50351-Maroon5-Sugar[68mtv.com].mp4";
        NSURL *url = [NSURL fileURLWithPath:path];
        
        
        AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:url options:nil];
        AVAssetImageGenerator *gen = [[AVAssetImageGenerator alloc] initWithAsset:asset];

        gen.requestedTimeToleranceAfter = kCMTimeZero;
        gen.requestedTimeToleranceBefore = kCMTimeZero;
        gen.appliesPreferredTrackTransform = YES;
        
        CGFloat num = i;
        
        CMTime time = CMTimeMakeWithSeconds(num/10, 600);
        NSError *error = nil;
        CMTime actualTime;
        CGImageRef image = [gen copyCGImageAtTime:time actualTime:&actualTime error:&error];
        UIImage *img = [[UIImage alloc] initWithCGImage:image];
        CGImageRelease(image);
        
        
        
        
        NSData *data = UIImagePNGRepresentation(img);
        NSString *str = [NSString stringWithFormat:@"/Users/apple/Desktop/图片/截图%d.png",i];
        [data writeToFile:str atomically:YES];
        
    }
    
}


@end
