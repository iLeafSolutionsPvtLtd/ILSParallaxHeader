//
//  TableHeader.m
//  Parallax Header
//
//  Created by Hiran on 2/20/18.
//  Copyright © 2018 iLeaf solutions. All rights reserved.
//

#import "TableHeader.h"

@interface TableHeader ()<UIScrollViewDelegate>

{
    NSMutableArray *myObject;
}


@end

@implementation TableHeader

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
    
    
    
    [[NSBundle mainBundle]loadNibNamed:@"TableHeader" owner:self options:nil];
    [self addSubview:self.contentView];
    self.contentView.frame = self.bounds;
    [self.contentView layoutIfNeeded];
    
    [self.pageControl
     addTarget:self
     action:@selector(changePage:)
     forControlEvents:UIControlEventValueChanged
     ];
    
    _myScrollView.delegate = self;
    
   
}

- (void)initializeScrollView:(NSArray*)images{
    
    myObject = [[NSMutableArray alloc] initWithArray:images];
    pageControlBeingUsed = NO;
    _myScrollView.frame = self.bounds;

    CGRect screenRect = _myScrollView.frame;
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHight = screenRect.size.height;
    
    for (int i = 0; i < [myObject count]; i++) {
        
        CGRect frame;
        frame.origin.x = self.myScrollView.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self.myScrollView.frame.size;
        NSString *val = [myObject objectAtIndex:i];
        UIImage* theImage = [UIImage imageNamed:val];
        
        //UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(screenWidth*i,0,theImage.size.width ,theImage.size.height)];
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(screenWidth*i,0,screenWidth ,screenHight)];
        img.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        img.contentMode = UIViewContentModeScaleAspectFill;
        img.image = theImage;
        [self.myScrollView addSubview:img];
    }
    self.myScrollView.contentSize = CGSizeMake(self.myScrollView.frame.size.width * [myObject count], self.myScrollView.frame.size.height);
    self.pageControl.currentPage = 0;
    self.myScrollView.pagingEnabled = YES;
    self.pageControl.numberOfPages = [myObject count];
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    if (!pageControlBeingUsed) {
        // Switch the indicator when more than 50% of the previous/next page is visible
        CGFloat pageWidth = self.myScrollView.frame.size.width;
        int page = floor((self.myScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        self.pageControl.currentPage = page;
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    pageControlBeingUsed = NO;

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    pageControlBeingUsed = NO;
}

- (void)changePage:(id)sender {
    // Update the scroll view to the appropriate page
    CGRect frame;
    frame.origin.x = self.myScrollView.frame.size.width * self.pageControl.currentPage;
    frame.origin.y = 0;
    frame.size = self.myScrollView.frame.size;
    [self.myScrollView scrollRectToVisible:frame animated:YES];
    pageControlBeingUsed = YES;
    
}

- (IBAction)button:(id)sender{
    NSLog(@"sdfvASDf");
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (IBAction)back:(id)sender{
    if([_delegate respondsToSelector:@selector(backButtonAction:)]){
        [_delegate backButtonAction:sender];
    }
}

@end
