// DYYY 34.5 step 4: minimal settings entry UI
#import <UIKit/UIKit.h>

%hook UIApplication
- (void)applicationDidBecomeActive:(UIApplication *)application {
    %orig(application);
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"DYYY34Step4Loaded"];
}
%end

@interface AWESettingBaseViewController : UIViewController
- (BOOL)useCardUIStyle;
@end
%hook AWESettingBaseViewController
- (BOOL)useCardUIStyle { return YES; }
%end

@interface AWELeftSideBarWeatherLabel : UILabel
@end
%hook AWELeftSideBarWeatherLabel
- (id)initWithFrame:(CGRect)frame {
    id r = %orig(frame);
    self.hidden = YES;
    return r;
}
%end

@interface AWELeftSideBarWeatherView : UIView
@end
%hook AWELeftSideBarWeatherView
- (void)layoutSubviews { %orig; self.hidden=YES; }
%end

@interface AWELeftSideBarTopIconHorizontalView : UIView
@end
%hook AWELeftSideBarTopIconHorizontalView
- (void)didMoveToSuperview {
    %orig;
    if (!self.superview || [self viewWithTag:340045]) return;
    UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
    button.tag=340045;
    button.frame=CGRectMake(0,0,52,32);
    [button setTitle:@"DYYY" forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont systemFontOfSize:12 weight:UIFontWeightSemibold];
    [button addTarget:self action:@selector(dyyy34_step4Tapped:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}
%new
- (void)dyyy34_step4Tapped:(id)sender {
    UIWindow *window=nil;
    for (UIWindow *w in UIApplication.sharedApplication.windows) if (w.isKeyWindow) { window=w; break; }
    UIViewController *vc=window.rootViewController;
    while (vc.presentedViewController) vc=vc.presentedViewController;
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"DYYY 34.5" message:@"设置入口测试成功" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil]];
    [vc presentViewController:alert animated:YES completion:nil];
}
%end
