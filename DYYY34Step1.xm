// DYYY 34.5 step 1: public UIKit only
#import <UIKit/UIKit.h>

%hook UIApplication

- (void)applicationDidBecomeActive:(UIApplication *)application {
    %orig(application);
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"DYYY34Step1Loaded"];
}

%end
