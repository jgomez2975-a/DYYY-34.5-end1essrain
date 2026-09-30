// DYYY 34.5 step 8: lifecycle-delayed window probe, no constructor
#import <UIKit/UIKit.h>

static void DYYY34Step8Install(void) {
    dispatch_async(dispatch_get_main_queue(), ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            UIWindow *window = nil;
            for (UIWindow *w in UIApplication.sharedApplication.windows) {
                if (w.isKeyWindow) { window = w; break; }
            }
            if (!window || [window viewWithTag:340088]) return;
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
            button.tag = 340088;
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

%hook UIApplication
- (void)applicationDidBecomeActive:(UIApplication *)application {
    %orig(application);
    NSString *docs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    if (docs.length) [@"step8 active\n" writeToFile:[docs stringByAppendingPathComponent:@"DYYY34-step8.txt"] atomically:YES encoding:NSUTF8StringEncoding error:nil];
    DYYY34Step8Install();
}
%end
