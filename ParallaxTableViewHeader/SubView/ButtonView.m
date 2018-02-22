//
//  ButtonView.m
//  Parallax Header
//
//  Created by Hiran on 2/20/18.
//  Copyright © 2018 iLeaf solutions. All rights reserved.
//

#import "ButtonView.h"

@implementation ButtonView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if(self){
        [self baseClassInit];
        
    }
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if ((self = [super initWithCoder:aDecoder])) {
        
    }
    return self;
}

- (void)baseClassInit {
    
    [[NSBundle mainBundle]loadNibNamed:@"ButtonView" owner:self options:nil];
    [self addSubview:self.contentView];
    self.contentView.frame = self.bounds;
    [self.contentView layoutIfNeeded];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)bookNow:(id)sender{
    if([_delegate respondsToSelector:@selector(orderNowButtonAction:)]){
        [_delegate orderNowButtonAction:sender];
    }
}

- (IBAction)share:(id)sender{
    if([_delegate respondsToSelector:@selector(shareButtonAction:)]){
        [_delegate shareButtonAction:sender];

    }
}

@end
