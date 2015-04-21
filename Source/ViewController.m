//
//  ViewController.m
//  Douglas Hill, May 2014
//  https://github.com/douglashill/TopTabs
//

#import "ViewController.h"

@implementation ViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	NSLog(@"Incorrect initialiser “%s” sent to %@", __PRETTY_FUNCTION__, [self class]);
	return [self initWithName:nil];
}

- (instancetype)initWithName:(NSString *)name
{
	self = [super initWithNibName:nil bundle:nil];
	if (self == nil) return nil;
	
	[self setTitle:name];
	
	return self;
}

- (void)loadView
{
	UIView *const view = [[UIView alloc] init];
	
	UILabel *const label = [[UILabel alloc] init];
	[label setText:[self title]];
	[label sizeToFit];
	[view addSubview:label];
	[label setTranslatesAutoresizingMaskIntoConstraints:NO];
	
	[view addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
	[view addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
	
	static NSUInteger const hueLevels = 100;
	CGFloat const hue = ([[self title] hash] % (hueLevels + 1)) / (CGFloat)hueLevels;
	[view setBackgroundColor:[UIColor colorWithHue:hue saturation:1 brightness:1 alpha:1]];
	
	[view setTransform:CGAffineTransformRotate([view transform], M_PI)];
	
	[self setView:view];
}

@end
