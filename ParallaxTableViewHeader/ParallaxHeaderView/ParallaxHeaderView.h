//
//  ParallaxHeaderView.h
//  ParallaxTableViewHeader
//
//  Created by Hiran on 2/20/18.
//  Copyright © 2018 iLeaf solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParallaxHeaderView : UIView

+ (id)parallaxHeaderViewWithSubView:(UIView *)subView withButtonView:(UIView*)buttonView;
- (void)refreshHeaderForScrollViewOffset:(CGPoint)offset;

@end
