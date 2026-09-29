// DYYY 34.5 step 5: public key-window test button
#import <UIKit/UIKit.h>

static void DYYY34InstallTestButton(void) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIWindow *window = nil;
        for (UIWindow *w in UIApplication.sharedApplication.windows) {
            if (w.isKeyWindow) { window = w; break; }
        }
        if (!window || [window viewWithTag:340055]) return;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.tag = 340055;
        button.frame = CGRectMake(70, 55, 64, 34);
        button.layer.cornerRadius = 17;
        button.backgroundColor = [UIColor colorWithWhite:0 alpha:0.55];
        [button setTitle:@"DYYY" forState:UIControlStateNormal];
        [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightSemibold];
        [button addTarget:button action:@selector(dyyy34_step5Tap:) forControlEvents:UIControlEventTouchUpInside];
        [window addSubview:button];
    });
}

%hook UIApplication
- (void)applicationDidBecomeActive:(UIApplication *)application {
    %orig(application);
    DYYY34InstallTestButton();
}
%end

@interface UIApplication (DYYY34Step5Button)
@end

%hook UIButton
%new
- (void)dyyy34_step5Tap:(id)sender {
    UIWindow *window = nil;
    for (UIWindow *w in UIApplication.sharedApplication.windows) if (w.isKeyWindow) { window = w; break; }
    UIViewController *vc = window.rootViewController;
    while (vc.presentedViewController) vc = vc.presentedViewController;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"DYYY 34.5" message:@"入口加载成功" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil]];
    [vc presentViewController:alert animated:YES completion:nil];
}
%end
