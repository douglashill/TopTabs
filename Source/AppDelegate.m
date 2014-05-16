//
//  AppDelegate.m
//  Douglas Hill, May 2014
//  https://github.com/douglashill/TopTabs
//

#import "AppDelegate.h"
#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	NSMutableArray *viewControllers = [NSMutableArray array];
	for (int idx = 1; idx <= 5; ++idx) {
		[viewControllers addObject:[[ViewController alloc] initWithName:[NSString stringWithFormat:@"VC %d", idx]]];
	}
	
	UITabBarController *tabBabController = [[UITabBarController alloc] init];
	[tabBabController setViewControllers:viewControllers];
	
	[self setWindow:[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]];
	[[self window] setRootViewController:tabBabController];
	[[self window] makeKeyAndVisible];
	
	[[tabBabController view] setTransform:CGAffineTransformRotate([[tabBabController view] transform], M_PI)];
	[[tabBabController tabBar] setTransform:CGAffineTransformRotate([[tabBabController tabBar] transform], M_PI)];
	
    return YES;
}

@end
