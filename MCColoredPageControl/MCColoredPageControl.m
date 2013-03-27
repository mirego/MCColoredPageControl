//
//  MCColoredPageControl.m
//  MCColoredPageControl
//
//  Created by Pierre-Luc Simard on 2013-03-26.
//  Copyright (c) 2013 Mirego, Inc. All rights reserved.
//

#import "MCColoredPageControl.h"
#import <QuartzCore/QuartzCore.h>

@implementation MCColoredPageControl

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        [self setBackgroundColor:[UIColor clearColor]];
        
        // Default colors.
        _currentPageDotColor = [UIColor blackColor];
        _otherPageDotColor = [UIColor grayColor];
        
        // Default settings
        _dotType = ColoredPageControlDotTypeRound;
        _dotWidth = 7.0f;
        _dotSpacing = 7.0f;
        _touchEnabled = YES;
        
        // Shadow defaults
        _dotShadowColor = nil;
        _dotShadowAlpha = self.layer.shadowOpacity;
        _dotShadowRadius = self.layer.shadowRadius;
        _dotShadowOffset = self.layer.shadowOffset;
        
    }
    return self;
}


- (void)setCurrentPage:(NSInteger)page
{
    _currentPage = MIN(MAX(0, page), _numberOfPages - 1);
    [self setNeedsDisplay];
}


- (void)setNumberOfPages:(NSInteger)pages
{
    _numberOfPages = MAX(0, pages);
    _currentPage = MIN(MAX(0, _currentPage), _numberOfPages - 1);
    [self setNeedsDisplay];
}


//------------------------------------------------------------------------------
#pragma mark - UIResponder
//------------------------------------------------------------------------------
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!_delegate) return;
    if (!_touchEnabled) return;
    
    CGPoint touchPoint = [[[event touchesForView:self] anyObject] locationInView:self];
    
    CGFloat dotSpanX = _numberOfPages * (_dotWidth + _dotSpacing);
    CGFloat dotSpanY = _dotWidth + _dotSpacing;
    
    CGRect currentBounds = self.bounds;
    CGFloat x = touchPoint.x + (dotSpanX / 2.0f) - CGRectGetMidX(currentBounds);
    CGFloat y = touchPoint.y + (dotSpanY / 2.0f) - CGRectGetMidY(currentBounds);
    
    if ((x < 0) || (x > dotSpanX) || ( y < 0) || (y > dotSpanY)) return;
    
    _currentPage = floor(x / (_dotWidth + _dotSpacing));
    if ([_delegate respondsToSelector:@selector(pageControlPageDidChange:)]) {
        [_delegate pageControlPageDidChange:self];
    }
}

//------------------------------------------------------------------------------
#pragma mark - UIView
//------------------------------------------------------------------------------
- (void)drawRect:(CGRect)rect
{
    CGRect currentBounds = self.bounds;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetAllowsAntialiasing(context, true);
    
    CGContextSaveGState(context);
    if(_dotShadowColor) {
        CGContextSetShadowWithColor(context, _dotShadowOffset, _dotShadowRadius, [_dotShadowColor colorWithAlphaComponent:_dotShadowAlpha].CGColor);
    }
    
    CGFloat dotsWidth = _numberOfPages * _dotWidth + MAX(0, _numberOfPages - 1) * _dotSpacing;
    CGFloat x = CGRectGetMidX(currentBounds) - dotsWidth / 2.0f;
    CGFloat y = CGRectGetMidY(currentBounds) - _dotWidth / 2.0f;

    for (int i = 0; i < _numberOfPages; i++) {
        // Draw dot
        CGRect dotRect = CGRectMake(x, y, _dotWidth, _dotWidth);
        if (i == _currentPage) {
            CGContextSetFillColorWithColor(context, _currentPageDotColor.CGColor);
        } else if (_showProgress && i < _currentPage) {
            CGContextSetFillColorWithColor(context, _currentPageDotColor.CGColor);
        } else {
            CGContextSetFillColorWithColor(context, _otherPageDotColor.CGColor);
        }
        
        if(_dotType == ColoredPageControlDotTypeRound) {
            CGContextFillEllipseInRect(context, dotRect);
        } else if(_dotType == ColoredPageControlDotTypeSquare) {
            CGContextFillRect(context, dotRect);
        }
        
        x += _dotWidth + _dotSpacing;
    }
    
    CGContextRestoreGState(context);
}

@end
