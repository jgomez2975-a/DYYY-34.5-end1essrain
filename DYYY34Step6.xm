// DYYY 34.5 step 6: original-style two-finger long press entry
#import <UIKit/UIKit.h>

%hook UIApplication
- (void)applicationDidBecomeActive:(UIApplication *)application {
    %orig(application);
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"DYYY34Step6Loaded"];
}
%end

%hook UIWindow
- (instancetype)initWithFrame:(CGRect)frame {
    UIWindow *window = %orig(frame);
    if (window) {
        UILongPressGestureRecognizer *gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(dyyy34_step6Gesture:)];
        gesture.numberOfTouchesRequired = 2;
        gesture.minimumPressDuration = 0.6;
        [window addGestureRecognizer:gesture];
    }
    return window;
}

%new
- (void)dyyy34_step6Gesture:(UILongPressGestureRecognizer *)gesture {
    if (gesture.state != UIGestureRecognizerStateBegan) return;
    UIViewController *vc = self.rootViewController;
    while (vc.presentedViewController) vc = vc.presentedViewController;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"DYYY 34.5" message:@"双指长按入口加载成功" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil]];
    [vc presentViewController:alert animated:YES completion:nil];
}
%end
