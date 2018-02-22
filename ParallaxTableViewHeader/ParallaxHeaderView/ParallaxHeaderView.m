//
//  ParallaxHeaderView.m
//  ParallaxTableViewHeader
//
//  Created by Hiran on 2/20/18.
//  Copyright © 2018 iLeaf solutions. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ParallaxHeaderView.h"
#import "TableHeader.h"

static CGFloat kButtonPadding = 30;

@interface ParallaxHeaderView ()

@property (weak, nonatomic) IBOutlet UIScrollView *imageScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *subView;
@property (weak, nonatomic) IBOutlet UIView *buttonView;

@property (nonatomic) IBOutlet UIImageView *bluredImageView;
@end

#define kDefaultHeaderFrame CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)


@implementation ParallaxHeaderView

+ (id)parallaxHeaderViewWithSubView:(UIView *)subView withButtonView:(UIView*)buttonView
{
    ParallaxHeaderView *headerView = [[ParallaxHeaderView alloc] initWithFrame:CGRectMake(0, 0, subView.frame.size.width, subView.frame.size.height+buttonView.frame.size.height-kButtonPadding)];
    [headerView initialSetupForCustomSubView:subView withButtonView:buttonView];
    return headerView;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    if (self.subView)
        [self initialSetupForCustomSubView:self.subView withButtonView:self.buttonView];
   
}


- (void)refreshHeaderForScrollViewOffset:(CGPoint)offset
{
    CGRect buttonViewFrame = self.buttonView.frame;

    if (offset.y < 0)
    {
        CGFloat delta = 0.0f;
        CGRect rect = kDefaultHeaderFrame;
        delta = fabs(MIN(0.0f, offset.y));
        rect.origin.y -= delta;
        rect.size.height += delta;
        self.imageScrollView.frame = rect;
        self.buttonView.frame = buttonViewFrame;
        self.buttonView.frame = CGRectMake(0, _subView.frame.size.height-kButtonPadding-delta, self.buttonView.frame.size.width, self.buttonView.frame.size.height);
        self.clipsToBounds = NO;

    }
}


#pragma mark -
#pragma mark Private

- (void)initialSetupForCustomSubView:(UIView *)subView withButtonView:(UIView*)buttonView
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    self.imageScrollView = scrollView;
    self.subView = subView;
    self.buttonView = buttonView;
    subView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.imageScrollView addSubview:subView];
    self.bluredImageView = [[UIImageView alloc] initWithFrame:subView.frame];
    self.bluredImageView.autoresizingMask = subView.autoresizingMask;
    self.bluredImageView.alpha = 0.0f;
    [self.imageScrollView addSubview:self.bluredImageView];
    [self addSubview:self.imageScrollView];
    [self addSubview:self.buttonView];
}


@end
