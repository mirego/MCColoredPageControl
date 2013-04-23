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

#import <UIKit/UIKit.h>

typedef enum {
    ColoredPageControlDotTypeRound,
    ColoredPageControlDotTypeSquare
} ColoredPageControlDotType;

@protocol ColoredPageControlDelegate;

@interface MCColoredPageControl : UIView

@property (nonatomic, assign) id <ColoredPageControlDelegate> delegate;
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, assign) NSInteger numberOfPages;
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
