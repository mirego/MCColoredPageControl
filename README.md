# MCColoredPageControl - Fully customizable alternative to UIPageControl
[![Badge w/ Version](https://cocoapod-badges.herokuapp.com/v/MCColoredPageControl/badge.png)](https://cocoadocs.org/docsets/MCColoredPageControl)
[![Badge w/ Platform](https://cocoapod-badges.herokuapp.com/p/MCColoredPageControl/badge.png)](https://cocoadocs.org/docsets/MCColoredPageControl)

```objective-c
#import "MCColoredPageControl.h"

- (void)funWithColoredPageControl
{
  MCColoredPageControl* pageControl = [[MCColoredPageControl alloc] initWithFrame:CGRectZero];
  [pageControl setNumberOfPages:10];
  [pageControl setCurrentPage:1];

  // You can change the color of the dots
  [pageControl setCurrentPageDotColor:[UIColor redColor]];
  [pageControl setOtherPageDotColor:[UIColor grayColor]];

  // Don't like rounds? Use squares
  [pageControl setDotType:ColoredPageControlDotTypeSquare];

  // Change size of the dots.
  [pageControl setDotWidth:12.0];

  // Change the spacing between each one.
  [pageControl setDotSpacing:5.0];

  // Add a shadow
  [pageControl setDotShadowOffset:1.0];
  [pageControl setDotShadowAlpha:0.8];
  [pageControl setDotShadowRadius;1.0];
  [pageControl setDotShadowColor:[UIColor blackColor]];

  // Use it as a progress bar indicator.
  // All dots before the current dot use the current dot color.
  [pageControl setShowProgress:YES];
}
```

## Adding to your project

If you're using [`CocoaPods`](http://cocoapods.org/), there's nothing simpler.
Add the following to your [`Podfile`](http://docs.cocoapods.org/podfile.html)
and run `pod install`

```ruby
pod 'MCColoredPageControl', :git => 'https://github.com/mirego/MCColoredPageControl.git'
```

Don't forget to `#import "MCColoredPageControl.h"` where it's needed.


## License

MCColoredPageControl is © 2013 [Mirego](http://www.mirego.com) and may be freely
distributed under the [New BSD license](http://opensource.org/licenses/BSD-3-Clause).
See the [`LICENSE.md`](https://github.com/mirego/MCColoredPageControl/blob/master/LICENSE.md) file.

## About Mirego

Mirego is a team of passionate people who believe that work is a place where you can innovate and have fun. We proudly build mobile applications for [iPhone](http://mirego.com/en/iphone-app-development/ "iPhone application development"), [iPad](http://mirego.com/en/ipad-app-development/ "iPad application development"), [Android](http://mirego.com/en/android-app-development/ "Android application development"), [Blackberry](http://mirego.com/en/blackberry-app-development/ "Blackberry application development"), [Windows Phone](http://mirego.com/en/windows-phone-app-development/ "Windows Phone application development") and [Windows 8](http://mirego.com/en/windows-8-app-development/ "Windows 8 application development") in beautiful Quebec City.

We also love [open-source software](http://open.mirego.com/) and we try to extract as much code as possible from our projects to give back to the community.
