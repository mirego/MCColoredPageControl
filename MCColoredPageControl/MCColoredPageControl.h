//
//  MCColoredPageControl.h
//  MCColoredPageControl
//
//  Created by Pierre-Luc Simard on 2013-03-26.
//  Copyright (c) 2013 Mirego, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ColoredPageControlDotTypeRound,
    ColoredPageControlDotTypeSquare
} ColoredPageControlDotType;

@protocol ColoredPageControlDelegate;

@interface MCColoredPageControl : UIView

@property (nonatomic, assign) id <ColoredPageControlDelegate> delegate;
@property (nonatomic, strong) UIColor *currentPageDotColor;
@property (nonatomic, strong) UIColor *otherPageDotColor;
@property (nonatomic, assign) ColoredPageControlDotType dotType;
@property (nonatomic, assign) CGFloat dotWidth;
@property (nonatomic, assign) CGFloat dotSpacing;
@property (nonatomic, assign) CGSize dotShadowOffset;
@property (nonatomic, assign) CGFloat dotShadowAlpha;
@property (nonatomic, assign) CGFloat dotShadowRadius;
@property (nonatomic, strong) UIColor *dotShadowColor;
@property (nonatomic, assign) BOOL touchEnabled;
@property (nonatomic, assign) BOOL showProgress;

@end


//------------------------------------------------------------------------------
#pragma mark - ColoredPageControlDelegate Protocol
//------------------------------------------------------------------------------

@protocol ColoredPageControlDelegate <NSObject>
@optional
- (void)pageControlPageDidChange:(id)pageControl;
@end
