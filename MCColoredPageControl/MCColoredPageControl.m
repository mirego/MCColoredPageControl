// Copyright (c) 2013, Mirego
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// - Redistributions of source code must retain the above copyright notice,
//   this list of conditions and the following disclaimer.
// - Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
// - Neither the name of the Mirego nor the names of its contributors may
//   be used to endorse or promote products derived from this software without
//   specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.


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
