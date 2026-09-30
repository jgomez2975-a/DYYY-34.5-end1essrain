// DYYY 34.5 step 7: load marker and delayed window probe
#import <UIKit/UIKit.h>

static void DYYY34WriteLoadMarker(void) {
    @autoreleasepool {
        NSString *docs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
        if (docs.length) {
            NSString *path = [docs stringByAppendingPathComponent:@"DYYY34-loaded.txt"];
            NSString *text = [NSString stringWithFormat:@"loaded %@\n", [NSDate date]];
            [text writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
        }
    }
}

static void DYYY34InstallWindowProbe(void) {
    dispatch_async(dispatch_get_main_queue(), ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            UIWindow *window = nil;
            for (UIWindow *w in UIApplication.sharedApplication.windows) {
                if (w.isKeyWindow || w.windowLevel == UIWindowLevelNormal) { window = w; if (w.isKeyWindow) break; }
            }
            if (!window || [window viewWithTag:340077]) return;
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
            button.tag = 340077;
            button.frame = CGRectMake(70, 55, 70, 34);
            button.layer.cornerRadius = 17;
            button.backgroundColor = [UIColor colorWithWhite:0 alpha:0.65];
            [button setTitle:@"DYYY" forState:UIControlStateNormal];
            [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightSemibold];
            [window addSubview:button];
        });
    });
}

__attribute__((constructor)) static void DYYY34Step7Constructor(void) {
    DYYY34WriteLoadMarker();
    DYYY34InstallWindowProbe();
}
