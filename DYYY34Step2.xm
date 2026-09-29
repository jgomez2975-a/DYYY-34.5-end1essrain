// DYYY 34.5 step 2: public hook plus one settings-page hook
#import <UIKit/UIKit.h>

%hook UIApplication
- (void)applicationDidBecomeActive:(UIApplication *)application {
    %orig(application);
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"DYYY34Step2Loaded"];
}
%end

@interface AWESettingBaseViewController : UIViewController
- (BOOL)useCardUIStyle;
@end

%hook AWESettingBaseViewController
- (BOOL)useCardUIStyle {
    return YES;
}
%end
